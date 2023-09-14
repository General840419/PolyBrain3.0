    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="feature.forum.service.ArtService"%>
    <%@page import="feature.forum.vo.ArtVo"%>
    <%@page import="feature.forum.service.RpyService"%>
    <%@page import="feature.forum.vo.RpyVo"%>
    <%@ page import="java.util.List" %>
<%
       Integer memNo = (Integer) session.getAttribute("memNo");

              if (memNo == null) {
                  // memNo不存在于session中，执行重定向
                        response.sendRedirect(request.getContextPath() + "/view/member/login.html");
                        return;
              }
%>

    <%
        ArtService artSvc = new ArtService();
        ArtVo artVo = artSvc.getOneArt(Integer.valueOf(request.getParameter("artNo")));
        pageContext.setAttribute("artVo", artVo);
    %>
    <%
           RpyService rpySvc = new RpyService();
           List<RpyVo> rpyList = rpySvc.findByArt(Integer.valueOf(request.getParameter("artNo")));
           pageContext.setAttribute("rpyList", rpyList);
    %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>討論區裡頁</title>

        <!-- Favicon-->
         <script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>                                    <!-- ●●js  for jquery datatables 用 -->
            <script	src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
             <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" /> <!-- ●●css for jquery datatables 用 -->
             <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/view/forum/innerpage/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.22/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.22/dist/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.all.min.js"></script>


    </head>
<body class="d-flex flex-column h-100">
    <main class="flex-shrink-0">
    <!-- Responsive navbar-->

        <!-- Navigation-->
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

    <!-- Page content-->
    <div class="container mt-5">

        <div class="row">
            <div class="col-lg-8">
                <!-- Post content-->
                <article>
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <h1 class="fw-bolder mb-1">${artVo.artTitle}</h1>
                        <!-- Post meta content-->
                        <div class="text-muted fst-italic mb-2">${artVo.artTime}</div>
                        <!-- Post categories-->
                        <button class="btn btn-primary " id="button-collect"  type="button">貼文檢舉</button>
                    </header>
                    <!-- Preview image figure-->
                    <figure class="mb-4"><img class="img-fluid rounded" src="<%=request.getContextPath()%>/Art/DBGifReader?artNo=${artVo.artNo}" width="100px" alt="..." /></figure>
                    <!-- Post content-->
                 <section class="mb-5">
                     <p class="fs-5 mb-4">${artVo.artCon}</p>
                 </section>
                </article>
                <!-- Comments section-->
                <section class="mb-5">
                    <div class="card bg-light">
                        <div class="card-body">
                            <!-- Comment form-->
                            <form class="mb-4">
                                <!-- Comment with nested comments-->
                                <!-- Comment with nested comments-->
                                <c:forEach var="rpy" items="${rpyList}">
                                    <div class="d-flex mb-4">
                                        <!-- Parent comment-->
                                        <div class="flex-shrink-0">

                                        </div>
                                        <div class="flex-shrink-0"><img class="rounded-circle" src="${pageContext.request.contextPath}/view/forum/mainpage/images/討論區網民C.png" alt="..." style="width: 100px; height: 100px;"/></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">${rpy.memNo}</div>
                                            <div>${rpy.rpyCon}</div>
                                            <div>${rpy.rpyTime}</div>

                                              <form id="" method="post" action="<%=request.getContextPath()%>/RpyServlet">
                                                            <input type="hidden" name="rpyNo" value="${rpy.rpyNo}">
                                                            <input type="hidden" name="artNo" value="${artVo.artNo}">
                                                            <input type="hidden" name="action" value="delete">
                                                            <button type="submit">删除</button>
                                                        </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            <!-- Add Comment Button -->
                            <form id="insertForm" method="post" action="<%=request.getContextPath()%>/RpyServlet">
                                                        <textarea class="form-control" name="rpyCon" rows="3" placeholder="留言..."value="${rpy.rpyCon}"></textarea>
                                                           <button class="btn btn-primary position-absolute bottom-0 end-0" id="addCommentBtn" type="button" >新增留言</button>

                                                            <input type="hidden" name="artNo" value="${artVo.artNo}">
                                                            <input type="hidden" name="action"  value="insert">
                                                        </form>


                        </div>
                    </div>
                </section>
            </div>
            <!-- Side widgets-->
            <div class="col-lg-4">
                <!-- Search widget-->
                <div class="card mb-4">
                    <div class="card-header">搜尋</div>
                    <div class="card-body">
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="輸入關鍵字..." aria-label="Enter search term..." aria-describedby="button-search" />

                            <button class="btn btn-primary" id="button-search" type="button">查詢</button>
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
    <!-- Core theme JS-->


 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js"
            integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="js/scripts.js"></script>
    <script>
        const submitButton = document.querySelector("#addCommentBtn");
        submitButton.addEventListener("click", function() {
              Swal.fire({
                  title: '確定送出??',
                  text: "確認內容編輯後即可送出!",
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'OK'
              }).then((result) => {
                  if (result.isConfirmed) {
                      // 手動觸發表單的提交
                      document.querySelector("#insertForm").submit();
                  }
              });
          });
    </script>
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