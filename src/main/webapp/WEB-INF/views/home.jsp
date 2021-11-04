<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>MyPick Main</title>
<!--
    
TemplateMo 558 Klassy Cafe

https://templatemo.com/tm-558-klassy-cafe

-->
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/templatemo-klassy-cafe.css">
    <link rel="stylesheet" href="/css/owl-carousel.css">
    <link rel="stylesheet" href="/css/lightbox.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/login.css">
    <script src="/js/search.js"></script>
    </head>
    
    <body>
    
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
    <div class="main-header">
        <nav>
            <!-- <div id="login">
                <button type="button" id="login-btn">LOGIN</button>
                    <div class="black-bg"></div>
                    <div class="modal-wrap">
                    <div class="login-close"><a href="#">close</a></div>
                    <div id="main-login">
                        <div id="head-login"><p>PERIPERA</p></div>
                        <div id="serv-login">
                            <div id="idpw">
                                ID&nbsp;&nbsp;&nbsp;<input type="text" name="" id="" placeholder="Id를 입력해주세요"><br><br>
                                PW&nbsp;</label><input type="password" name="" id="" placeholder="Pw를 입력해주세요">
                            </div>
                            <div id="loginBtn">
                                <button id="btn">LOGIN</button>
                            </div>
                        </div>
                        <div id="footer-login">
                            <button class="btn2"><a href="#">Create account</a></button><br>
                            <button class="btn2"><a href="#">I've forgot my password</a></button>
                        </div>
                        <div id="blank-login"></div>
                    </div>
                </div>
                 <button type="button" id="join-btn"><a href="../mypick/login.html">JOIN</a></button> -->
        </nav>
        <div id="h-1">
            <ul id="h-ul">
                <li><a href="#" class="m-list">SUPPORTING</a></li>
                <li class="b-ul">
                    <a href="../mypick/find.html" class="m-list">GOODS</a>
                </li>
            </ul>
        </div>
        <div class="logo">
            <img src="./assets/images/mypic_logo.png" alt="">
        </div>
        <div class="mypage">
            <ul class="main-ul">
                <li class="main-li">
                    <div>
                        <img src="./assets/images/솔미2.png" alt="">
                    </div>
                    <ul class="serv-ul">
                        <li class="serv-li">로그아웃</li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="index.html" class="logo">
                            <img src="./assets/images/mypic_logo.png" style="width: 80px; margin-right: 200px;">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                            <li class="scroll-to-section"><a href="#about">Supportting</a></li>
                            <li class="scroll-to-section"><a href="#about">Goods</a></li>
                            <!-- <li class="submenu">
                                <a href="javascript:;">MyPage<a>
                                <ul>
                                    <li><a href="#">Drop Down Page 1</a></li>
                           		</ul>
                            </li> -->
                            <!-- <li class=""><a rel="sponsored" href="https://templatemo.com" target="_blank">External URL</a></li> -->
                            <li class="scroll-to-section"><a href="#reservation">Contact Us</a></li> 
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!----------------------->
    <div id="top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="left-content">
                        <div class="inner-content">
                            <h4>MyPick</h4>
                            <h6>나의 아이돌에게 커피차 서포팅을?</h6>
                            <div class="main-white-button scroll-to-section">
                                <a href="supportting">Let's go Supportting</a>
                            </div>
                        </div>
                        <div class="search-wrapper">
                            <div class="input-holder">
                                <input type="text" class="search-input" placeholder="당신의 아이돌을 검색하세요" />
                                <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                            </div>
                            <span class="close" onclick="searchToggle(this, event);"></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="main-banner header-text">
                        <div class="Modern-Slider">
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="../templatemo_558_klassy_cafe/assets/images/Cy3Wj-5UAAAnKhC.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="../templatemo_558_klassy_cafe/assets/images/226EF83F5891FA9C2B.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="../templatemo_558_klassy_cafe/assets/images/maxresdefault.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** About Area Starts ***** -->
    <section class="section" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-xs-12">
                    <div class="left-text-content">
                        <div class="section-heading">
                            <h6>About Us</h6>
                            <h2>Recommend a new video.</h2>
                        </div>
                        <p>2021년 11월 차은우 신곡발표 </p>
                        <p>2021년 11월 차은우 겨울을 맞이해 아스트로 멤버 차은우는 발라드 솔로앨범을 발매했다. </p>
                        <h3>goods</h3>
                        <br>
                        <div class="row">
                            <div class="col-4">
                                <img src="assets/images/1ODL2BKBJK_1.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img src="assets/images/unnamed.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img src="assets/images/b334e81c1b5cc417415062fe96fff160.jpeg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-xs-12">
                    <div class="right-content">
                        <div class="thumb">
                            <a rel="nofollow" href="https://www.youtube.com/watch?v=8S-zkaCjCXM"><i class="fa fa-play"></i></a>
                            <img style="width: 400px; margin-left: 65px;" src="assets/images/b334e81c1b5cc417415062fe96fff160.jpeg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** About Area Ends ***** -->

    <!-- ***** Menu Area Starts ***** -->
    <section class="section" id="menu">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="section-heading">
                        <h6>Our Menu</h6>
                        <h2>Our selection of cakes with quality taste</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="menu-item-carousel">
            <div class="col-lg-12">
                <div class="owl-menu-item owl-carousel">
                    <div class="item">
                        <div class='card card1'>
                            <div class="price"><h6>18,000￦</h6></div>
                            <div class='info'>
                              <h1 class='title'>AKMU KEYRING</h1>
                              <p class='description'>- KEYRING 1종 제품입니다.<br>
                                - NEXT EPISODE 앨범 커버 아트웍으로 제작된 RESIN KEYRING입니다.</p>
                              <div class="main-text-button">
                                  <div class="scroll-to-section"><a href="#reservation">Make Reservation <i class="fa fa-angle-down"></i></a></div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class='card card2'>
                            <div class="price"><h6>18,000￦</h6></div>
                            <div class='info'>
                              <h1 class='title'>iKON AIRPODS SILICONE CASE SET</h1>
                              <p class='description'>[ADDITIONAL INFORMATION]<br>

                                -사이즈 <br>
                                Case: 54.3x60x35.5mm / Charm: 12x42mm<br>
                                재질 : Sillicone</p>
                              <div class="main-text-button">
                                  <div class="scroll-to-section"><a href="#reservation">Make Reservation <i class="fa fa-angle-down"></i></a></div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class='card card3'>
                            <div class="price"><h6>20,000￦</h6></div>
                            <div class='info'>
                              <h1 class='title'>AKMU NEXT EPISODE PHONECASE</h1>
                              <p class='description'>-케이스스테이션은 영국, 프랑스, 독일 등 유럽을 넘어 북미, 아시아에 이르기까지 전세계에서 
                                사랑 받는 IT기술이 접목된 스마트 악세서리 브랜드입니다.</p>
                              <div class="main-text-button">
                                  <div class="scroll-to-section"><a href="#reservation">Make Reservation <i class="fa fa-angle-down"></i></a></div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class='card card4'>
                            <div class="price"><h6>12,000￦</h6></div>
                            <div class='info'>
                              <h1 class='title'>[IZONE] 폰케이스</h1>
                              <p class='description'>아이즈원 IZONE 파노라마 폰케이스 굿즈 </p>
                              <div class="main-text-button">
                               <div class="scroll-to-section"><a href="#reservation">상품보러가기 <i class="fa fa-angle-down"></i></a></div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class='card card5'>
                            <div class="price"><h6>20,500￦</h6></div>
                            <div class='info'>
                              <h1 class='title'>[SEVENTEEN] 9th Attacca앨범</h1>
                              <p class='description'>(CARAT.ver)9th Mini Album Attacca Kit Album</p>
                              <div class="main-text-button">
                               <div class="scroll-to-section"><a href="#reservation">상품보러가기 <i class="fa fa-angle-down"></i></a></div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class='card card6'>
                            <div class="price"><h6>15,810￦</h6></div>
                            <div class='info'>
                              <h1 class='title'>[아스트로] 자수 와펜 패치 set</h1>
                              <p class='description'>영화사 아이돌굿즈 아스트로 자수 와펜 패치 set</p>
                              <div class="main-text-button">
                         <div class="scroll-to-section"><a href="#reservation">상품보러가기 <i class="fa fa-angle-down"></i></a></div>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Menu Area Ends ***** -->

    <!-- ***** Chefs Area Starts ***** -->
    <section class="section" id="chefs">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 offset-lg-4 text-center">
                    <div class="section-heading">
                        <h6>A new album.</h6>
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="chef-item">
                        <div class="thumb">
                            <div class="overlay"></div>
                            <ul class="social-icons">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                            <img style="height: 500px;" src="./assets/images/10751155_20211025161054_500.jpg" alt="Chef #1">
                        </div>
                        <div style="height: 100px;" class="down-content">
                            <h4>Favorite - The 3rd Album Repackage</h4>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="chef-item">
                        <div class="thumb">
                            <div class="overlay"></div>
                            <ul class="social-icons">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-behance"></i></a></li>
                            </ul>
                            <img style="height: 500px;" src="assets/images/448926_570710_4206.jpg" alt="Chef #2">
                        </div>
                        <div style="height: 100px;" class="down-content">
                            <h4>XOXO</h4>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="chef-item">
                        <div class="thumb">
                            <div class="overlay"></div>
                            <ul class="social-icons">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google"></i></a></li>
                            </ul>
                            <img style="height: 500px;" src="assets/images/22SPMHI0G9_1.jpg" alt="Chef #3">
                        </div>
                        <div style="height: 100px;" class="down-content">
                            <h4>strawberry moon</h4>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Chefs Area Ends ***** -->

    <!-- ***** Reservation Us Area Starts ***** -->

    <!-- ***** Footer Start ***** -->
    <div style="width: max-widthl; height: 10px;  background-color: #fb5849;"> </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-xs-12">
                </div>
                <div class="col-lg-4">
                    <div class="logo">
                        <a href="index.html"><img src="assets/images/mypic_logo.png" width="200px" height="200px" alt="로고이미지"></a>
                    </div>
                </div>
                <div class="col-lg-4 col-xs-12">
                    <div class="left-text-content">
                        <p>
                            <br>
                            사업자번호 : 01-378-25975<br>
                            대표자 : 별꼬리<br>
                            전화번호 : 1544-9970<br>
                            서울특별시 중구 남대문로 120 대일빌딩 2F, 3F<br>
                            상담시간 오전 10시 ~ 오후 6시<br>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/assets/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="${pageContext.request.contextPath}/assets/js/owl-carousel.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/accordions.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/scrollreveal.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/imgfix.min.js"></script> 
    <script src="${pageContext.request.contextPath}/assets/js/slick.js"></script> 
    <script src="${pageContext.request.contextPath}/assets/js/lightbox.js"></script> 
    <script src="${pageContext.request.contextPath}/assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>
  </body>
</html>