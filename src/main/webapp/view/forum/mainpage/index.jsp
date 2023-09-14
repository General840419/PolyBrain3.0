<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>討論區主頁</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />

 <script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>
     <style>

         .flex-container {
        display: flex;       /* 啟用flexbox佈局 */
        align-items: flex-start;  /* 內容從上到下對齊 */
    }
         article {       /* 隱私權設定 */
        font-size: 15px; /* 或其他合適的大小 */
        padding-left: 40px; /* 或其他合適的邊距 */
        width: 80%; /* 或其他合適的寬度 */
        margin: 0 auto; /* 這會使文章內容在頁面中居中 */
        margin-top: 40px;  /* 依您的需求調整這個值 */
    }
            .backto {
        position: fixed; /* 可以使按鈕在滾動時保持固定位置 */
        bottom: 10%; /* 可以根據需要調整到頁面的具體位置 */
        left: 50%; /* 將按鈕移到視窗的一半 */
        transform: translateX(-50%); /* 水平置中 */
    }

    #gotop img {
        display: block;
        margin: 0 auto; /* 圖片水平置中 */
    }
     </style>
</head>
<body>
    <!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
               <div class="container px-5">
                   <a class="navbar-brand" href="index.html">
                    <img src="${pageContext.request.contextPath}/view/logo/PolyBrain_Logo.png" style="width: 110px; height: auto; margin-bottom: 5px;"></a>
                   <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                       data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                       aria-expanded="false" aria-label="Toggle navigation"><span
                           class="navbar-toggler-icon"></span></button>
                   <div class="collapse navbar-collapse" id="navbarSupportedContent">
                       <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                   <!-- <div class="collapse navbar-collapse" id="navbarSupportedContent">
                       <ul class="navbar-nav ms-auto mb-2 mb-lg-0 nav-list"> 添加 nav-list 類別 -->
                           <li class="nav-item dropdown">
                               <a class="nav-link dropdown-toggle" id="buyitem" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">商城</a>
                               <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                   <li><a class="dropdown-item" href="blog-home.html">商品資訊</a></li>
                                   <li><a class="dropdown-item" href="blog-post.html">商城訂單查詢</a></li>
                               </ul>
                           </li>
                           <li class="nav-item dropdown">
                               <a class="nav-link dropdown-toggle" id="buybid" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">競標</a>
                               <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                   <li><a class="dropdown-item" href="blog-home.html">熱門競標</a></li>
                                   <li><a class="dropdown-item" href="blog-post.html">競標訂單查詢</a></li>
                               </ul>
                           </li>
                           <li class="nav-item dropdown">
                               <a class="nav-link dropdown-toggle" id="mybooking" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">預約場地</a>
                               <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                   <li><a class="dropdown-item" href="blog-home.html">現在預約</a></li>
                                   <li><a class="dropdown-item" href="blog-post.html">預約場地查詢</a></li>
                               </ul>
                           </li>
                           <li class="nav-item">
                               <a class="nav-link" id="discuss" href="#" role="button">討論區</a>
                           </li>
                           <li class="nav-item ">
                               <a class="nav-link" id="memberdistrict" href="#" role="button">會員中心</a>
                           </li>
                           <li class="nav-item"><a class="nav-link" href="faq.html">常見問題</a></li>


                           <li>
                               <form class="d-flex">
                                   <button class="btn btn-outline-dark" type="submit">
                                       <i class="bi-cart-fill me-1"></i>
                                       購物車
                                       <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                                   </button>
                               </form>
                           </li>
                           <li class="nav-item dropdown">
                               <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                  data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                               <ul id="dropdown-menu" class="dropdown-menu dropdown-menu-end"
                                   aria-labelledby="navbarDropdown">
                               </ul>
                           </li>

                       </ul>
                   </div>
               </div>
           </nav>
           <div id="layoutSidenav">  <!--勿刪到-->
    <!-- Page header with logo and tagline-->
    <header class="py-5 bg-light border-bottom mb-4">
        <div class="container">
            <div class="text-center my-5">
                <h1 class="fw-bolder">全台最大桌遊討論區</h1>
                <p class="lead mb-0">燃燒你內心深處的桌遊魂!!!</p>
            </div>
        </div>
    </header>
    <!-- Page content-->
    <div class="container">
        <div class="row">
            <!-- Blog entries-->
            <div class="col-lg-8">
                <!-- Featured blog post-->
                <div class="card mb-4">
                    <a href="#!"><img class="card-img-top" src="images/策略型桌遊.jpg" alt="..." /></a>
                    <div class="card-body">
                        <h2 class="card-title">策略型桌遊</h2>
                        <p class="card-text">策略型桌遊是一種棋盤遊戲，玩家需要制定深思熟慮的策略，以達成特定目標或擊敗對手。這些遊戲強調戰術規劃、資源管理和預測對手的行動。玩家必須權衡不同選擇，並運用智慧和計謀來贏得遊戲，這種遊戲常常引發精彩的頭腦對決。</p>
                        <a class="btn btn-primary" href="../list/List.jsp?itemNo=1">進入討論區 →</a>
                    </div>
                </div>
                <!-- Nested row for non-featured blog posts-->
                <div class="row">
                <div class="col-lg-6">
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="images/派對型桌遊.jpg" alt="..." /></a>
                                <div class="card-body">
                                    <h2 class="card-title h4">派對型桌遊</h2>
                                    <p class="card-text">
                                   派對型桌遊是設計用於大型社交聚會的遊戲，強調歡笑和互動。這些遊戲通常簡單易懂，不需要太多規則解釋，能夠讓參與者快速參與。它們提供了輕鬆的娛樂，常包括有趣的挑戰、角色扮演或派對主題，是營造歡樂氛圍和促進社交互動的理想選擇。</p>
                                    <a class="btn btn-primary" href="../list/List.jsp?itemNo=2">進入討論區 →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="images/親子型桌遊.jpg" alt="..." /></a>
                                <div class="card-body">

                                    <h2 class="card-title h4">親子型桌遊</h2>
                                    <p class="card-text">親子型桌遊是專為家庭設計的遊戲，旨在促進親子之間的互動和學習。這些遊戲通常具有教育性質，可以培養孩子的認知和社交技能，同時提供親子共度時光的樂趣。它們往往包括簡單的規則和有趣的主題，適合不同年齡層的兒童參與，是家庭娛樂和教育的完美結合。</p>
                                    <a class="btn btn-primary" href="../list/List.jsp?itemNo=3">進入討論區 →</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="images/合作型桌遊.jpg" alt="..." /></a>
                                <div class="card-body">

                                    <h2 class="card-title h4">合作型桌遊</h2>
                                    <p class="card-text">合作型桌遊是一種強調團隊合作的遊戲，玩家們共同努力達到共同目標，而不是互相競爭。這種遊戲鼓勵玩家們溝通、協作和策略規劃，以克服遊戲中的挑戰。合作型桌遊通常有引人入勝的故事情節和多樣的角色，讓玩家們深入投入遊戲世界，是團隊建設和互動的絕佳方式。</p>
                                    <a class="btn btn-primary" href="../list/List.jsp?itemNo=4">進入討論區 →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="images/陣營型桌遊.jpg" alt="..." /></a>
                                <div class="card-body">

                                    <h2 class="card-title h4">陣營型桌遊</h2>
                                    <p class="card-text">陣營型桌遊是一種遊戲，將玩家們分成不同的陣營或隊伍，並要求他們在遊戲中合作或競爭以實現特定目標。每個陣營通常都有獨特的角色或特殊能力，玩家必須巧妙運用這些特點來達成勝利條件。這種遊戲模式鼓勵策略、團隊合作和互動，使玩家深陷於遊戲的陣營競爭中。</p>
                                    <a class="btn btn-primary" href="../list/List.jsp?itemNo=5">進入討論區 →</a>
                                </div>
                            </div>

                        </div>
                </div>
            </div>
            <!-- Side widgets-->
            <div class="col-lg-4">
                <div class="card mb-4">
                        <div class="card-header">搜尋</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="輸入關鍵字..." aria-label="Enter search term..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button" >查詢</button>
                            </div>
                        </div>
                    </div>

                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">桌遊類別</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">策略類</a></li>
                                        <li><a href="#!">派對類</a></li>
                                        <li><a href="#!">親子類</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">合作類</a></li>
                                        <li><a href="#!">陣營類</a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">討論區須知</div>
                        <div class="card-body">歡迎來到桌遊討論區！這裡是一個熱愛桌上遊戲的社群，讓我們共同營造友善、有趣的討論環境。請尊重彼此，避免冒犯、不雅言辭與爭執。分享遊戲心得、規則解釋、推薦等話題。請勿洩漏劇透、侵犯版權或做商業宣傳。讓我們一同享受桌遊帶來的樂趣吧！</div>
                    </div>
                </div>
            </div>
        </div>
    <!-- Footer-->
  <footer class="bg-dark py-4 mt-auto">
      <div class="container px-5">
          <div class="row align-items-center justify-content-between flex-column flex-sm-row">
              <div class="col-auto">
                  <div class="small m-0 text-white">Copyright © 2023 PolyBrain. All rights reserved. </div>
              </div>
              <div class="col-auto">



                  <a class="link-light small" href="http://localhost:8080/PolyBrain/view/head/Privacy.html">隱私權協定</a>
                  <span class="text-white mx-1">&middot;</span>
                  <a class="link-light small" href="http://localhost:8080/PolyBrain/view/head/Forus.html">關於我們</a>
                  <span class="text-white mx-1">&middot;</span>
                  <a href="mailto:ps66391@gmail.com?subject=聯絡我們的請求&body=請在此寫下您的問題。"
                     title="用 Email 轉寄" onclick="return confirm('您確定要前往email寄信?');">
                      <img src="${pageContext.request.contextPath}/view/head/images/信封.jpg" >
                  </a>




              </div>
          </div>
      </div>
  </footer>
    <!-- Bootstrap core JS-->
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js"
         integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g=="
         crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 <!-- Core theme JS-->
 <script src="js/scripts.js"></script>

    <script>
        function scrollToTop() {
        window.scrollTo({top: 0, behavior: 'smooth'}); // 使用平滑的滾動效果
        }

               $(document).ready(function(){
                validateMemStatus();
            });
        async function validateMemStatus() {
        const response = await fetch('/PolyBrain/general/validateMemStatus', {
        method: 'POST',
        headers: { 'content-type': 'application/json; charset:utf-8' },
        })
        .then(resp => resp.json())
        .then(data => {
        console.log(data);
        const { memNo, memName, loginStatus } = data;
        $('ul#dropdown-menu').append(`
        <li><a class="dropdown-item" href="http://localhost:8080/PolyBrain/view/member/Member_Information.jsp">會員專區</a></li>
        <li><a class="dropdown-item" href="#!">購物車</a></li>
        <li><hr class="dropdown-divider" /></li>
        `);
        if (loginStatus) {
        $('span#memName').text(memName);
        $('ul#dropdown-menu').append('<li><a id="logOut" class="dropdown-item" href="http://localhost:8080/PolyBrain/view/member/logout.jsp">登出</a></li>');
        let memDetail = [memNo, memName];
        return memDetail;
        } else {
        $('ul#dropdown-menu').append('<li><a id="logOut" class="dropdown-item" href="http://localhost:8080/PolyBrain/view/member/login.html">登入</a></li>');
        }
        });
        return response;
        }

              let bidEventList = document.querySelectorAll('.bidEventList');
            bidEventList.forEach(link => {
                link.addEventListener('click', function (event) {
                    event.preventDefault();
                    const biddingEvent = link.getAttribute('data-event-id');
                   const bidEventURL = 'http://localhost:8080/PolyBrain/view/bid/BidOnItemPage2.jsp';
                    const url = `${bidEventURL}?bidEventId=${biddingEvent}`;
                    window.location.href = url;
                });
            });
    </script>
</body>
</html>
