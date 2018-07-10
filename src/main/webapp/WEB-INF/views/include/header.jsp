<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIPMAN</title>

    <!--    google web font link-->
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">

    <!--   style sheet-->
    <link href="/resources/css/header.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">

    <script src="/resources/js/dropdown-contents.js"></script>
    <script src="/resources/js/genre-check.js"></script>

    <!--expander style sheet-->
    <link rel="stylesheet" type="text/css" href="/resources/css/component.css" />

    <!--expander script-->

<!--     <script src="/resources/js/expander.js"></script> -->

</head>


<body>
    
        <!--header-->
    <div class="header dropdown">
        <div class="brand">
            <a href="/"><img src="/resources/png/logo.png"></a>
        </div>
        <div class="searchBtn ">
            <img class="dropbtn" onclick="searchFunction()" src="/resources/png/search.png">
        </div>
        <!-- <div class="genreBtn ">
            <img class="dropbtn" onclick="genreFunction()" src="/resources/png/genre.png">
        </div> -->
        <div class="noticeBtn ">
            <img class="dropbtn" onclick="noticeFunction()" src="/resources/png/notice-1.png">
        </div>
        <div class="accountBtn ">
            <c:if test="${empty login}">
            	<img class="dropbtn" onclick="myPageFunction()" src="/resources/png/account.png">
            </c:if>
            <!-- <a href="#"><span><img class="dropbtn" onclick="myPageFunction()" src="/resources/png/account.png"></span></a> -->
			<c:if test="${not empty login}">
				<a href="/mypage/home"><span><img class="dropbtn" src="http://172.30.0.182:8080/displayFile?fileName=${login.profileFullName}"></span></a>
			</c:if>
        </div>
<!--
        <div class="signupBtn">
            <img class="dropbtn" onclick="signupFunction()" src="png/account.png">
        </div>
