var app = new Vue({
    el: '.login',
    data: {
        username: '',
        passwd: ''
    },
    methods: {
        Login: function () {
            var username = this.username;
            var passwd = this.passwd;
            if (username === "") {
                layer.alert("用户名不能为空");
                return;
            }
            if (passwd === "") {
                layer.alert("密码不能为空");
                return;
            }
            $.ajax({
                url: "/login.ajax",
                type: "POST",
                data: {
                    uname: username,
                    passwd: passwd
                },
                dataType: "JSON",
                success: function (resp) {
                    if (resp.code === 1) {
                        layer.msg('登录成功');
                        window.location.href = "main.jsp";
                    }else {
                        layer.alert("您的用户名或密码错误")
                    }
                },
                error: function () {
                    layer.alert("服务器错误，请联系管理员！");
                }
            });
        }
    }
});