<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>

<link href="/resources/css/pay.css" rel="stylesheet">
<link href="/resources/css/mypage.css" rel="stylesheet">
<script src="/resources/js/subscribe-check.js"></script>

<link href="/resources/css/userList.css" rel="stylesheet">
    <script>
    $(document).ready(function() {
            $("#tab_example").tabs();
        });
    </script>
</head>
<body>

<!--profile-->
    <div class="mypage-profile">
        <div class="mypage-profile-image">
        	<div class="profile-uploadedList">
            	<img src="/displayFile?fileName=${userVO.profileFullName}" class="registed-img">
            </div>
        </div>
        <div class="mypage-profile-name">
            <p>${userVO.uname}</p>
        </div>
        <div class="mypage-profile-subscribe">
			<form action="/mypage/subscriberList" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit" class="subscribedCount" id="btn-subscribedCount"></button>
			</form>
        </div>
    </div>



<script>

$(document).ready(function() {
	
	subscribedList('${login.uid}', '${login.uid}');
	
	});
</script>

<!--icon-->
	<div class="mypage-profile-icon">
		<div class="mypage-profile-icon-home">
			<form action="/mypage/titleList" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit"><img src="/resources/png/comic-g.png" id="profile-img-home"></button>
			</form>
<!-- 			<a href="/mypage/home" class="active"> -->
<!-- 			</a> -->
		</div>
		<div class="mypage-profile-icon-subscribe">
<!-- 			<a href="/user/subscribedList"> -->
			<form action="/mypage/subscribedList" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit"><img src="/resources/png/subscribe-g.png" id="profile-img-subscribed"></button>
			</form>
<!-- 			</a> -->
		</div>
		<div class="mypage-profile-icon-subscribed">
<!-- 			<a href="/user/subscriberList"> -->
			<form action="/mypage/subscriberList" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit"><img src="/resources/png/subscribed-g.png" id="profile-img-subscriber"></button>
<!-- 			</a> -->
			</form>
		</div>
		<div class="mypage-profile-icon-setting">
<!-- 			<a href="/user/setting"> -->
			<form action="/mypage/setting" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit"><img src="/resources/png/setting-g.png" id="profile-img-setting"></button>
<!-- 			</a> -->
			</form>
		</div>
		<div class="mypage-history">
				<a href="/pay/history">
					<img src="/resources/png/trade-g.png" id="history">
				</a>
			</div>
			<div class="mypage-charge">
				<a href="/pay/charge">
					<img src="/resources/png/charge-g.png" id="charge">
				</a>
			</div>
			<div class="mypage-withdraw">
				<a href="/pay/withdraw">
					<img src="/resources/png/exchange.png" id="withdraw">
				</a>
			</div>
	</div>
	
					
		        	
	<c:if test="${withdrawVO.status == '0'}">
<!-- 		출금 계좌신청이 완료 되었습니다. -->
		<div class="withdraw-registed">
        <img src="/resources/png/exchange.png" class="withdraw-img">
        <p class="withdraw-text">
            신청해주셔서 감사합니다.<br>
            검토 후 이메일로 결과를 전달드리겠습니다.
        </p>
    </div>

	</c:if>
	<c:if test="${withdrawVO.status == '1'}">
	<c:if test="${withdrawVO.type == '1'}">
