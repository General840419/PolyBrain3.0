<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="feature.forum.service.ArtService"%>
<%@page import="feature.forum.vo.ArtVo"%>
<link href="${pageContext.request.contextPath}/view/forum/list/css/item.css" rel="stylesheet" />    <!--側邊欄的css-->
<script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>

<%
    ArtService artSvc = new ArtService();
    List<ArtVo> list = artSvc.findByMemNo(Integer.valueOf(request.getParameter("memNo")));
    if(request.getAttribute("ArtListData")==null) pageContext.setAttribute("ArtListData",list);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>討論區內頁</title>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>                                    <!-- ●●js  for jquery datatables 用 -->
    <script	src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>              <!-- ●●js  for jquery datatables 用 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" /> <!-- ●●css for jquery datatables 用 -->
    <!-- Favicon-->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath}/view/forum/list/css/styles.css" rel="stylesheet" />

   <style>
   body {
       background-color: #efe9e7;
   }

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
       <!-- ●● jquery datatables 設定 -->
            <script>
            	$(document).ready(function() {
            		$('#example').DataTable({
            			"lengthMenu": [3,5,10,20],
            			"searching": true,  //搜尋功能, 預設是開啟
            		    "paging": true,     //分頁功能, 預設是開啟
            		    "ordering": true,   //排序功能, 預設是開啟
            		    "language": {
            		        "processing": "處理中...",
            		        "loadingRecords": "載入中...",
            		        "lengthMenu": "顯示 _MENU_ 筆結果",
            		        "zeroRecords": "沒有符合的結果",
            		        "info": "顯示第 _START_ 至 _END_ 筆結果，共<font color=red> _TOTAL_ </font>筆",
            		        "infoEmpty": "顯示第 0 至 0 筆結果，共 0 筆",
            		        "infoFiltered": "(從 _MAX_ 筆結果中過濾)",
            		        "infoPostFix": "",
            		        "search": "搜尋:",
            		        "paginate": {
            		            "first": "第一頁",
            		            "previous": "上一頁",
            		            "next": "下一頁",
            		            "last": "最後一頁"
            		        },
            		        "aria": {
            		            "sortAscending":  ": 升冪排列",
            		            "sortDescending": ": 降冪排列"
            		        }
            		    }
            		});
            	});
            </script>


</head>
<body class="d-flex flex-column h-100">
    <main class="flex-shrink-0">
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
<!---------------------------------------------以下為側邊攔--------------------------------------------------------->
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">

<!---------------------------會員中心--------------------------->
                        <div class="sb-sidenav-menu-heading">會員中心</div>

                        <a class="nav-link" href="http://localhost:8080/PolyBrain/view/member/Member_Information.jsp"><div class="sb-nav-link-icon"></div>
                            個人資訊
                        </a>
                        <a class="nav-link" href="http://localhost:8080/PolyBrain/view/member/change_Member_Information.jsp"><div class="sb-nav-link-icon"></div>
                            更改個人資訊
                        </a>
                        <a class="nav-link" href="http://localhost:8080/PolyBrain/view/item/itemTrace.html"><div class="sb-nav-link-icon"></div>
                            我的收藏
                        </a>
                        <a class="nav-link" href="#"><div class="sb-nav-link-icon"></div>
                            我的貼文
                        </a>

<!---------------------------會員中心--------------------------->
<!-----------------------------商城---------------------------->
                        <div class="sb-sidenav-menu-heading">商城</div>

                        <a class="nav-link" href="http://localhost:8080/PolyBrain/view/item/search.html"><div class="sb-nav-link-icon"></div>
                            一般商品列表
                        </a>

                        <a class="nav-link" href="http://localhost:8080/PolyBrain/view/order/memberOrder.html"><div class="sb-nav-link-icon"></div>
                            購買清單
                        </a>
                        <a class="nav-link" href="http://localhost:8080/PolyBrain/view/order/bidOrderFront.html"><div class="sb-nav-link-icon"></div>
                            競標訂單
                        </a>

<!-----------------------------商城---------------------------->
<!-----------------------------預約---------------------------->
                        <div class="sb-sidenav-menu-heading">預約</div>

                        <a class="nav-link" href="http://localhost:8080/PolyBrain/view/book/Calendar.html"><div class="sb-nav-link-icon"></div>
                            現在預約
                        </a>
                        <a class="nav-link" href="http://localhost:8080/PolyBrain/view/book/BookingCheck.html"><div class="sb-nav-link-icon"></div>
                            預約場地查詢
                        </a>

<!-----------------------------預約---------------------------->

                    </div>
                </div>
            </nav>
        </div>
<!---------------------------------------------以上為側邊攔--------------------------------------------------------->






<!----------------------------------------------------------------------------------------------------->
        <div id="layoutSidenav_content"> <!--勿刪到-->




<table id="example" class="display" style="width: 100%">
<thead >
	<tr style="background-color:#ffffff">
	    <th>計數</th>
		<th>文章編號</th>
		<th>圖片</th>

		<th>貼文主題</th>
		<th>貼文內容</th>
		<th>發布時間</th>
		<th>貼文狀態</th>
		<th>遊戲類別</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
  </thead>

 <tbody>
	<c:forEach var="ArtVo" items="${ArtListData}" varStatus="s">
		<tr>
            <td>${s.count}</td>
			<td>${ArtVo.artNo}</td>
            <td><img src="<%=request.getContextPath()%>/Art/DBGifReader?artNo=${ArtVo.artNo}" width="100px"></td>
			<td>${ArtVo.artTitle}</td>
			<td>${ArtVo.artCon}</td>
			<td>
                <fmt:formatDate value="${ArtVo.artTime}" pattern="yyyy-MM-dd HH:mm:ss" />
            </td>
			<td>
                        <c:choose>
                            <c:when test="${ArtVo.artState == 0}">
                                未上架
                            </c:when>
                            <c:when test="${ArtVo.artState == 1}">
                                已上架
                            </c:when>
                            <c:otherwise>
                                未知狀態
                            </c:otherwise>
                        </c:choose>
                    </td>
			<td>
                    <c:choose>

                            <c:when test="${ArtVo.itemNo == 1}">
                                策略型
                            </c:when>
                            <c:when test="${ArtVo.itemNo == 2}">
                                派對型
                            </c:when>
                            <c:when test="${ArtVo.itemNo == 3}">
                                親子型
                            </c:when>
                            <c:when test="${ArtVo.itemNo == 4}">
                                 親子型
                             </c:when>
                            <c:when test="${ArtVo.itemNo == 4}">
                                 陣營型
                             </c:when>
                             <c:otherwise>
                                其他型
                            </c:otherwise>
                        </c:choose></td>


			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Art/Art.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="artNo" value="${ArtVo.artNo}">
			     <input type="hidden" name="action"	value="getOne_For_Update_mem"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Art/Art.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="artNo" value="${ArtVo.artNo}">
			     <input type="hidden" name="action" value="delete_mem"></FORM>
			</td>
		</tr>
	</c:forEach>
  </tbody>
</table>
<!-- Footer-->
<!-----------------------------以下為底板---------------------------->
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
                    <img src="${pageContext.request.contextPath}/view/head/images/信封.jpg">
                </a>
            </div>
        </div>
    </div>
</footer>
<!-----------------------------以上為底板---------------------------->
        </div>
<!----------------------------------------------------------------------------------------------------->
</div>
<!-- Bootstrap core JS-->


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js"
        integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${pageContext.request.contextPath}/view/forum/list/js/scripts.js"></script>

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