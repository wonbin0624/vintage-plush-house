function buy(goodsId){
    // 还原成根路径
    let url = "/goods?method=buy";

    $.post(url, {goodsId: goodsId}, function(data){
        if (data == "ok"){
            alert("添加购物车成功！");
            setTimeout(function (){
                window.location.reload();
            }, 1000);
        } else if (data == "error"){
            alert("库存不足，添加购物车失败！");
        } else if(data == "login") {
            alert("无法购买，请先登录");
            setTimeout(function (){
                // 还原成相对路径
                window.location = "user_login.jsp";
            }, 1000);
        }
    });
}