<!-- 		<form class="registerForm" method="post" action="/pay/withdrawExecute"> -->
			<div id="t1" class="tab1-content tab1-withdraw">
				<input type="hidden" name="uid" value='${login.uid}' required>
				<input type="hidden" name="type" value="1" required>
				<input type="number" name="registedNo" placeholder="주민등록번호를 입력해주세요.(숫자만)" class="number hide" value="${withdrawVO.registedNo}" required readonly>
				<input type="text" name="ceoName" placeholder="이름을 입력해주세요." class="name hide" value="${withdrawVO.ceoName}" required readonly>
				
				<!-- <div class="img-div1">신분증을 첨부해주세요.(정보가 가려지거나 편집되면 안됩니다.)</div>
				<input type="file" class="img-file1" style="display: none" required>
				<script>
					$(function(){
					    $(".img-div1").click(function(event){
					        event.preventDefault();
					        $(".img-file1").click();
					    });
					});
				</script> -->
				<p class="withdraw-accounttext">계좌번호</p>
				<input type="number" name="accountNo" placeholder="계좌번호를 입력해주세요." class="account withdraw-account" value="${withdrawVO.registedNo}" required readonly>
				<p class="withdraw-nametext">예금주명</p>
				<input type="text" name="accountHolder" placeholder="예금주명을 입력해주세요." class="account-name withdraw-name" value="${withdrawVO.accountHolder}" required readonly>
				<p class="withdraw-banktext">은행</p>
				<select class="bank withdraw-bank" name="bankName" required disabled>
				    <option value="#"> 은행을 선택해주세요. </option>
				    <option value="kb"> 국민은행 </option>
				    <option value="woori"> 우리은행 </option>
				    <option value="hana"> 하나은행 </option>
				    <option value="kakao"> 카카오뱅크 </option>
				    <option value="newtown"> 새마을금고 </option>
				</select>
				<a href="/pay/withdrawModify" class="modify">
					<div>출금 정보 수정</div>				
				</a>
			</div>
			<!-- <hr>
			<div class="withdraw">
				<div class="had-pointtext">
					보유 포인트
				</div>
				<div class="had-point">
					<img class="dropbtn searchFunction" src="/resources/png/point.png">
	        		<a href="/pay/history">
		        		<span class="withdraw-totalPoint"></span>
		        	</a>
				</div>
				<div class="withdraw-pointtext">
					출금 포인트
				</div>
				<input type="number" class="withdraw-point" placeholder="100포인트가 최소입니다.">
				<div class="withdraw-moneytext">
					출금액 
				</div>
				<span class="withdraw-money"></span>
				<input type="text" class="withdraw-money" readonly>
				<a href="/pay/withdrawModify" class="apply">
					<button type="submit" class="apply">출금 신청</button>
				</a>
			</div> -->
<!-- 		</form> -->
	</c:if>
		<c:if test="${withdrawVO.type != '1'}">
			
		        <div id="t1" class="tab2-content tab2-withdraw">
		        	<input type="hidden" name="uid" value='${login.uid}' required readonly>
		            <p class="withdraw-componytext">사업형태</p>
		            <select name="type" class="select-company withdraw-compony" required disabled>
		                <option> 사업형태를 선택해주세요. </option>
		                <option value="2"> 개인사업자 </option>
		                <option value="3"> 법인사업자 </option>
		            </select>
		            <p class="withdraw-componynumbertext">사업자등록번호</p>    
		            <input type="number" name="registedNo" placeholder="사업자등록번호를 입력해주세요.(숫자만)" class="number withdraw-componynumber" value="${withdrawVO.registedNo}" required readonly>
		            <p class="withdraw-componynametext">사업자명</p>  
		            <input type="text" name="companyName" placeholder="사업자명을 입력해주세요." class="name withdraw-componyname" value="${withdrawVO.companyName}" required readonly>
		            <p class="withdraw-leadertext">대표자명</p>
		            <input type="text" name="ceoName" placeholder="대표자명을 입력해주세요." class="leader withdraw-leader" value="${withdrawVO.ceoName}" required readonly>
		            <p class="withdraw-taxationtext">과세형태</p>
		            <select name="taxType" class="taxation withdraw-taxation" required disabled>
		                <option value=""> 과세형태를 선택해주세요. </option>
		                <option value="1"> 간이과세자 </option>
		                <option value="2"> 일반과세자 </option>
		            </select>
 		           <!--  <div class="img-div2">사업자 등록증 사본을 업로드 해주세요.</div>
		            <input type="file" class="img-file2" style="display: none" required>
		            <script>
		                $(function(){
		                    $(".img-div2").click(function(event){
		                        event.preventDefault();
		                        $(".img-file2").click();
		                    });
		                });
		            </script> --> 
		            <p class="withdraw-banktext">은행</p>
		            <select name="bankName" class="bank withdraw-bank" required disabled>
		                <option> 은행을 선택해주세요. </option>
						<option value="kb"> 국민은행 </option>
		                <option value="woori"> 우리은행 </option>
		                <option value="hana"> 하나은행 </option>
		                <option value="kakao"> 카카오뱅크 </option>
		                <option value="newtown"> 새마을금고 </option>
		            </select>    
		            <p class="withdraw-accountext">은행계좌번호</p>           
		            <input type="number" name="accountNo" placeholder="계좌번호를 입력해주세요." class="account withdraw-account" value="${withdrawVO.accountNo}" required readonly>
		            <p class="withdraw-nametext">예금주명</p>
		            <input type="text" name="accountHolder" placeholder="예금주명을 입력해주세요." class="account-name withdraw-name" value="${withdrawVO.accountHolder}" required readonly>
