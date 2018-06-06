<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>${boardVO.title}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>

  	<!-- bootstrap -->
<!--   	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!--   	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->
<!-- <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css" /> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>

<link href="/resources/css/contents.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/default.css" />
<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/component.css" />
<script src="/resources/ThumbnailGridExpandingPreview/js/modernizr.custom.js"></script>


<style type="text/css">
	.popup {position : absolute;}
	.back {background-color : gray; opacity : 0.5; width : 100%; height : 300%; overflow : hidden; z-index:1101;}
	.front {z-index : 1110; opacity : 1; boarder : 1px; margin : auto;}
	.show {position : relative; max-width : 1200px; max-height : 800; overflow : auto;}
</style>

</head>
<body>
	<form role="form" action="modifyPage" method="post">
		<input type='hidden' name='bno' value="${boardVO.bno}">
		<!-- <input type='hidden' name='page' value="${cri.page}"> --> <!-- 무한스크롤 적용을 위한 주석처리 무조건 1페이지로 이동 -->
		<!-- <input type='hidden' name='perPageNum' value="${cri.perPageNum}"> --> <!-- 무한스크롤 적용을 위한 주석처리 무조건 1페이지로 이동 -->
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">
		<input type='hidden' name='title' class="form-control" value="${boardVO.title}" readonly="readonly">
		<input type='hidden' name='subtitle' class="form-control" value="${boardVO.subtitle}" readonly="readonly">
		<input type='hidden' name="uname" class="form-control" value="${boardVO.uname}" readonly="readonly">
	</form>

	<!--contents-->
    <div class="contents">
        <div class="comic">
            ${boardVO.content}
        </div>
    </div>
    
    <!--thumb-->
    <div class="evaluate ">
        <div class="evaluate-pencil">
            <img src="/resources/png/pencil-g.png" id='likeAddBtn'>
            <img src="/resources/png/pencil.png" id='likeDelBtn'>
        </div>
        <div class="evaluate-no-1 likesDiv">
        </div>
        <div class="evaluate-eraser"  >
            <img src="/resources/png/eraser-g.png" id='unlikeAddBtn'>
            <img src="/resources/png/eraser.png" id='unlikeDelBtn'>
        </div>
        <div class="evaluate-no-2 unlikesDiv">
        </div>
        
        
    </div>

    <hr>
    
	

	
	
	
	<!-- 첨부파일 목록 및 썸네일 -->
	<!-- <ul class="mailbox-attachments clearfix uploadedList"></ul> -->
	
	<script id="templateAttach" type="text/x-handlebars-template">
		<li data-src='{{fullName}}'>
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
				<div class="mailbox-attachment-info">
				<a href="{{getLink}}" class="mailbox-attachment-name" target="_blank">{{fileName}}</a>
			</span>
			</div>
		</li>
	</script>
	
	
    <hr>
	<!--writer-->
    <div class="writer">
        <div class="writer-image">
            <a href="mypage-home.html"><img src="/resources/png/account.png"></a>
        </div>
        <div class="writer-name">
            <a href="mypage-home.html">${boardVO.uname}</a>
        </div>
        <div class="writer-information">
            <span><img src="/resources/png/comic.png">
            	<fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd HH:mm:ss "/>
            </span> 
            <span><img src="/resources/png/view.png"></span>${boardVO.viewcnt}
            <a href="#"><span><img src="/resources/png/copy-link.png"></span>copy link</a>
            <!-- <span><button class="subscribe">subscribe</button></span> -->
            <span><button type="submit" class="subscribe" id="subscribeBtn">SUBSCRIBE</button>
			<button type="submit" class="subscribed" id="unsubscribeBtn">SUBSCRIBED</button></span>
        </div>
        <div class="writer-comment">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam impedit, cumque aut incidunt nam alias et quod, placeat molestias quis, perspiciatis quia rerum repellat earum dolor beatae commodi cupiditate ipsam illum, deleniti. Doloribus optio ea similique expedita, sequi nihil nulla iusto .
        </div>
    </div>


