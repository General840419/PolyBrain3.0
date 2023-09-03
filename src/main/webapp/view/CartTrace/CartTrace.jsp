<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="feature.cart.dao.*"%>
<%@ page import="feature.cart.vo.*"%>
<%@ page import="feature.item.vo.*"%>
<%@ page import="feature.cart.service.*"%>
<%@ page import="feature.item.dao.impl.*"%>

<!-- <%@ page isELIgnored="false"%> -->

<%-- 此頁練習採用 EL 的寫法取值 --%>

<% %>



<html>
<head>
<title>確認訂單</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='lightpink'>

<table id="table-1">
	<tr><td>
		 <h3>確認訂單</h3>
		 <h4><a href="select.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>遊戲名稱</th>
        <th>商品簡介</th>
        <th>價格</th>
        <th>數量</th>
        <th>總價</th>
	</tr>
	<c:forEach var="itemVOs" items="${itemVONewList}" >
		<tr>
			<td>${itemVOs.itemName}</td>
			<td>${itemVOs.itemProdDescription}</td>
			<td>${itemVOs.itemPrice}</td>
		<td>

	    <c:forEach var="cartTraceVOs" items="${cartTraceVOList}" >
           <c:if test="${cartTraceVOs.itemNo eq itemVOs.itemNo}">
                ${cartTraceVOs.quantity}
           <td>${cartTraceVOs.quantity * itemVOs.itemPrice}</td>
          </c:if>
        </c:forEach>
        </td>
		</tr>
	</c:forEach>
   <span class="orderTotal"> 小計:${orderTotal} </span>

</table>
<form method="post" action="<%=request.getContextPath()%>/view/CartTrace/ConfirmOrder" >
<div class="container">
				<div class="title">填寫付款資訊</div>
				<div class="form-container">
					<div class="form-row">

						<label for="receiverName">收件人姓名：</label>
						<input type="text" id="receiverName" name="receiverName">
						<p style="display: block; color: red; padding: 0px 3px;">${errorMsgs["receiverName"]}</p>

					</div>
					<div class="form-row">
						<label for="receiverPhone">收件人電話：</label>
						<input type="text" id="receiverPhone" name="receiverPhone" >
						<p style="display: block; color: red; padding: 0px 3px">${errorMsgs["receiverPhone"]}</p>
					</div>

					<div class="form-row">
						<label for="receiverAddress">收件人地址：</label>
						<input type="text"
						id="receiverAddress" name="receiverAddress">
						<p style="display: block; color: red; padding: 0px 3px">${errorMsgs["receiverAddress"]}</p>
					</div>
				</div>
			</div>
			<div class="form-row">
				<label for="receiverMethod">寄送方式：</label>
				<select id="receiverMethod" name="receiverMethod" required>
					<option value="default" selected>請選擇寄送方式...</option>
					<option value="mail">郵寄</option>
					<option value="storePickup">超商取貨</option>
				</select>
			</div>
			</div>
			<input type="hidden" name="action" value="orderConfirm" id="actionInput">
			<input type="submit" class="confirmButton" value="confirm" id="orderconfirm">
			<p style="display: block; color: red; padding: 0px 3px">${errorMsgs["noConfirmOrder"]}</p>
			<a href="#" class="canceled">返回購物車</a>


</form>
<script>

</script>
</body>
</html>