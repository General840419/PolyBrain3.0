<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="feature.mem.service.*"%>
<%@page import="feature.mem.controller.*"%>
<%@page import="feature.mem.dao.*"%>
<%@page import="feature.mem.vo.*"%>

<link href="<%= request.getContextPath() %>/view/member/css/item.css" rel="stylesheet" />    <!--側邊欄的css-->
<script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>會員資料修改</title>

<style type="text/css">

	button {
		padding: 5px;
	}
	form {
		display: table;
	}
	form div {
		display: table-row;
	}
	label, input, span, select {
		display: table-cell;
		margin: 5px;
		text-align: left;
	}
	input[type=text], input[type=password], select, textarea {
		width: 200px;
		margin: 5px;
	}
	form div div {
		display: table-cell;
	}
	.center {
        margin-left: auto;
        margin-right: auto;
    }
</style>
</head>
<body id="page-top">
<!---------------------------------------------以下為頂板--------------------------------------------------------->
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: black;">
        <div class="container px-5">
            <img src="${pageContext.request.contextPath}/view/logo/PolyBrain_Logo.png" style="width: 110px; height: auto; margin-bottom: 5px;"></a>
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
                        <div class="sb-sidenav-menu-heading">會員</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/member/listAllmem.jsp"><div class="sb-nav-link-icon"></div>
                            所有會員管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/forum/Listallarti.jsp"><div class="sb-nav-link-icon"></div>
                            討論區文章管理
                        </a>
                                <!-------------會員中心-------------->
                                <!--------------商城---------------->
                        <div class="sb-sidenav-menu-heading">商城</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/item/itemConsole.html"><div class="sb-nav-link-icon"></div>
                            商城管理
                        </a>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/item/itemClassConsole.html"><div class="sb-nav-link-icon"></div>
                            商品類別管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/order/listAllOrder.jsp"><div class="sb-nav-link-icon"></div>
                            訂單管理
                        </a>
                                <!-------------商城-------------->
                                <!-------------預約-------------->
                        <div class="sb-sidenav-menu-heading">預約</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/book/BookTable.html"><div class="sb-nav-link-icon"></div>
                            報到管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/bookingtast/Modifytimeperiod.jsp"><div class="sb-nav-link-icon"></div>
                            時段管理
                        </a>
                                <!-------------預約-------------->
                                <!-------------競標-------------->
                        <div class="sb-sidenav-menu-heading">預約</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/bid/BidEventList.jsp"><div class="sb-nav-link-icon"></div>
                            競標活動管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/bid/BidItemTable.html"><div class="sb-nav-link-icon"></div>
                            競標商品管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/order/bidOrderBackend.html"><div class="sb-nav-link-icon"></div>
                            競標訂單
                        </a>
                                <!-------------競標-------------->
                        <div class="sb-sidenav-menu-heading">員工</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/emp/allEmpList.jsp"><div class="sb-nav-link-icon"></div>
                            員工管理
                        </a>
                    </div>
                </div>
            </nav>
        </div>
<!---------------------------------------------以上為側邊攔--------------------------------------------------------->


        <div id="layoutSidenav_content"> <!--勿刪到-->
<!-----------------------------以下為內容---------------------------->
            <main>
                </nav>

                    <br>
                	<div align="center"> <h2>會員資料修改</h2>
                	<h3 style="color: gray;"><a class="navbar-brand" href="<%=request.getContextPath()%>/view/member/listAllmem.jsp">回查詢頁${success}</a></h3></div>
                    <hr>
                	<div align="center">
                    		<h3><b>所有欄位皆為必填欄位</b></h3>
                    		<form action="<%=request.getContextPath()%>/general/listAllmemServlet/do" method="post">
                    			<div>
                    			<label for="memNo">會員編號:</label>
                    			<input id ="memNo" name="memNo" type="text" value="${param.memNo}" style="border:0px ; font-weight: bold;" readonly />
                    			</div>

                    			<div>
                    			<label for="memName">會員姓名:</label>
                    			<input id ="memName" name="memName" type="text" value="${param.memName}" onclick="hideContent('memName.errors');" />
                    			<span  id ="memName.errors" class="error">${errorMsgs.memName}<br/></span>
                    			</div>

                    			<div>
                    			<label for="memPid">身分證:</label>
                    			<input id ="memPid" name="memPid" type="text" value="${param.memPid}" onclick="hideContent('memPid.errors');" />
                    			<span  id ="memPid.errors" class="error">${errorMsgs.memPid}</span>
                    			</div>

                    			<div>
                    			<label for="memEmail">信箱:</label>
                    			<input id ="memEmail" name="memEmail" type="text" value="${param.memEmail}" onclick="hideContent('memEmail.errors');" />
                    			<span  id ="memEmail.errors" class="error">${errorMsgs.memEmail}</span>
                    			</div>

                    			<div>
                    			<label for="memPh">手機:</label>
                    			<input id ="memPh" name="memPh" type="text" value="${param.memPh}" onclick="hideContent('memPh.errors');" />
                    			<span  id ="memPh.errors" class="error">${errorMsgs.memPh}</span>
                    			</div>

                                <div>
                    			<label for="memAddress">地址:</label>
                    			<input id ="memAddress" name="memAddress" type="text" value="${param.memAddress}" onclick="hideContent('memAddress.errors');" />
                    			<span  id ="memAddress.errors" class="error">${errorMsgs.memAddress}</span>
                    			</div>

                    			<div>
                                <label for="memBirth">生日:</label>
                                <input id ="memBirth" name="memBirth" type="date" value="${param.memBirth}" onclick="hideContent('memBirth.errors');" />
                                <span  id ="memBirth.errors" class="error">${errorMsgs.memBirth}</span>
                                </div>

                                <div>
                                    <label for="memAuth">權限:</label>
                                    <select id="memAuth" name="memAuth" onclick="hideContent('memAuth.errors');">
                                        <option value="0" ${param.memAuth == '0' ? 'selected' : ''}>會員</option>
                                        <option value="1" ${param.memAuth == '1' ? 'selected' : ''}>黑名單</option>
                                    </select>

                                </div>


                    			<div>
                                	<div></div>
                                	<input  type="hidden" name="action" value="update1">
                                	<button type="submit" id="submit"> 送出修改 </button>
                                	<div></div>
                                </div>
                    		</form>
                    	</div>
            </main>
<!-----------------------------以上為內容---------------------------->
        </div>
    </div>
</body>
</html>