<!-- 		            <div class="account-div2">통장 사본을 업로드 해주세요.</div> -->
		            <!-- <input type="file" class="account-file2" style="display: none" required>
		            <script>
		                $(function(){
		                    $(".account-div2").click(function(event){
		                        event.preventDefault();
		                        $(".account-file2").click();
		                    });
		                });
		            </script> -->
					<a href="/pay/withdrawModify" class="modify">
						<div>출금 정보 수정</div>				
					</a>
		        </div>
		
<!-- 				<form class="registerForm" method="post" action="/pay/withdrawExecute">
		<div><span class="withdraw-totalPoint"> Point</span></div>
		<div><input type="number" name='point' class="withdraw-point" placeholder="Point" min="100"></div>
		<div><span class="withdraw-won"></span></div>
		<div><button type="submit" class="submit">Submit</button></div>
		</form> -->
		
		<hr>
		</c:if>
		<form class="registerForm" method="post" action="/pay/withdrawExecute">
			<div class="withdraw">
				<div class="had-pointtext">
					보유 포인트
				</div>
				<div class="had-point">
					<img class="dropbtn searchFunction" src="/resources/png/point.png">
	        		<a href="/pay/history">
		        		<span class="withdraw-totalPoint"></span>
		        	</a>
				</div>
				<div class="withdraw-pointtext">
					출금 포인트
				</div>
				<input type="number" name="point" class="withdraw-point" placeholder="100포인트가 최소입니다.">
				<div class="withdraw-moneytext">
					출금액 
				</div>
<!-- 				<span class="withdraw-money"></span> -->
				<input type="text" class="withdraw-money" readonly>
<!-- 				<a href="/pay/withdrawModify" class="apply"> -->
					<button type="submit" class="apply">출금 신청</button>
<!-- 				</a> -->
			</div>
			</form>
	</c:if>
	
		
		
<script>
     	$(document).ready(function() {
     		$(".select-company").val('${withdrawVO.type}');
     		$(".taxation").val('${withdrawVO.taxType}');
     		$(".bank").val('${withdrawVO.bankName}');

     		var result = '${msg}';
			if (result == 'ERROR') {
				alert("처리 중 에러가 발생하였습니다.");
			}
     	});

	
var arr = [];
var deleteArr = [];
var checkUnload = true;

$(window).on("beforeunload", function(){
	if(checkUnload){

		console.log("arr.length = " + arr.length);
// 		console.log("listArr.length = " + listArr.length);
		
// 		deleteArr = arr.concat(arr);
		
		for(i=0; i<arr.length; i++){
			console.log("arr["+i+"] = " + arr[i]);
		}
		
		if(arr.length > 0){
			
			$.ajax({
				  type: 'POST',
				  url: "/deleteAllFiles",
				  data: {files:arr},
				  dataType : "text",
				  async:false,
				  success : function(result){
					}
				});
		}
		
		console.log("beforeunload event");
	}
	
});

