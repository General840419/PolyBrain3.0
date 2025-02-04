<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page import="java.util.*" %>
            <%@ page import="feature.cart.dao.*" %>
                <%@ page import="feature.cart.vo.*" %>
                    <%@ page import="feature.item.vo.*" %>
                        <%@ page import="feature.cart.service.*" %>
                            <%@ page import="feature.item.dao.impl.*" %>

                                <!-- <%@ page isELIgnored="false"%> -->

                                <%-- 此頁練習採用 EL 的寫法取值 --%>
<!DOCTYPE html>
<html lang="zh-Hant">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <title>PolyBrain購物車</title>


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

        table,
        th,
        td {
            border: 1px solid #CCCCFF;
        }

        th,
        td {
            padding: 5px;
            text-align: center;
        }

        img {
            max-height: 100px;
            width: auto;
            margin: 0;
        }
    </style>

</head>

<body>

    <div class="container">
        <div class="row">


            <table id="table-1">
                <tr>
                    <td>
                        <h3>購物車</h3>
                        <h4><a href="select.jsp">回首頁</a></h4>
                    </td>
                </tr>
            </table>

            <table>
                <tr>
                    <th>圖片</th>
                    <th>遊戲名稱,應該要a標籤</th>
                    <th>價格</th>
                    <th>數量</th>
                    <th>小計</th>

                </tr>
                <c:forEach var="cartItemImgDTO" items="${cartItemImgDTOList}">
                    <tr class="rowMother">
                        <td><img src="${cartItemImgDTO.itemImg}" style"height: 100px"></td>
                        <td><a href="#">${cartItemImgDTO.itemName}</a>
                        </td>
                        <input type="hidden" class="cartPrice" value="${cartItemImgDTO.itemPrice}">
                        <td>${cartItemImgDTO.itemPrice}</td>

                        <td>
                            <div class="form-outline">
                                <input type="number" name="quantity" value="${cartItemImgDTO.quantity}"
                                    id="cartQuantity" min=" 0 " max="${cartItemImgDTO.itemQty}"
                                    class="quantity form-control" onblur="submitUpdateForm()">

                                <input type="hidden" name="itemNo" value="${cartItemImgDTO.itemNo}" class="itemNo">
                                <input type="hidden" name="itemQty" id="itemQty" class="itemQty"
                                    value="${cartItemImgDTO.itemQty}">剩餘數量${cartItemImgDTO.itemQty}個

                            </div>
                        </td>
                        <td class="rowTotal" data-value=""></td>
                        <td>
                            <button id="deleteBtn" class="deleteBtn" value="1">刪除</button>
                        </td>
                    </tr>
                </c:forEach>

            </table>
            <div id="cartTotal"></div>
            <!-- <form method="post" action="<%=request.getContextPath()%>/view/CartTrace/ConfirmOrder"> -->
            <button id="submitBtn" type="submit" class="btn btn-primary btn-lg">
                結帳
            </button>
            <a href="#" class="canceled">返回商城</a>
        </div>
        <!-- </form> -->


    </div>

    <script>


        var currentQuantityValue;
        var currentItemNoValue;
        var currentItemQtyValue;
        var deleteBtnValue = 1;
        var cartQuantityElements;

        window.addEventListener('load', function () {

            cartQuantityElements = document.querySelectorAll('.quantity');
            var cartPriceElements = document.querySelectorAll('.cartPrice');
            var rowTotal = document.querySelectorAll('.rowTotal');
            var itemNoElements = document.querySelectorAll('.itemNo');
            var itemQtyElements = document.querySelectorAll('.itemQty');
            var deleteBtnElements = document.querySelectorAll('.deleteBtn');
            var rowMotherElements = document.querySelectorAll('.rowMother');
            var resultDiv = document.getElementById('cartTotal');


            let total = 0;
            let rowTotalVariable = 0;
            var quantity = 0;
            var price = 0;
            // 創建一個物件來存儲每個 input 的先前值
            let previousValues = {};


            function resetTotal() {
                total = 0;
                for (var i = 0; i < cartQuantityElements.length; i++) {


                    price = parseInt(cartPriceElements[i].value);
                    var quantity = parseInt(cartQuantityElements[i].value);
                    total += price * quantity;
                    // console.log(total);

                    rowTotalVariable = price * quantity
                    rowTotal[i].textContent = rowTotalVariable;
                    rowTotal[i].setAttribute('data-value', rowTotalVariable);
                }
                resultDiv.textContent = '合計：' + total;
            }

            resetTotal();




            for (var i = 0; i < cartQuantityElements.length; i++) {
                (function (index) {
                    var input = cartQuantityElements[index];
                    var itemNoinput = itemNoElements[index];
                    var itemQtyinput = itemQtyElements[index];
                    var deleteBtn = deleteBtnElements[index];
                    var rowMother = rowMotherElements[index];

                    deleteBtn.addEventListener('click', function () {
                        Swal.fire({
                            icon: 'question',
                            title: '確認刪除嗎?',
                            showCancelButton: true,
                        }).then((result) => {
                            if (result.isConfirmed) {
                                deletefunction();
                            }
                        });
                    });

                    function deletefunction() {
                        currentQuantityValue = input.value;
                        currentItemNoValue = itemNoinput.value;
                        deleteBtnValue = 0;

                        console.log('deleteBtnValue' + deleteBtnValue);
                        rowMother.parentElement.removeChild(rowMother);

                        submitUpdateForm();

                    }

                    input.addEventListener('input', function () {

                        // 獲取 input 的當前值
                        currentQuantityValue = input.value; //有抓到當前的quantity
                        console.log('當前的數量' + currentQuantityValue);

                        // 獲取 input 的先前值（如果有的話）
                        var previousValue = previousValues[input.id];
                        // 獲取 itemNOinput 的當前值
                        currentItemNoValue = itemNoinput.value;//有抓到當前的itemNo
                        console.log('當前的商品編號' + currentItemNoValue);

                        // 獲取 itemQtyinput 的當前值
                        currentItemQtyValue = itemQtyinput.value; //有抓到當前的itemQtyinput
                        console.log('hello' + currentItemQtyValue);


                        // 檢查值是否有更動
                        if (currentQuantityValue !== previousValue) {
                            if (parseInt(currentQuantityValue) < 0 || isNaN(currentQuantityValue) || !currentQuantityValue) {
                                // 顯示警告訊息

                                Swal.fire({
                                    icon: 'error',
                                    title: '請重新輸入數字!',
                                });
                                // 將值設為1
                                currentQuantityValue = '1';
                                input.value = currentQuantityValue;
                            }
                            if (parseInt(currentQuantityValue) > currentItemQtyValue) {
                                // 顯示警告訊息

                                Swal.fire({
                                    icon: 'error',
                                    title: '抱歉，本商品最多可購買' + currentItemQtyValue + '件!',
                                });
                                // 將值設為1
                                currentQuantityValue = '1';
                                input.value = currentQuantityValue;

                            }
                            cartQuantityElements[index].value = currentQuantityValue;

                            // 值已更動，執行你想要的操作
                            console.log('值已更動：', input.id, currentQuantityValue);
                            if (parseInt(currentQuantityValue) === 0) {
                                deletefunction();

                            }

                            // 更新先前值
                            previousValues[input.id] = currentQuantityValue;
                            resetTotal();
                        }

                    });
                })(i);


            }
            document.querySelector('#submitBtn').addEventListener('click', function () {
    
    
                if (cartQuantityElements.length != 0) { //情境是: 進來頁面直接按結帳，這是在判斷購物車有沒有商品
                    submitFormToConfirmOrder();
                }
                else {
                    Swal.fire({
                        icon: 'error',
                        title: '你尚未購買東西喔!',
                    });
                }
    
            });
        })


        function submitUpdateForm() {
            return new Promise((resolve, reject) => {
                fetch('http://localhost:8080/PolyBrain/view/CartTrace/CartServlet', {
                    method: 'POST',
                    headers: {
                        'content-type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        action: 'UpdateItemQuantity',
                        quantity: parseInt(currentQuantityValue),
                        itemNo: parseInt(currentItemNoValue),
                        deleteARow: parseInt(deleteBtnValue)
                    })
                })
                    .then(resp => resp.json())
                    .then(data => {
                        console.log(data.message);
                        resolve();
                    })
                    .catch(error => {
                        reject(error);
                    });
            });
        }

        function submitFormToConfirmOrder() {

            console.log("in2");

            submitUpdateForm()
                .then(() => {
                    fetch('http://localhost:8080/PolyBrain/view/CartTrace/ConfirmOrder', {
                        method: 'POST',
                        headers: {
                            'content-type': 'application/x-www-form-urlencoded' //
                        },
                        body: new URLSearchParams({
                            action: 'getAll',
                            quantity: 1,
                            itemNo: currentItemNoValue
                        })
                    })
                        .then(() => {
                            window.location.href = "http://localhost:8080/PolyBrain/view/CartTrace/CartTrace.jsp";

                        })

                })

            console.log('currentQuantityValue' + currentQuantityValue)
            console.log('currentItemNoValue' + currentItemNoValue)
            console.log('currentItemQtyValue' + currentItemQtyValue)
            console.log('deleteBtnValue' + deleteBtnValue)
        }





    </script>

</body>

</html>