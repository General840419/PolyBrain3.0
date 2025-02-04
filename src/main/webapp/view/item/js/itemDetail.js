window.addEventListener('DOMContentLoaded', event => {

    // 解析URL中的查詢參數以獲取itemNo
    const queryString = window.location.search;//當前URL中的查詢參數部分（包括 ? 字符以及之後的部分）
    const itemNo = new URLSearchParams(queryString).get('itemNo'); //從url解析查詢參數 並取出產品編號
    getItemDetail(itemNo);
});

//取得主商品的詳細資訊
function getItemDetail(itemNo) {
    const itemDetail = document.getElementById("itemDetail");
    // 發送請求獲取商品數據
    fetch("http://localhost:8080/PolyBrain/selectServlet?value=selectID&itemID=" + itemNo, {
        method: 'GET',
        headers: { 'Content-Type': 'application/json;charset=UTF-8' },
    })
        .then(response => response.json()) // 解析JSON響應
        .then(data => {
            const cardColumn = document.createElement('div');
            cardColumn.className = 'container px-4 px-lg-5 my-5'; // 添加列的CSS類別
            cardColumn.innerHTML = `
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6" >
                        <div id="owl_img" class="owl-carousel owl-theme">
                        </div>
                        <div id="customDots"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="small mb-1">商品編號: ds-${data.itemNo}</div><span>${data.itemClass.itemClassName}</span>
                        <h1 class="display-5 fw-bolder">${data.itemName}</h1>
                        <div class="fs-5 mb-5">
                            <span>$${data.itemPrice}</span>
                            <br>剩餘數量：${data.itemQty}
                                <br>遊戲人數：${data.minPlayer}人到${data.maxPlayer}人
                                </div>
                                <p class="lead">遊戲介紹：${data.itemProdDescription}</p>
                                <div class="d-flex">
                                    <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                                    <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                        <i class="bi-cart-fill me-1"></i>
                                        加入購物車
                                    </button>
                                    <a class="btn btn-outline-dark mt-auto " href="#" style="width: 100px" margin: 30px>收藏</a>
                        </div>
                    </div >
                </div >
                `;
            itemDetail.appendChild(cardColumn);
            var dotImages = []
            // 在 for 循环中获取图片容器
            const owl_img = document.getElementById("owl_img");
            for (let i = 0; i < data.itemImg.length; i++) {
                const img = document.createElement('img');
                img.src = data.itemImg[i].itemImg;
                img.alt = '商品圖片' + [i + 1];
                owl_img.appendChild(img);
                dotImages.push(data.itemImg[i].itemImg);
            }



            console.log(dotImages);

            $(document).ready(function () {
                var owl = $(".owl-carousel");
                owl.owlCarousel({
                    loop: true,
                    autoplay: true,
                    autoplayTimeout: 2500,
                    autoplayHoverPause: true,
                    smartSpeed: 500,
                    margin: 10,
                    margin: 10,
                    nav: true, // 显示左右导航箭头
                    dots: true, // 显示小圆点导航
                    navText: [
                        '上一張', // 设置前导航按钮图片
                        '下一張' // 设置后导航按钮图片
                    ],
                    dotsEach: true,
                    dotsContainer: "#customDots", // 使用外部容器来存放导航点
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 1
                        },
                        1000: {
                            items: 1
                        }
                    }
                });
                // 替换小圆点导航为自定义图片
                for (var i = 0; i < dotImages.length; i++) {
                    $("#customDots button:nth-child(" + (i + 1) + ")").css({
                        "id": "dot" + i,
                        "height": "100px",
                        "width": "100px",
                        "background-image": "url(" + dotImages[i] + ")",
                        "background-size": "cover"
                    });

                }

            });
            randomItem(data.itemClassNo, data.itemNo);//將類別編號以及產品編號傳到產生廣告產品的方法中
        })
        .catch(error => {
            // 處理錯誤
            console.error('獲取數據時出現問題:', error);
        });
}

//取得廣告的商品資訊
function randomItem(itemClassNo, itemNo) {   //將itemNo傳入
    const relatedClass = document.getElementById("relatedClass");

    // 發送請求獲取商品數據
    fetch("http://localhost:8080/PolyBrain/selectServlet?value=selectClass&ItemClass=" + itemClassNo, {
        method: 'GET',
        headers: { 'Content-Type': 'application/json;charset=UTF-8' },
    })
        .then(response => response.json()) // 解析JSON響應
        .then(data => {
            dataRemove = [itemNo]; //將本身產品加入過濾器中
            const newData = data.filter(item => !dataRemove.includes(item.itemNo));

            // 將Data隨機打亂
            shuffleArray(newData);

            console.log(newData)
            for (i = 0; i < newData.length && i < 4; i++) { //取打亂後的前四個商品進行展示

                const cardColumn = document.createElement('div');
                cardColumn.className = 'col mb-5'; // 添加列的CSS類別
                cardColumn.innerHTML = `
            <div class="card">
                <!-- Product image-->
                <div class="image-container">
                <a href="http://localhost:8080/PolyBrain/view/item/itemDetail.html?itemNo=${newData[i].itemNo}">
                <img class="card-img-top" src="${newData[i].itemImg[0].itemImg}" alt="商品圖片" itemState ="${newData[i].itemState}">
                </a>
                </div>
                <!-- Product details-->
                <div class="card-body p-4">
                    <div class="text-center">
                        <!-- Product name-->
                        <h5 class="fw-bolder">${newData[i].itemName}</h5>
                        <!-- Product price-->
                        $${newData[i].itemPrice}
                    </div>
                    <div class="text-center">
                        遊戲人數：${newData[i].minPlayer}人到${newData[i].maxPlayer}人
                    </div>
                </div>
                <!-- Product actions-->
                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="http://localhost:8080/PolyBrain/view/item/itemDetail.html?itemNo=${data[i].itemNo}">查看商品頁面</a></div>
                </div>
`;
                relatedClass.appendChild(cardColumn);
                // 取得插入的 card-img-top 元素
                const cardImgTop = cardColumn.querySelector('.card-img-top');
                // 取得 itemState 属性的值
                const itemState = cardImgTop.getAttribute('itemState');

                // 如果是已售完狀態，插入 Sale 符號
                if (itemState === '2') {
                    cardImgTop.insertAdjacentHTML('beforebegin', '<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem" >已售完</div>');
                }
            }
        })
        .catch(error => {
            // 處理錯誤
            console.error('獲取數據時出現問題:', error);
        });


}

function shuffleArray(array) {
    for (var i = array.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]]; // 交换元素位置
    }
}