// $(".img-file1, .img-file2, .account-file2").on("change", function(event) {
$("input[type='file']").on("change", function(event) {
	event.preventDefault();
	var target = $(this).prev();
	var files = event.target.files
	for(i=0; i<files.length; i++){
    	var file = event.target.files[i]
		uploadFile(file, target);
    }
});


function uploadFile(file, target){
	var formData = new FormData();
	
	formData.append("file", file);
	$.ajax({
		url : '/uploadAjax',
		data : formData,
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		success : function(data) {
			console.log("data = " + data);
			var fileInfo = getFileInfo(data);
			
// 			var html = template(fileInfo);

			arr.push(data);
				
			$(target).empty();
			var html = "<span class='uploadedList' data-src='"+fileInfo.fullName+"'>"+fileInfo.fileName+"</span>"
			$(target).append(html);
		}
	});
}

$(".registerForm").submit(function(event){
	event.preventDefault();
	checkUnload = false;

	var html ="";
	
	console.log("arr.length = " + arr.length);
	
// 	arr.pop();
// 	console.log("type = " + $("select[name='type'] option:selected").val());
// 	if($("select[name='type'] option:selected").val() != null){
// 		html += "<input type='hidden' name='type' value='"+$("select[name='type'] option:selected").val()+"'>"
// 	}
	
// 	console.log("taxType = " + $("select[name='taxType'] option:selected").val());
// 	if($("select[name='taxType'] option:selected").val() != null){
// 		html += "<input type='hidden' name='taxType' value='"+$("select[name='taxType'] option:selected").val()+"'>"
// 	}
	
// 	console.log("bankName = " + $("select[name='bankName'] option:selected").val());
// 	if($("select[name='bankName'] option:selected").val() != null){
// 		html += "<input type='hidden' name='bankName' value='"+$("select[name='bankName'] option:selected").val()+"'>"
// 	}
	
	$(".uploadedList").each(function(index){
		console.log("index = " + index);
		
		if($(this).attr("data-src") != null){
			console.log("$(this).attr('data-src) = " + $(this).attr("data-src"));
			arr.splice(arr.indexOf($(this).attr("data-src")), 1);
			html += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src") +"'> ";
		}
		
	});
	
	for(i=0; i<arr.length; i++){
		console.log("arr["+i+"] = "+ arr[i]);
	}
	
	 if(arr.length > 0){
			$.ajax({
				  type: 'POST',
				  url: "/deleteAllFiles",
				  data: {files:arr},
				  dataType : "text",
				  async:false,
				  success : function(result){
					}
			});
	}
	
	 console.log("html = " + html);
	$(this).append(html);
	$(this).get(0).submit();
});

$(".tab1").on("click", function(event) {
// 	$(".img-div1").empty().append("신분증을 첨부해주세요.(정보가 가려지거나 편집되면 안됩니다.)");
	$(".img-div2").empty().append("사업자 등록증 사본을 업로드 해주세요.");
	$(".account-div2").empty().append("통장 사본을 업로드 해주세요.");
});

$(".tab2").on("click", function(event) {
	$(".img-div1").empty().append("신분증을 첨부해주세요.(정보가 가려지거나 편집되면 안됩니다.)");
	/* $(".img-div2").empty().append("사업자 등록증 사본을 업로드 해주세요.");
	$(".account-div2").empty().append("통장 사본을 업로드 해주세요."); */
});

var uid = '${login.uid}';
$.ajax({
	type : 'post',
	url : "/pay/totalPoint/",
	headers : {
		"Content-Type" : "application/json",
		"X-HTTP-Method-Override" : "POST" },
	dataType : 'JSON',
	data : JSON.stringify({uid:uid}),
	async: false,
	success:function(result){
			$(".withdraw-totalPoint").before(result);
			$(".withdraw-point").attr("max",result);
	}
});

$(".withdraw-point").on("change", function(event) {
	var point = $(".withdraw-point").val();
	var won = point * 100 * 0.7;
// 	won = won + "원";
	$(".withdraw-money").val(won);
// 	$(".withdraw-money").append(won);
});

</script>
 



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>