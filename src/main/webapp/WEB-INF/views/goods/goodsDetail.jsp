<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">
        
            <!-- Css Styles -->
            <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
            <link rel="stylesheet" href="assets/css/font-awesome.min.css" type="text/css">
            <link rel="stylesheet" href="assets/css/style.css" type="text/css">
            <link rel="stylesheet" href="assets/css/header.css">
            <link rel="stylesheet" href="assets/css/login.css">
            <link rel="stylesheet" href="assets/css/goods.css">
            <link rel="stylesheet" href="assets/css/goods_detail.css">
            <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
            <!--------------------------------->
            <link rel="stylesheet" href="assets/css/elegant-icons.css" type="text/css">
            <link rel="stylesheet" href="assets/css/nice-select.css" type="text/css">
            <link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
            <link rel="stylesheet" href="assets/css/slicknav.min.css" type="text/css">
            <link rel="stylesheet" href="assets/css/flaticon.css" type="text/css">
            <link rel="stylesheet" href="assets/css/barfiller.css" type="text/css">
            <link rel="stylesheet" href="assets/css/magnific-popup.css" type="text/css">
</head>
<body>
           <!-- ***** Header Area Start ***** -->
  	<jsp:include page="/header.jsp"></jsp:include>
            <!----------------------->
            
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>Goods detail</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <a href="./shop.html">Goods</a>
                        <span>Detail</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__img">
                        <div class="product__details__big__img">
                            <img class="big_img" src="assets/images/air.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product__details__text">
                        <div class="product__label">그룹명</div>
                        <h4>Idol Airpot Case</h4>
                        <h5>16000 ₩</h5>
                        <p>누군지 모르지만 아이돌의 에어팟 케이스네여 빨간 건전지도 달렸어여 english가 더 이쁘네요</p>
                        <ul>
                            <li>tab1: <span>여기에는</span></li>
                            <li>tab2: <span>뭐가</span></li>
                            <li>tab3: <span>들어가야할까</span></li>
                        </ul>
                        <div class="product__details__option">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="2">
                                </div>
                            </div>
                            <a href="#" class="primary-btn">Add to cart</a>
                            <a href="#" class="primary-btn">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product__details__tab">
                <div class="col-lg-12">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상세정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">주문 및 배송 안내</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">교환 및 환불 안내</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">Review</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8">
                                    <p>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8">
                                    <p>
                                        <h5>[주문 및 배송정보]</h5>
                                        <br>
                                        <b>[국내 일반 배송]</b><br>
                                        ・배송방식 : MY PICK  물류센터 직접배송(우체국택배)<br>
                                        ・배송지역 : 전국(일부지역 제외)<br>
                                        ・배송비용 : 3,000원 / 주문금액 50,000원 이상 시 무료배송 <br>
                                        ・배송기간 : 결제 후 3~5일 이내 (영업일 기준)<br>
                                        <br>
                                        - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
                                        - 상품의 재고상황에 따라 배송기간이 다소 지연될 수도 있습니다.<br>
                                        - 물류센터 사정으로 인해 배송이 지연될 수 있습니다.<br>
                                        <br>
                                        - 예약판매 상품, 아티스트 케이스 상품 등 당일 배송이 어려운 상품을 함께 구매하는 경우<br>
                                           모든 상품이 배송 가능한 상태가 되는 시점에 주문하신 상품이 함께 배송됩니다.<br>
                                           (예약판매 상품은 순차배송일 기준, 아티스트 케이스는 주문완료 후 약 2주 소요)<br>
                                        - 기본 배송기간 이상 소요되는 상품이거나 품절된 상품은 개별 연락 드리겠습니다.<br>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8">
                                    <p>
                                        <h5>[교환 및 환불정보]</h5>
                                        <br>
                                        <b>[교환∙반품시 유의사항]</b><br>
                                        ・상품의 색상은 모니터 사양에 따라 실제 색상과는 다소 차이가 있을 수 있으며, <br>
                                           상품 라벨의 위치나 색상은 이미지와 다를 수 있습니다.<br>
                                        - 구성품 누락 및 불량으로 인한 교환/환불을 위해서는 택배 박스 및 상품 개봉(구성품 포함) 영상이 반드시 필요합니다.<br>
                                          개봉 영상이 없을 경우 교환 및 환불이 어려울 수 있습니다<br>
                                        - 구성품이 랜덤인 상품의 경우, 교환 진행 시 교환 상품도 랜덤으로 발송됩니다.<br>
                                        - 상품 결함의 경우 5mm 이하의 찍힘 자국과 상품 공정상 발견 될 수 있는 스크래치 및 눌림, 찍힘 자국은 교환 및 반품의 대상이 되지 않습니다.<br>
                                        - 인화류/지류 및 초상 상품의 경우 뒷면, 배경 등 초상 이외의 결함과 공정 과정에서 발생 할 수 있는 스크래치, 눌림 및 찍힘은 교환 및 반품의 대상이 되지 않습니다.<br>
                                        - 모든 상품은 빛 반사가 없는 상태에서 보이는 하자일 경우에만 교환/환불 가능합니다.<br>
                                        - PVC 상품의 경우 소재 특성상 주변환경(온. 습도)의 영향에 따라 형태의 변형 또는 PVC 간 달라붙음 등의 하자가 발생할 수 있으며, 그로인한 교환 및 반품의 대상이 되지 않습니다.<br>
                                        <br>
                                        ・교환∙반품 가능기간<br>
                                        - 변심 : 단순 변심의 경우 수령일로부터 7일 이내까지 1:1문의 또는 CS CENTER로 접수 가능합니다. <br>
                                        - 배송오류, 파손, 불량 등 상품 결함 : 상품 하자, 오배송의 경우 수령일로부터 90일 이내까지 교환∙반품이 가능<br>
                                        <br>
                                        ・교환∙반품 불가한 경우<br>
                                        - 상품 수령 후 7일을 초과한 경우<br>
                                        - 상품의 가치가 감소한 경우 (포장지 훼손, 세탁, 상품 얼룩, 향수 냄새, 탈취제 냄새, 증정품 훼손, 구성품 훼손, 사용 흔적 등)<br>
                                        - 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<br>
                                        - 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우(상품 바코드 제거, 수선 등)<br>
                                        - 주문제작 상품이나 세일 상품, 음반 등 상품 상세페이지에 교환/환불 불가를 공지한 상품의 경우 <br>
                                        - 복제가 가능한 상품등의 포장을 훼손한 경우<br>
                                        - 제품의 오배송, 불량 상품이라도 사용 흔적, 훼손 등의 흔적이 있을 경우 <br>
                                        - 촬영 또는 해상도 등의 영향으로 고객님의 모니터에서 확인되는 색상과 실제 수령한 상품의 색상 차이가 있을 경우<br> 
                                        - 상품의 프린트 혹은 패턴이 있는 경우 상품상세페이지 이미지와 다를 수 있습니다.<br>
                                        - 교환/반품 진행시 이벤트, 프로모션으로 증정된 증정품을 함께 보내주셔야 하며, 누락시 교환/환불이 불가합니다.<br>
                                        - 모든 상품 특성상 재고가 조기 소진될 수 있어 단순변심에 의한 교환은 어려울 수 있으며, <br>
                                           반품/교환은 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 규정을 따릅니다.<br>
                                        - SMTOWN &STORE 온라인스토어에서 구매하신 상품은 공식 오프라인 매장에서 교환/환불이 절대 불가합니다.<br>
                                        - 공식 오프라인 매장에서 구매하신 상품은 SMTOWN &STORE 온라인스토어에서 교환/환불이 절대 불가합니다.<br>
                                        - 각 상품별로 교환/환불 정책은 차이가 있을 수 있으며 자세한 사항은 상품정보에서 확인 부탁드립니다.<br>
                                         (자세한 내용은 1:1문의 또는 CS CENTER를 이용해 주시기 바랍니다)<br>
                                         <br>
                                        ・교환∙반품 비용<br>
                                        - 변심 : 단순 변심으로 반품을 원할 경우에는 구매자가 왕복배송비 지불<br>
                                        - 배송오류, 파손, 불량 등 상품 결함 : 상품하자, 오배송의 경우에는 판매자가 배송비 지불<br>
                                         (정확한 교환∙반품비용은 1:1문의 또는 CS CENTER를 이용해 주시기 바랍니다)<br>
                                         <br><br>
                                        <h5>[교환∙반품 방법]</h5>
                                        ・상품교환∙반품단계<br>
                                        - Step1: 교환∙반품 기간확인<br>
                                        - Step2: 마이페이지 또는 1:1문의로 교환∙반품접수<br>
                                        - Step3: CS담당자의 안내 후 7일 이내 지정 반품지 및 지정 반품수단으로 교환, 반품 배송<br>
                                        - Step4: 반품지에 상품 입고 및 검품 후 교환∙반품 진행<br>
                                        - Step5: 교환∙반품 완료<br>
                                        <br>
                                        <b>[미성년자 권리보호안내]</b>
                                        미성년 고객께서 상품을 주문(계약) 하시는 경우, 법정대리인(부모님 등)이 그 주문(계약)에 동의하지 않으면
                                        미성년자 본인 또는 법정대리인(부모님 등)이 그 주문(계약)을 취소하실 수 있습니다. 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-4" role="tabpanel">
                            <div class="justify-content-center">
                                <div>
                                    <div class="rev-div">
                                        <div class="rev-label">
                                            <p>Review</p>
                                        </div>
                                        <div class="rev-star">
                                            <input type="file" name="" id="">
                                        </div>
                                        <div class="rev-input">
                                            <textarea name="" id="" cols="60" rows="5"></textarea>
                                            <button type="submit">등록</button>
                                        </div>
                                        <div class="rev-list">
                                            <div class="rev-label">
                                                <p>등록된 리뷰(1)</p>
                                            </div>
                                            <div class="rev-img">
                                                <img src="img/key.png" alt="">
                                            </div>
                                            <div class="rev-con">
                                                <p>2021.11.05 19:42&nbsp;next벨</p><br>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo unde enim magni! Possimus cumque velit at dolorem porro obcaecati omnis, earum, dolor, optio ipsam ex repellat fugit magnam iste provident!</p>
                                                <div class="rev-btn">
                                                    <button type="submit"><a href="#">수정</a> </button>
                                                    <button type="submit"><a href="#">삭제</a> </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="rev-re-list">
                                            <div class="rev-re-img">
                                                <img src="assets/images/arrow.png" alt="">
                                            </div>
                                            <div class="rev-re-con">
                                                <p>2021.11.05 19:42&nbsp;매니저</p><br>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo unde enim magni! Possimus cumque velit at dolorem porro obcaecati omnis, earum, dolor, optio ipsam ex repellat fugit magnam iste provident!</p>
                                                <div class="rev-re-btn">
                                                    <button type="submit"><a href="#">수정</a> </button>
                                                    <button type="submit"><a href="#">삭제</a> </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->

    <!-- Related Products Section Begin -->
    <section class="related-products spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>Related Goods</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="related__products__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg">
                                <img src="assets/images/air.png" alt="">
                                <div class="product__label">
                                    <span>그룹명</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Dozen Cupcakes</a></h6>
                                <div class="product__item__price">$32.00</div>
                                <div class="cart_add">
                                    <a href="#">Detail View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg">
                                <img src="assets/images/case.png" alt="">
                                <div class="product__label">
                                    <span>그룹명</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Cookies and Cream</a></h6>
                                <div class="product__item__price">$30.00</div>
                                <div class="cart_add">
                                    <a href="#">Detail View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg">
                                <img src="assets/images/key.png" alt="">
                                <div class="product__label">
                                    <span>그룹명</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Gluten Free Mini Dozen</a></h6>
                                <div class="product__item__price">$31.00</div>
                                <div class="cart_add">
                                    <a href="#">Detail View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg">
                                <img src="assets/images/air.png" alt="">
                                <div class="product__label">
                                    <span>그룹명</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Cookie Dough</a></h6>
                                <div class="product__item__price">$25.00</div>
                                <div class="cart_add">
                                    <a href="#">Detail View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg">
                                <img src="assets/images/case.png" alt="">
                                <div class="product__label">
                                    <span>그룹명</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Vanilla Salted Caramel</a></h6>
                                <div class="product__item__price">$05.00</div>
                                <div class="cart_add">
                                    <a href="#">Detail View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg">
                                <img src="assets/images/key.png" alt="">
                                <div class="product__label">
                                    <span>그룹명</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">German Chocolate</a></h6>
                                <div class="product__item__price">$14.00</div>
                                <div class="cart_add">
                                    <a href="#">Detail View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 버튼 -->
    <section>
        <div class="manager-btn">
            <button type="submit">수정</button>
            <button type="submit">삭제</button>
            <button type="submit">목록</button>
        </div>
    </section>
    <!-- Related Products Section End -->
	<jsp:include page="/footer.jsp"></jsp:include>
<!-- Js Plugins -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.nice-select.min.js"></script>
<script src="assets/js/jquery.barfiller.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/jquery.slicknav.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/jquery.nicescroll.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>