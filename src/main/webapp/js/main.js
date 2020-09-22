var app = new Vue({
    el: ".main",
    data: {},
    methods: {
        outLogin: function () {
            $.ajax({
                url: "/out",
                type: "POST",
                dataType: "JSON",
                success: function (data) {
                    console.log(data.suc);
                    if (data.suc) {
                        alert("退出成功");
                        window.location.href = "login.html";
                    } else {
                        alert("系统异常");
                    }
                },
                error: function () {
                    alert("err");
                }
            });
        }
    }
});

$(".mybtn").bind("click", function () {
    var url = $(this).attr("url");
    $("#myif").attr("src", url);
});