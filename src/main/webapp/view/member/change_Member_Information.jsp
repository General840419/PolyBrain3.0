<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="feature.mem.service.*"%>
<%@page import="feature.mem.controller.*"%>
<%@page import="feature.mem.dao.*"%>
<%@page import="feature.mem.vo.*"%>

<link href="<%= request.getContextPath() %>/view/member/css/item.css" rel="stylesheet" />    <!--側邊欄的css-->
<script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>

<%
       Integer memNo = (Integer) session.getAttribute("memNo");
              if (session != null) {
                         memNo = (Integer) session.getAttribute("memNo");
                     }

                     if (memNo == null) {
                         // memNo不存在于session中，执行重定向
                               response.sendRedirect(request.getContextPath() + "/view/member/login.html");
                     }
    if (memNo != null) {
        MemDaoImpl memDao = new MemDaoImpl(); // 实例化你的 DAO 类
        MemVo memVo = memDao.getMemberByMemNo(memNo);
        pageContext.setAttribute("memVo", memVo);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PolyBrain - 會員個人資訊</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .main-container {
            width: 95%;
            height: 85%;
            border-radius: 20px;
            background-color: lightblue;
            margin: auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .info {
            border: 1px solid black;
            width: 100%;
            height: 85%;
            background-color: white;
            text-align: center;
            padding: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .header {
            text-align: center;
            color: black;
        }

        .info-row {
            border: 1.5px solid black;
            padding: 13.5px;
            margin-top: 20px;
            border-radius: 10px;
            width: 500px;
            font-weight: bold;
            display: flex;
            /* 使用 flex 布局 */
            align-items: center;
            /* 垂直居中对齐 */
        }

        .info-label {
            font-weight: bold;
            width: 80px;
            flex-shrink: 0;
            /* 防止缩小，保持固定宽度 */
            margin-right: 10px;
            /* 向右边留出一些间距 */
            transition: margin-right 0.3s ease;
            /* 添加过渡效果 */
        }

        .info-value-box {
            flex-grow: 1;
            /* 占满剩余空间 */
            text-align: left;
            display: flex;
            align-items: center;
            /* 垂直居中对齐 */
            border-radius: 5px;
        }

        .info-row:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body id="page-top">
<!---------------------------------------------以下為頂板--------------------------------------------------------->
<main class="flex-shrink-0">

    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: black;">
            <div class="container px-5">
                <a class="navbar-brand" href="index.html">
                 <img src="<%= request.getContextPath() %>/view/logo/PolyBrain_Logo.png" style="width: 110px; height: auto; margin-bottom: 5px;"></a>
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
                                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/view/item/search.html">商品資訊</a></li>
                                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/view/order/memberOrder.html">商城訂單查詢</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="buybid" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">競標</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/view/bid/BidOnHomePage.html">熱門競標</a></li>
                                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/view/order/bidOrderFront.html">競標訂單查詢</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="mybooking" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">預約場地</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/view/book/Calendar.html">現在預約</a></li>
                                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/view/book/BookingCheck.html">預約場地查詢</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="discuss" href="<%= request.getContextPath() %>/view/forum/mainpage/index.jsp" role="button">討論區</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="memberdistrict" href="<%= request.getContextPath() %>/view/member/Member_Information.jsp" role="button">會員中心</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/view/head/question.html">常見問題</a></li>
                        <li class="nav-item">
                            <a class="nav-link" id="memberdistrict" href="<%= request.getContextPath() %>/view/CartTrace/Cart.jsp" role="button">購物車</a>
                        </li>
                        <span id="memName" style="margin-left:12px;"></span>
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
</main>
<!---------------------------------------------以上為頂板--------------------------------------------------------->



<div id="layoutSidenav">  <!--勿刪到-->
<!---------------------------------------------以下為側邊攔--------------------------------------------------------->
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">

                                <!-------------會員中心-------------->
                        <div class="sb-sidenav-menu-heading">會員中心</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/member/Member_Information.jsp"><div class="sb-nav-link-icon"></div>
                            個人資訊
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/member/change_Member_Information.jsp"><div class="sb-nav-link-icon"></div>
                            更改個人資訊
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/item/itemTrace.html"><div class="sb-nav-link-icon"></div>
                            我的收藏
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/forum/list/Memartlist.jsp"><div class="sb-nav-link-icon"></div>
                            我的貼文
                        </a>

                                <!-------------會員中心-------------->
                                <hr style="background-color: whitesmoke;; border-width: 1px; border-style: solid;">
                                <!---------------商城--------------->
                        <div class="sb-sidenav-menu-heading">商城</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/item/search.html"><div class="sb-nav-link-icon"></div>
                            一般商品列表
                        </a>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/order/memberOrder.html"><div class="sb-nav-link-icon"></div>
                            購買清單
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/order/bidOrderFront.html"><div class="sb-nav-link-icon"></div>
                            競標訂單
                        </a>

                                <!---------------商城--------------->
                                <hr style="background-color: whitesmoke;; border-width: 1px; border-style: solid;">
                                <!---------------預約--------------->
                        <div class="sb-sidenav-menu-heading">預約</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/book/Calendar.html"><div class="sb-nav-link-icon"></div>
                            現在預約
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/book/BookingCheck.html"><div class="sb-nav-link-icon"></div>
                            預約場地查詢
                        </a>
                                <!---------------預約--------------->
                    </div>
                </div>
            </nav>
        </div>
<!---------------------------------------------以上為側邊攔--------------------------------------------------------->







        <div id="layoutSidenav_content"> <!--勿刪到-->
<!-----------------------------以下為內容---------------------------->
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">更改個人資訊</h1>
                </div>
                <div class="info">
                    <form action="<%=request.getContextPath()%>/loginRequired/MemInformationServlet/do" method="post">

                        <input id ="memNo" type="hidden" name="memNo" value="${memVo.memNo}">

                        <div class="info-row">
                            <label class="info-label" for="memName">姓名:</label>
                            <input id ="memName" name="memName" type="text" value="${memVo.memName}" onclick="hideContent('memName.errors');" />
                            <span  id ="memName.errors" >${errorMsgs.memName}<br/></span>
                        </div>

                        <div class="info-row">
                            <label class="info-label" for="memEmail">信箱:</label>
                            <input id ="memEmail" name="memEmail" type="text" value="${memVo.memEmail}" onclick="hideContent('memEmail.errors');" />
                            <span  id ="memEmail.errors" >${errorMsgs.memEmail}<br/></span>
                        </div>

                        <div class="info-row">
                            <label class="info-label" for="memPh">手機:</label>
                            <input id ="memPh" name="memPh" type="text" value="${memVo.memPh}" onclick="hideContent('memPh.errors');" />
                            <span  id ="memPh.errors" >${errorMsgs.memPh}<br/></span>
                        </div>

                       <div class="info-row">
                            <label class="info-label" for="memPwd">密碼:</label>
                            <input id ="memPwd" name="memPwd" type="text" value="${memVo.memPwd}" onclick="hideContent('memPwd.errors');" />
                            <span  id ="memPwd.errors" >${errorMsgs.memPwd}<br/></span>
                       </div>

                       <div class="info-row">
                            <label class="info-label" for="memPid">身分證:</label>
                            <input id ="memPid" name="memPid" type="text" value="${memVo.memPid}" onclick="hideContent('memPid.errors');" />
                            <span  id ="memPid.errors" >${errorMsgs.memPid}<br/></span>
                       </div>

                       <div class="info-row">
                            <label class="info-label" for="memAddress">地址:</label>
                            <input id ="memAddress" name="memAddress" type="text" value="${memVo.memAddress}" onclick="hideContent('memAddress.errors');" />
                            <span  id ="memAddress.errors" >${errorMsgs.memAddress}<br/></span>
                       </div>

                       <div class="info-row">
                            <label class="info-label" for="memBirth">生日:</label>
                            <input id ="memBirth" name="memBirth" type="text" value="${memVo.memBirth}" onclick="hideContent('memBirth.errors');" />
                            <span  id ="memBirth.errors" >${errorMsgs.memBirth}<br/></span>
                       </div>

                       <div class="info-row">
                            <label class="info-label" for="memGender">性別:</label>
                            <select id="memGender" name="memGender" onclick="hideContent('memGender.errors');">
                                <option value="0" ${memVo.memGender == '0' ? 'selected' : ''}>女</option>
                                <option value="1" ${memVo.memGender == '1' ? 'selected' : ''}>男</option>
                            </select>
                            <span id="memGender.errors">${errorMsgs.memGender}<br/></span>
                       </div>
                        <br>
                        <div>
                             <div></div>
                                <input  type="hidden" name="action" value="update">
                                <button type="submit" id="submit"> 送出修改 </button>
                             <div></div>
                        </div>
                    </form>
                </div>
            </main>
<!-----------------------------以上為內容---------------------------->

<!-----------------------------以下為底板---------------------------->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="small m-0 text-white">Copyright © 2023 PolyBrain. All rights reserved. </div>
            </div>
            <div class="col-auto">
                <a class="link-light small" href="<%= request.getContextPath() %>/view/head/Privacy.html">隱私權協定</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="h<%= request.getContextPath() %>/view/head/Forus.html">關於我們</a>
                <span class="text-white mx-1">&middot;</span>
                <a href="mailto:ps66391@gmail.com?subject=聯絡我們的請求&body=請在此寫下您的問題。"
                   title="用 Email 轉寄" onclick="return confirm('您確定要前往email寄信?');">
                    <img src="image/信封.jpg" >
                </a>
            </div>
        </div>
    </div>
</footer>
<!-----------------------------以上為底板---------------------------->
        </div>
</div>




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
    <li><a class="dropdown-item" href="<%= request.getContextPath() %>/view/member/Member_Information.jsp">會員專區</a></li>
    <li><a class="dropdown-item" href="#!">購物車</a></li>
    <li><hr class="dropdown-divider" /></li>
    `);
    if (loginStatus) {
    $('span#memName').text(memName);
    $('ul#dropdown-menu').append('<li><a id="logOut" class="dropdown-item" href="<%= request.getContextPath() %>/view/member/logout.jsp">登出</a></li>');
    let memDetail = [memNo, memName];
    return memDetail;
    } else {
    $('ul#dropdown-menu').append('<li><a id="logOut" class="dropdown-item" href="<%= request.getContextPath() %>/view/member/login.html">登入</a></li>');
    }
    });
    return response;
    }

          let bidEventList = document.querySelectorAll('.bidEventList');
        bidEventList.forEach(link => {
            link.addEventListener('click', function (event) {
                event.preventDefault();
                const biddingEvent = link.getAttribute('data-event-id');
               const bidEventURL = '<%= request.getContextPath() %>/view/bid/BidOnItemPage2.jsp';
                const url = `${bidEventURL}?bidEventId=${biddingEvent}`;
                window.location.href = url;
            });
        });
</script>
</body>
</html>