<hr>

				
				
					
	
	<hr>
	<!--next comic-->
    <div class="strapline">
        <h4>Comic List</h4>
    </div>


	



    <div class="next-comic">
        <div class="main-comic">
            <a href="#">
            	<img src="/displayFile?fileName=${boardVO.fullName}">
            </a><br>
        </div>
        <div class="main-comic-title">
            <a href="#">${boardVO.title}</a>
        </div>
        <ul class="comic-list-left">
                <li>
                <div class="thissubtitlesDiv">
                <p class="bg-green">Subtitle List
                        <small class="thissubtitlecntSmall"></small>
                </div>
                </li>
        </ul>
        <ul id="pagination" class="pagination"></ul>
    </div>
    <hr>
    

    <!--another comic-->
    <div class="strapline">
        <h4>Another Comic</h4>
    </div>

		<ul id="og-grid" class="og-grid cards">
			<c:forEach items="${list}" var="boardVO">
				<li>
						<a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}" data-largesrc="/displayFile?fileName=${boardVO.fullName}" data-title="${boardVO.title}"
						 onclick="getSubtitle(${boardVO.bno});" data-description="${boardVO.uname}">
							<img class="thumbnail" src="/displayFile?fileName=${boardVO.fullName}" />
							
							<div class="title">
              						${boardVO.title}
          						</div>
          						
				            <div class="subtitle">
				                ${boardVO.subtitle}
				            </div>
							
							<div class="line"><img src="/resources/svg/line.svg"></div>
							<div class="thumbnail-thumb">
								<img src="/resources/png/pencil.png"><span>${boardVO.likecnt}</span>
								<img src="/resources/png/eraser.png"><span>${boardVO.unlikecnt}</span>
							</div>
							<div class="line"><img src="/resources/svg/line.svg"></div>
							
							<div class="thumbnail-writer">
				                <img src="/resources/png/account.png">
				                <span>${boardVO.uname}</span>
				            </div>
						</a>
				</li>
				
			</c:forEach>
		</ul>

    <hr>

	<div class="row">
		<div class="col-md-12">
			<div class="box box-success">
			    <!--comment-->
			    <div class="strapline">
			        <h4 id='replycntSmall'>Comment</h4>
			    </div>
				
				<c:if test="${not empty login}">
					<div class="comment">
						<input type="hidden" id="newReplyUid" value="${login.uid}" readonly="readonly">
						<input type="hidden" placeholder="USER ID" id="newReplyUname" value="${login.uname}" readonly="readonly">
						
						<textarea class="comment-text" id="newReplyText" placeholder="Comment"></textarea>
            			<button type="submit" class="comment-button" id="replyAddBtn"><img src="/resources/png/comic.png"></button>
            			
            
					</div>
					
				</c:if>
				
					
				<c:if test="${empty login}">
					<div class="box-body">
						<div><a href="/user/login">Login Please</a></div>
					</div>
				</c:if>
					
			</div>
		</div>
	</div>
	
	<%-- <div><i class="fa fa-thumbs-up" style="color:red;"></i> : ${boardVO.likecnt} / <i class="fa fa-thumbs-down"></i> : ${boardVO.likecnt}</div> --%>
	<!-- The time line -->
	<ul class="timeline">
		<!-- timeline time label -->
		<li class="time-label" id="repliesDiv">
		</li>
	</ul>
	<div class='text-center'>
		<ul id="pagination" class="pagination justify-content-center"></ul>
	</div>
	
	
	<div class="box-footer">
	<button type="submit" class="btn" id="subscribeBtn">SUBSCRIBE</button>
	<button type="submit" class="btn btn-danger" id="unsubscribeBtn">SUBSCRIBED</button>
		<c:if test="${login.uid == boardVO.uid}">
			<button type="submit" class="btn btn-warning" id="modifyPageBtn">Modify</button>
			<button type="submit" class="btn btn-danger" id="removePageBtn">REMOVE</button>
		</c:if>
			<button type="submit" class="btn btn-primary" id="listPageBtn">LIST ALL</button>
	</div>
	<!-- /.box-body -->

 	<!--another comment-->
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<li class="replyLi" data-rno={{rno}}>
    		<div class="another-comment">
				<div class="another-user-image">
            		<a href="/mypage/home"><img src="/resources/png/account.png"></a>
        		</div>
				<div class="another-user-name">
					<h4 class="modal-title" style="display:none">{{rno}}</h4>
					<a href="mypage-home.html">{{uname}}</a>
					<span class="another-user-time">{{prettifyDate regdate}}</span>
				</div>

				<div class="another-comment-modify modal-footer " data-rno={{rno}}>
{{#eqUid uid}}
            		<img class="replyModBtn" src="/resources/png/modify.png">
					<img class="replySubmitBtn" style="display:none" src="/resources/png/modify.png">
            		<img class="replyDelBtn" src="/resources/png/delete.png">
	{{/eqUid}}
        		</div>

				<div class="modal-body another-user-comment comment">
					<p><textarea class="comment-text" id="replytext" readonly>{{replytext}}</textarea></p>
				</div>

                <div class="replylikesDiv another-comment-thumb" data-rno={{rno}}>
                    <img src="/resources/png/pencil-g.png" class="replylike replylikeAddBtn" id="replyLikeAddBtn">
                    <img src="/resources/png/pencil.png" class="replylike replylikeDelBtn" id="replyLikeDelBtn">
					<span id="replylikeLi">
                    	{{replylikecnt}}
                	</span>
                    <img src="/resources/png/eraser-g.png" class="replydislike replydislikeAddBtn" id="replyDislikeAddBtn">
                    <img src="/resources/png/eraser.png" class="replydislike replydislikeDelBtn" id="replyDislikeDelBtn">
					<span id="replydislikeLi">
                    	{{replydislikecnt}}
                	</span>
                </div>

				<div class="another-comment-more">
            		<a href="#">More comments</a>
        		</div>
			</div>
		</li>
		{{/each}}
	</script>
	
	<script id="like_template" type="text/x-handlebars-template">
		{{#each .}}
			<div id="likeLi">
				{{likecnt}}
			</div>
		{{/each}}
	</script>
	
	<script id="unlike_template" type="text/x-handlebars-template">
		{{#each .}}
			<div id="unlikeLi">
				{{unlikecnt}}
			</div>
		{{/each}}
	</script>
	
	
	<script id="replylike_template" type="text/x-handlebars-template">
		{{#each .}}
				<span id="replylikeLi">
                   	{{replylikecnt}}
               	</span>
		{{/each}}
	</script>
	<script id="replydislike_template" type="text/x-handlebars-template">
		{{#each .}}
				<span id="replydislikeLi">
                   	{{replydislikecnt}}
               	</span>
		{{/each}}
	</script>
	
	<script>
		
		$(document).ready(function() {
			
            var bno = ${boardVO.bno};
			var replyPage = 1;
			getThisSubtitlePage("/subtitles/"+bno+"/5/1");
			
			
			
			getPage("/replies/"+bno+"/"+replyPage);
			getLikeList();
			subscribedList();
			$("#unsubscribeBtn").hide();
			
			

			
			Handlebars.registerHelper("prettifyDate", function(timeValue){
				var dateObj = new Date(timeValue);
				var year = dateObj.getFullYear();
				var month = dateObj.getMonth() + 1;
				var date = dateObj.getDate();
				var hours = dateObj.getHours();
				var minutes = dateObj.getMinutes();
				var seconds = dateObj.getSeconds();
				return year + "/" + month + "/" + date + " " + hours + ":" + minutes + ":" + seconds;
			});
			
			
			//로그인한 사용자가 작성한 본인의 댓글만 수정이 가능
			/* Handlebars.registerHelper("eqReplyer", function(replyer, block){ */
			Handlebars.registerHelper("eqUid", function(uid, block){
				var accum = '';
				if(uid == '${login.uid}'){
					accum += block.fn();
				}
				return accum;
			});
			
			var printData = function (replyArr, target, templateObject){
				var template = Handlebars.compile(templateObject.html());
				
				var html = template(replyArr);
				
				console.log("replyArr = " + replyArr);
				
				$(".replyLi").remove();
				target.after(html);
				
			}
		

			
			var printPaging = function(pageMaker, target){
				var str = "";
				
				if(pageMaker.prev){
					str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
				}
				
				for(var i=pageMaker.startPage, len= pageMaker.endPage; i <= len; i++){
					var strClass = pageMaker.cri.page == i?'class=active':'';
					str += "<li class='page-item' "+strClass+"><a class='page-link' href='"+i+"'>"+i+"</a></li>";
				}
				
				if(pageMaker.next){
					str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
				}
				
				target.html(str);
			}
			
			var formObj = $("form[role='form']");

			console.log(formObj);
			
			
			$("#modifyPageBtn").on("click", function() {
				formObj.attr("action", "/sboard/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$("#removePageBtn").on("click", function() {
				
				var replyCnt = $("#replycntSmall").html();
				
				if(replyCnt > 0){
					
				}
			
				
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
				
				var arr = []
				$(".uploadedList li").each(function(index){
					arr.push($(this).attr("data-src"));
				});
				
				if(arr.length > 0){
					$.post("/deleteAllFiles",{files:arr}, function(){
						
					});
				}
				
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
				
			});

				console.log(" document.referrer = " +  document.referrer);			
				var strArray=document.referrer.split('/');
				console.log(strArray[3]);
			$("#listPageBtn").on("click", function() {
				formObj.attr("method", "get");
				if(strArray[3] == 'mypage'){
					formObj.attr("action", "/mypage/home");				
				}else{
					formObj.attr("action", "/sboard/list");	
				}
				
				formObj.submit();
			});
			
			$("repliesDiv").on("click", function(){
				if($(".timeline li").size() > 1){
					return;
				}
				getPage("/replies/"+bno+"/1");
			});
			
			$(".pagination").on("click", "li a", function(event){
				event.preventDefault();
				replyPage = $(this).attr("href");
				getPage("/replies/"+bno+"/"+replyPage);
				
			});
			
			$("#replyAddBtn").on("click",function(){
			
				var uidObj = $("#newReplyUid");
				var unameObj = $("#newReplyUname");
				var replytextObj = $("#newReplyText");
				var uid = uidObj.val();
				var uname = unameObj.val();
				var replytext = replytextObj.val();
				
				$.ajax({
					type : 'post',
					url : '/replies/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({bno:bno, uid:uid, uname:uname, replytext:replytext}),
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
							replyPage=1;
							getPage("/replies/"+bno+"/"+replyPage);
							//uidObj.val("");
							//unameObj.val("");
							replytextObj.val("");
							
						}
					}
					});
					
				});
			
			
			
			
			
			/**************************************************************************************/
			/**************************************************************************************/
			/*                               	likeBtn start 	                                  */
			/**************************************************************************************/
			/**************************************************************************************/
			
			$("#likeAddBtn").on("click",function(){
				var bno = ${boardVO.bno};
				var uid = '${login.uid}';
				var lpo = '1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/likes/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({bno:bno, uid:uid, lpo:lpo}),
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
							$("#likeAddBtn").hide();
							$("#likeDelBtn").show();
							$("#unlikeAddBtn").show();
							$("#unlikeDelBtn").hide();
							likeInfo();
						}
					}
					});
			});
			
			$("#likeDelBtn").on("click", function(){
				var bno = ${boardVO.bno};
				var uid = '${login.uid}';
				var lpo = '1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/likes/delete/',
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data : JSON.stringify({bno:bno, uid:uid, lpo:lpo}),
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							$("#likeAddBtn").show();
							$("#likeDelBtn").hide();
							$("#unlikeAddBtn").show();
							$("#unlikeDelBtn").hide();
							likeInfo();
						}
					}
					});	
			});
			
			$("#unlikeAddBtn").on("click",function(){
				var bno = ${boardVO.bno};
				var uid = '${login.uid}';
				var lpo = '-1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/likes/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({bno:bno, uid:uid, lpo:lpo}),
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
							$("#likeAddBtn").show();
							$("#likeDelBtn").hide();
							$("#unlikeAddBtn").hide();
							$("#unlikeDelBtn").show();
							likeInfo();
						}
					}
					});
			});
			
			$("#unlikeDelBtn").on("click", function(){
				var bno = ${boardVO.bno};
				var uid = '${login.uid}';
				var lpo = '-1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/likes/delete/',
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data : JSON.stringify({bno:bno, uid:uid, lpo:lpo}),
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							$("#likeAddBtn").show();
							$("#likeDelBtn").hide();
							$("#unlikeAddBtn").show();
							$("#unlikeDelBtn").hide();
							likeInfo();
						}
					}
					});
			});
			
			
			
			
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/sboard/getAttach/"+bno, function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);
			$(".uploadedList").append(html);
		});
	});
	
	
	likeInfo();
	


    /**************************************************************************************/
	/**************************************************************************************/
	/*                               subscribeBtn start                                   */
	/**************************************************************************************/
	/**************************************************************************************/
	
	$("#subscribeBtn").on("click",function(){
		console.log("subscribeBtn start");
		var subscribed = '${boardVO.uid}';
		var subscriber = '${login.uid}';
		$.ajax({
			type : 'post',
			url : '/subscribes/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST" },
			dataType : 'text',
			data : JSON.stringify({subscribed : subscribed, subscriber : subscriber}),
			success:function(result){
				console.log("result:" + result);
				if(result=='SUCCESS'){
					alert("등록 되었습니다.");
					$("#subscribeBtn").toggle();
					$("#unsubscribeBtn").toggle();
				}
			}
			});
	});
	
	$("#unsubscribeBtn").on("click",function(){
		console.log("unsubscribeBtn start");
		var subscribed = '${boardVO.uid}';
		var subscriber = '${login.uid}';
		$.ajax({
			type : 'post',
			url : '/subscribes/delete',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST" },
			dataType : 'text',
			data : JSON.stringify({subscribed : subscribed, subscriber : subscriber}),
			success:function(result){
				console.log("result:" + result);
				if(result=='SUCCESS'){
					alert("삭제 되었습니다.");
					$("#subscribeBtn").toggle();
					$("#unsubscribeBtn").toggle();
				}
			}
			});
		
		
	});

    function subscribedList(){
				console.log("subscribedList start");
				var subscribed = '${boardVO.uid}';
				var subscriber = '${login.uid}';
				$.ajax({
					type : 'post',
					url : '/subscribes/subscribeList',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'json',
					data : JSON.stringify({subscribed : subscribed, subscriber : subscriber}),
					success:function(result){
						console.log("subscribeList result.length : " + result.length);
						if(result.length != 0){
							alert("조회 되었습니다.");
							$("#subscribeBtn").toggle();
							$("#unsubscribeBtn").toggle();
						}
					}
				});
	}
	
    function getLikeList(){
        console.log("getLikeList start");
        var bno = ${boardVO.bno};
        var uid = '${login.uid}';
        var str = "";
        $.ajax({
            type : 'post',
            url : '/likes/' + bno,
            headers : {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST" },
            dataType:'json',
            data : JSON.stringify({bno:bno, uid:uid}),
            success:function(result){
                console.log("getLikeList result.length : " + result.length);
                if(result.length == 0){
                    $("#likeAddBtn").show();
                    $("#likeDelBtn").hide();
                    $("#unlikeAddBtn").show();
                    $("#unlikeDelBtn").hide();
                    
                    /* 
                    $("#likeDelBtn").toggle();
                    $("#unlikeDelBtn").toggle();
                     */
                }else{
                    if(result[0].lpo == '1' ){
                        $("#likeAddBtn").hide();
                        $("#likeDelBtn").show();
                        $("#unlikeAddBtn").show();
                        $("#unlikeDelBtn").hide();
                    }
                    if(result[0].lpo == '-1' ){
                        $("#likeAddBtn").show();
                        $("#likeDelBtn").hide();
                        $("#unlikeAddBtn").hide();
                        $("#unlikeDelBtn").show();
                    }
                }
            }
        });
	}
    
    
    
	
    function getPage(pageInfo){
        console.log("pageInfo = " +pageInfo);
        $.getJSON(pageInfo,function(data){
            printData(data.list, $("#repliesDiv"), $('#template'));
            console.log("data.list.length = " + data.list.length);
            for(i=0; i<data.list.length; i++){
            	console.log("data.list[" + i + "].rno = " + data.list[i].rno);
            	//$(".repliesDiv").parents().css('background-color','red');
            	//console.log('Object.keys(data)', Object.keys(data));
            	var rno = data.list[i].rno;
            	//$(".replylikesDiv[data-rno="+rno+"]").css('background-color','red');

            	getReplyLikeList(rno, $(".replylikesDiv[data-rno="+rno+"]"));
            }
            //replylikeInfo(41, $(this));
            
            
            
            
            /**************************************************************************************/
			/**************************************************************************************/
			/*                               replylikeBtn start                                   */
			/**************************************************************************************/
			/**************************************************************************************/
			
			
			$(".replylikeAddBtn").on("click",function(){
				console.log("replylikeAddBtn clicked");
				var rno = $(this).parent().parent().find('.modal-footer').attr('data-rno');
				console.log("rno = " + rno);
				var uid = '${login.uid}';
				var rlpo = '1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/replylikes/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({rno:rno, uid:uid, rlpo:rlpo}),
					async: false,
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
						}
					}
				});
				replylikeInfo(rno, $(this));
				$(this).parent().find("#replyLikeAddBtn").hide();
				$(this).parent().find("#replyLikeDelBtn").show();
				$(this).parent().find("#replyDislikeAddBtn").show();
				$(this).parent().find("#replyDislikeDelBtn").hide();
			});
			
			$(".replylikeDelBtn").on("click", function(){
				console.log("replylikeDelBtn clicked");
				var rno = $(this).parent().parent().find('.modal-footer').attr('data-rno');
				console.log("rno = " + rno);
				var uid = '${login.uid}';
				var rlpo = '1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/replylikes/delete/',
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data : JSON.stringify({rno:rno, uid:uid, rlpo:rlpo}),
					async: false,
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
						}
					}
				});
				replylikeInfo(rno, $(this));
				$(this).parent().find("#replyLikeAddBtn").show();
				$(this).parent().find("#replyLikeDelBtn").hide();
				$(this).parent().find("#replyDislikeAddBtn").show();
				$(this).parent().find("#replyDislikeDelBtn").hide();
			});
			
			$(".replydislikeAddBtn").on("click",function(){
				console.log("replydislikeAddBtn clicked");
				var rno = $(this).parent().parent().find('.modal-footer').attr('data-rno');
				console.log("rno = " + rno);
				var uid = '${login.uid}';
				var rlpo = '-1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/replylikes/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({rno:rno, uid:uid, rlpo:rlpo}),
					async: false,
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
						}
					}
				});
				replylikeInfo(rno, $(this));
				$(this).parent().find("#replyLikeAddBtn").show();
				$(this).parent().find("#replyLikeDelBtn").hide();
				$(this).parent().find("#replyDislikeAddBtn").hide();
				$(this).parent().find("#replyDislikeDelBtn").show();
			});
			
			$(".replydislikeDelBtn").on("click", function(){
				console.log("replydislikeDelBtn clicked");
				var rno = $(this).parent().parent().find('.modal-footer').attr('data-rno');
				console.log("rno = " + rno);
				var uid = '${login.uid}';
				var rlpo = '-1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/replylikes/delete/',
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data : JSON.stringify({rno:rno, uid:uid, rlpo:rlpo}),
					async: false,
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
						}
					}
				});
				replylikeInfo(rno, $(this));
				$(this).parent().find("#replyLikeAddBtn").show();
				$(this).parent().find("#replyLikeDelBtn").hide();
				$(this).parent().find("#replyDislikeAddBtn").show();
				$(this).parent().find("#replyDislikeDelBtn").hide();
			});
            
            
			$(".replyModBtn").on("click",function(){
				console.log("#replyModBtn clicked");

				var rno = $(this).parents().attr('data-rno');
				console.log("rno = " + rno);
		        $(this).parent().parent().find('#replytext').removeAttr("readonly");
		        
				$(this).hide();
		        $(this).next().show();
			        
			});
			
			
			$(".replySubmitBtn").on("click",function(){
				console.log("#replySubmitBtn clicked");		
				
				var rno = $(this).parents().attr('data-rno');
				var replytext = $(this).parent().parent().find('#replytext').val();
				console.log("rno = " + rno);
				console.log("replytext = " + replytext);
				
				$.ajax({
					type : 'put',
					url : '/replies/'+rno,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT" },
					data : JSON.stringify({replytext:replytext}),
					dataType : 'text',
					success : function(result){
						console.log("result : " + result);
						if(result=='SUCCESS'){
							alert("수정 되었습니다.");
							$('#replytext').attr("readonly", "readonly");
					        $('#replyModBtn').show();
					        $('#replySubmitBtn').hide();
					        replyPage=1;
							getPage("/replies/"+bno+"/"+replyPage);
						}
					}
				});
				
				
			});
			
			$(".replyDelBtn").on("click", function(){

				var rno = $(this).parents().attr('data-rno');
				var replytext = $(this).parent().parent().find('#replytext').val(); //사용안함
				console.log("rno = " + rno);
				$.ajax({
					type : 'delete',
					url : '/replies/'+rno,
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "DELETE" },
					dataType:'text',
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							replyPage=1;
							getPage("/replies/"+bno+"/"+replyPage);
						}
					}
					});
				});
            
            
            printPaging(data.pageMaker, $(".pagination"));
            
            $("#replycntSmall").html("Comment [ " + data.pageMaker.totalCount +" ]");
            
        });
				
	}

    function likeInfo(){
		var bno = ${boardVO.bno}
		var template_like = Handlebars.compile($('#like_template').html());
		var template_unlike = Handlebars.compile($('#unlike_template').html());
		$.getJSON("/likes/info/"+bno,function(data){
			$(data).each(function(){
				var html_like = template_like(data);
				var html_unlike = template_unlike(data);
				$("#likeLi").remove();
				$(".likesDiv").append(html_like);
				
				$("#unlikeLi").remove();
				$(".unlikesDiv").append(html_unlike);
			});
		});	
	}
    
    function replylikeInfo(rno, object){
    	
		console.log("replylikeInfo start");
		console.log("rno = " + rno);
		
		
		
		var template_like = Handlebars.compile($('#replylike_template').html());
		var template_dislike = Handlebars.compile($('#replydislike_template').html());
		$.getJSON("/replylikes/info/"+rno,function(data){
			$(data).each(function(){
				var html_like = template_like(data);
				var html_dislike = template_dislike(data);
				console.log("replylike_template html = " + html_like);
				console.log("replydislike_template html = " + html_dislike);
				
				//object.parent().parent().find("#replylikeLi").remove();
				object.parent().parent().find("#replylikeLi").remove();
				object.parent().children("#replyLikeDelBtn").after(html_like);
				
				//object.parent().parent().find("#replydislikeLi").remove();
				object.parent().parent().find("#replydislikeLi").remove();
				object.parent().children("#replyDislikeDelBtn").after(html_dislike);
				
				
			});
		});	
		
	}
    
    function getReplyLikeList(rno, object){
        console.log("getReplyLikeList start");
        console.log("rno = " + rno);
        var uid = '${login.uid}';
       	var result;
        $.ajax({
            type : 'post',
            url : '/replylikes/' + rno,
            headers : {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST" },
            dataType:'json',
            data : JSON.stringify({rno:rno, uid:uid}),
            success:function(result){
                console.log("getReplyLikeList result.length : " + result.length);
                if(result.length == 0){
                	object.parent().find("#replyLikeAddBtn").show();
                	object.parent().find("#replyLikeDelBtn").hide();
                	object.parent().find("#replyDislikeAddBtn").show();
                	object.parent().find("#replyDislikeDelBtn").hide();
                	
                    
                }else{
                    if(result[0].rlpo == '1' ){
                    	object.parent().find("#replyLikeAddBtn").hide();
                    	object.parent().find("#replyLikeDelBtn").show();
                    	object.parent().find("#replyDislikeAddBtn").show();
                    	object.parent().find("#replyDislikeDelBtn").hide();
                    }
                    if(result[0].rlpo == '-1' ){
                    	object.parent().find("#replyLikeAddBtn").show();
                    	object.parent().find("#replyLikeDelBtn").hide();
                    	object.parent().find("#replyDislikeAddBtn").hide();
                    	object.parent().find("#replyDislikeDelBtn").show();
                    }
                }
            }
        });
	}
    

    });
	</script>
	
	
	<script id="subtitle_template" type="text/x-handlebars-template">
		{{#each .}}
			<div style="height:50px;" class="subtitleLi" data-sno={{sno}}>
					<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}'>{{subtitle}}</a>
			</div>
		{{/each}}
	</script>
	
	<script id="thissubtitle_template" type="text/x-handlebars-template">
		{{#each .}}
			<div style="height:50px;" class="thissubtitleLi" data-sno={{sno}}>
					<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}'>{{subtitle}}</a>
			</div>
		{{/each}}
	</script>
	
	
	<script> //subtitle print
	var formObj = $("form[role='form']");

	function getSubtitle(bno){
		console.log("click getSubtitle start getPage");
		getSubtitlePage("/subtitles/"+bno+"/5/1");
	};	
	
	

	
	
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		subtitlePage = $(this).attr("href");
		getSubtitlePage("/subtitles/"+bno+"/5/"+subtitlePage);
		
	});
	
	
		
	var printData = function (subtitleArr, target, templateObject){
		console.log("start printData");
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(subtitleArr);
		target.after(html);
	}
		
		
	function getSubtitlePage(pageInfo){
		console.log("start getSubtitlePage");
		
		//$(".pagination").remove();
		$(".subtitleLi").remove();
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".subtitlesDiv"), $('#subtitle_template'));
			printPaging(data.pageMaker, $(".pagination"));
			console.log("start subtitlecntSmall");
			$(".subtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
		});
		
		
	}
	
	
	function getThisSubtitlePage(pageInfo){
		console.log("start getSubtitlePage");
		
		//$(".pagination").remove();
		$(".thissubtitleLi").remove();
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".thissubtitlesDiv"), $('#thissubtitle_template'));
			printPaging(data.pageMaker, $(".pagination"));
			console.log("start subtitlecntSmall");
			$(".thissubtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
		});
		
		
	}
	
	
	var printPaging = function(pageMaker, target){
		console.log("start printPaging");
		var str = "";
		if(pageMaker.endPage != '1'){
		if(pageMaker.prev){
			str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
		}
		
		for(var i=pageMaker.startPage, len= pageMaker.endPage; i <= len; i++){
			var strClass = pageMaker.cri.page == i?'class=active':'';
			str += "<li class='page-item' "+strClass+"><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(pageMaker.next){
			str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
		}

		}
		target.html(str);
				
		
		
	}

	</script>
	
	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}

		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-primary").on("click", function() {
				self.location = "/board/register";
			});
		});
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="/resources/ThumbnailGridExpandingPreview/js/grid.js"></script>
		<script>
			$(function() {
				Grid.init();
			});
		</script>
	
	
	
	
	
</body>
</html>