-->
    </div>

    <!--dropdown content-->
    
    
    <div id="searchBar" class="do-not-close dropdown-contents">
    	<div class="dropdown-searchBar do-not-close">
           <div class="genre-1 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput1" value='1'><span class="do-not-close genreInput1 false">SF</span> 
            </div>
            <div class="genre-2 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput2" value='2'><span class="do-not-close genreInput2 false">Mystery</span> 
            </div>
            <div class="genre-3 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput3" value='3'><span class="do-not-close genreInput3 false">Pure Love</span> 
            </div>
            <div class="genre-4 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput4" value='4'><span class="do-not-close genreInput4 false">Romance</span> 
            </div>
            <div class="genre-5 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput5" value='5'><span class="do-not-close genreInput5 false">Comic</span> 
            </div>
            <div class="genre-6 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput6" value='6'><span class="do-not-close genreInput6 false">Reasoning</span> 
            </div>
            <div class="genre-7 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput7" value='7'><span class="do-not-close genreInput7 false">School Life</span> 
            </div>
            <div class="genre-8 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput8" value='8'><span class="do-not-close genreInput8 false">Sports</span> 
            </div>
            <div class="genre-9 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput9" value='9'><span class="do-not-close genreInput9 false">Fantasy</span> 
            </div>
            <div class="genre-10 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput10" value='10'><span class="do-not-close genreInput10 false">Medicine</span> 
            </div>
            <div class="genre-11 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput11" value='11'><span class="do-not-close genreInput11 false">Food</span> 
            </div>
            <div class="genre-12 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput12" value='12'><span class="do-not-close genreInput12 false">Education</span> 
            </div>
            <div class="genre-13 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput13" value='13'><span class="do-not-close genreInput13 false">Battle</span> 
            </div>
            <div class="genre-14 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput14" value='14'><span class="do-not-close genreInput14 false">Mecanic</span> 
            </div>
            <div class="genre-15 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput15" value='15'><span class="do-not-close genreInput15 false">Daily</span> 
            </div>
            <div class="genre-16 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput16" value='16'><span class="do-not-close genreInput16 false">Age</span> 
            </div>
            <div class="genre-17 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput17" value='17'><span class="do-not-close genreInput17 false">Graphic Novel</span> 
            </div>
            <div class="genre-18 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput18" value='18'><span class="do-not-close genreInput18 false">Thriller</span> 
            </div>
            <div class="genre-19 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput19" value='19'><span class="do-not-close genreInput19 false">Drama</span> 
            </div>
            <div class="genre-20 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput20" value='20'><span class="do-not-close genreInput20 false">Adventure</span> 
            </div>
			<input type="text" name='keyword' id="keywordInput" value='${cri.keyword}' class="searchBar do-not-close" placeholder='Search Webtoons'>
			<button type="submit" id="searchBar-button" class="searchBar-button do-not-close"><img class="do-not-close" src="/resources/png/search.png"></button>
        </div>
    </div>


	<!-- 20180702 before -->
    <!-- <div id="noticeBar" class="dropdown-content dropdown-btn">
        <div class="dropdown-notice dropdown-btn">
            <div class="img-01 cursor dropdown-btn" onclick="window.location='#';">
                <img src="/resources/images/overwatch.jpg">
            </div>
            <div class="text-01 cursor dropdown-btn" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum placeat nesciunt ndus amet, voluptas, fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente?
            </div>
            <div class="time-01 dropdown-btn">
                1 hours ago
            </div>

            <div class="img-02 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-01.jpg">
            </div>
            <div class="text-02 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eumm quia culpa sapiente?
            </div>
            <div class="time-02">
                2 hours ago
            </div>

            <div class="img-03 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-02.jpg">
            </div>
            <div class="text-03 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur advitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente.
            </div>
            <div class="time-03">
                3 hours ago
            </div>

            <div class="img-04 cursor" onclick="window.location='#';">
                <img src="/resources/images/overwatch.jpg">
            </div>
            <div class="text-04 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente!
            </div>
            <div class="time-04">
                4 hours ago
            </div>

            <div class="img-05 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-03.jpg">
            </div>
            <div class="text-05 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum placeat nesciunt ndus amet, voluptas, fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente?
            </div>
            <div class="time-05">
                1 days ago
            </div>

            <div class="img-06 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-04.jpg">
            </div>
            <div class="text-06 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consecteturvoluptas, fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente?
            </div>
            <div class="time-06">
                2 hours ago
            </div>
        </div>
    </div> -->
    <!-- 20180702 before --> 
    <!-- <div id="genreBar" class="do-not-close dropdown-contents">
        <div class="dropdown-genre do-not-close">
           <div class="dropdown-genre-1 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput1" value='1'><span>SF</span> 
            </div>
            <div class="dropdown-genre-2 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput2" value='2'><span>Mystery</span> 
            </div>
            <div class="dropdown-genre-3 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput3" value='3'><span>Pure Love</span> 
            </div>
            <div class="dropdown-genre-4 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput4" value='4'><span>Romance</span> 
            </div>
            <div class="dropdown-genre-5 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput5" value='5'><span>Comic</span> 
            </div>
            <div class="dropdown-genre-6 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput6" value='6'><span>Reasoning</span> 
            </div>
            <div class="dropdown-genre-7 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput7" value='7'><span>School Life</span> 
            </div>
            <div class="dropdown-genre-8 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput8" value='8'><span>Sports</span> 
            </div>
            <div class="dropdown-genre-9 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput9" value='9'><span>Fantasy</span> 
            </div>
            <div class="dropdown-genre-10 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput10" value='10'><span>Medicine</span> 
            </div>
            <div class="dropdown-genre-11 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput11" value='11'><span>Food</span> 
            </div>
            <div class="dropdown-genre-12 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput12" value='12'><span>Education</span> 
            </div>
            <div class="dropdown-genre-13 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput13" value='13'><span>Battle</span> 
            </div>
            <div class="dropdown-genre-14 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput14" value='14'><span>Mecanic</span> 
            </div>
            <div class="dropdown-genre-15 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput15" value='15'><span>Daily</span> 
            </div>
            <div class="dropdown-genre-16 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput16" value='16'><span>Age</span> 
            </div>
            <div class="dropdown-genre-17 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput17" value='17'><span>Graphic Novel</span> 
            </div>
            <div class="dropdown-genre-18 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput18" value='18'><span>thriller</span> 
            </div>
            <div class="dropdown-genre-19 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput19" value='19'><span>Drama</span> 
            </div>
            <div class="dropdown-genre-20 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close" id="genreInput20" value='20'><span>Adventure</span> 
            </div>
        </div>
    </div> -->
    
    
    <div id="noticeBar" class="do-not-close dropdown-contents">
        <div class="dropdown-notice do-not-close">
            <div class="img-01 cursor do-not-close" onclick="window.location='#';">
                <img class="do-not-close" src="/resources/images/overwatch.jpg">
            </div>
            <div class="text-01 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum placeat nesciunt ndus amet, voluptas, fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente?
            </div>
            <div class="time-01">
                1 hours ago
            </div>

            <div class="img-02 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-01.jpg">
            </div>
            <div class="text-02 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eumm quia culpa sapiente?
            </div>
            <div class="time-02">
                2 hours ago
            </div>

            <div class="img-03 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-02.jpg">
            </div>
            <div class="text-03 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur advitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente.
            </div>
            <div class="time-03">
                3 hours ago
            </div>

            <div class="img-04 cursor" onclick="window.location='#';">
                <img src="/resources/images/overwatch.jpg">
            </div>
            <div class="text-04 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente!
            </div>
            <div class="time-04">
                4 hours ago
            </div>

            <div class="img-05 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-03.jpg">
            </div>
            <div class="text-05 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum placeat nesciunt ndus amet, voluptas, fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente?
            </div>
            <div class="time-05">
                1 days ago
            </div>

            <div class="img-06 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-04.jpg">
            </div>
            <div class="text-06 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consecteturvoluptas, fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente?
            </div>
            <div class="time-06">
                2 hours ago
            </div>
        </div>
    </div>

	<!-- 20180702 before -->
    
    <div id="myPageBar" class="do-not-close dropdown-contents">
        <form class="dropdown-mypage do-not-close" action="/user/loginPost" method="post">
            <input type="email" name="uid" class="login-id do-not-close" placeholder='ID' required>
            <div class="remember do-not-close">
            	<span><input type="checkbox" class="do-not-close" name="useCookie"></span>
            	<span>Remember your ID</span>
            </div>
            <input type="password" name="upw" class="login-pw do-not-close" placeholder='Password' required>
            <button type="submit" class="login-button do-not-close">Log-In</button>
            <div class="signupBtn do-not-close">
	            <div class="signup-button dropbtn do-not-close" onclick="signupFunction()">
	                Sign-Up
	            </div>
            </div>
        </form>
    </div>

    
    <div id="signupBar" class="do-not-close dropdown-contents">
        <form class="dropdown-signup do-not-close">
            <input type="text" class="signup-email do-not-close" placeholder='Log-in e-mail'>
            <input type="text" class="signup-pw do-not-close" placeholder='Password'>
            <input type="text" class="signup-repw do-not-close" placeholder='Retype Password'>
            <input type="text" class="signup-nickname do-not-close" placeholder='Nick name'>
            <div type="submit" class="signup-button do-not-close">Sign-Up</div>
            <div type="submit" class="hadaccount-button dropbtn" onclick="myPageFunction()">
                Had Account
            </div>
        </form>
    </div>
    

    <!-- <script>
    function dropDownSearchBar(){
    	console.log("click dropDownSearchBar");
    	$(".header-grid").after("<div>click dropDownSearchBar</div>");
    };
    </script> -->
    <script>
        /* When the user clicks on the button, 
                            toggle between hiding and showing the dropdown content */
        function searchFunction() {
        	if($('.search').is(":visible")){
        		document.getElementById("searchBar").classList.remove("search");
        	}else{
        		document.getElementById("searchBar").classList.add("search");	
        	}
            /* document.getElementById("searchBar").classList.toggle("search"); */
        	//document.getElementById("searchBar").classList.add("search");
        	
//         	document.getElementById("genreBar").classList.remove("genre");
        	document.getElementById("noticeBar").classList.remove("notice");
        	document.getElementById("myPageBar").classList.remove("mypage");
        	document.getElementById("signupBar").classList.remove("signup");
        }

        /* function genreFunction() {
			if($('.genre').is(":visible")){
				document.getElementById("genreBar").classList.remove("genre");
        	}else{
        		document.getElementById("genreBar").classList.add("genre");	
        	}
     		//document.getElementById("genreBar").classList.toggle("genre");
			document.getElementById("searchBar").classList.remove("search");
			//document.getElementById("genreBar").classList.add("genre");
			document.getElementById("noticeBar").classList.remove("notice");
			document.getElementById("myPageBar").classList.remove("mypage");
			document.getElementById("signupBar").classList.remove("signup");
			
        } */
        
        function noticeFunction() {
        	if($('.notice').is(":visible")){
        		document.getElementById("noticeBar").classList.remove("notice");
        	}else{
        		document.getElementById("noticeBar").classList.add("notice");	
        	}
            /* document.getElementById("noticeBar").classList.toggle("notice"); */
        	document.getElementById("searchBar").classList.remove("search");
//         	document.getElementById("genreBar").classList.remove("genre");
        	//document.getElementById("noticeBar").classList.add("notice");
        	document.getElementById("myPageBar").classList.remove("mypage");
        	document.getElementById("signupBar").classList.remove("signup");
        	
        }
 
        function myPageFunction() {
        	if($('.mypage').is(":visible")){
        		document.getElementById("myPageBar").classList.remove("mypage");
        	}else{
        		document.getElementById("myPageBar").classList.add("mypage");	
        	}
            /* document.getElementById("myPageBar").classList.toggle("mypage"); */
        	document.getElementById("searchBar").classList.remove("search");
//         	document.getElementById("genreBar").classList.remove("genre");
        	document.getElementById("noticeBar").classList.remove("notice");
        	//document.getElementById("myPageBar").classList.add("mypage");
        	document.getElementById("signupBar").classList.remove("signup");
        	
        }
        
		function signupFunction() {
			if($('.signup').is(":visible")){
        		document.getElementById("signupBar").classList.remove("signup");
        	}else{
        		document.getElementById("signupBar").classList.add("signup");	
        	}
			/* document.getElementById("myPageBar").classList.toggle("mypage"); */
			document.getElementById("searchBar").classList.remove("search");
// 			document.getElementById("genreBar").classList.remove("genre");
			document.getElementById("noticeBar").classList.remove("notice");
			document.getElementById("myPageBar").classList.remove("mypage");
			//document.getElementById("signupBar").classList.add("signup");
			
		}

        // Close the dropdown menu if the user clicks outside of it
        window.onclick = function(event) {
            console.log("event.target.className = " + event.target.className);
            console.log("event.target.id = " + event.target.id);

            if (!event.target.matches('.dropbtn') && !event.target.matches('.do-not-close') ) {

                var dropdowns = document.getElementsByClassName("do-not-close");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('search') || openDropdown.classList.contains('genre') || openDropdown.classList.contains('notice') || openDropdown.classList.contains('mypage') || openDropdown.classList.contains('signup')) {
                        openDropdown.classList.remove('search');
//                         openDropdown.classList.remove('genre');
                        openDropdown.classList.remove('notice');
                        openDropdown.classList.remove('mypage');
                        openDropdown.classList.remove('signup');
                    }
                }
            }
        }
        
        $('#searchBar-button').on("click",function(event){
            //  $("#searchForm").submit(function(event){
              	event.preventDefault();
              	
              	var checkArr = [];     // 배열 초기화
                
              	$("input[name='genre']:checked").each(function(i) {
                    checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
                });
              	
              	console.log("checkArr = " + checkArr);
				var location = "/sboard/list" + '${pageMaker.makeQuery(1)}';
				if($('#keywordInput').val() != null){
					location += "&searchType="
						+ "tcw"
						+ "&keyword=" + $('#keywordInput').val();
				}
				if(checkArr.length != 0){
					location += "&genre=" + checkArr;
				}
				
				self.location = location
						
						//$(this).get(0).submit();
              });
            
              $(document).ready(function () {
//              var genreStr = "${MyPageVO.genre}";
				var genreStr = '${cri.genre}';
// 				console.log("genreStr = " + genreStr);
				var genreArr = genreStr.split(',');
				var genreLen = genreArr.length;
              	
				for(var i = 0; i <genreLen; i++){
					console.log("genreArr[" + i + "] = " + genreArr[i]);
					$("#genreInput"+genreArr[i]).prop( "checked", true );
					$("#genreInput"+genreArr[i]).next().toggleClass("false");
					$("#genreInput"+genreArr[i]).next().toggleClass("true");
				}
				
       
       
       
       
});
    </script>

</body>
</html>