var app = new Vue({
    el: '.registered',
    data: {
        ed:{
            id:"",
            posi:'',
            name:'',
            user: '',
            passwd: '',
            status: ''
        }
    },
    methods: {
        save: function () {
            var id = this.ed.id;
            var posi = this.ed.posi;
            var name = this.ed.name;
            var user = this.ed.user;
            var passwd = this.ed.passwd;
            var status = this.ed.status;
            if (posi === "") {
                alert("职位不能为空");
                return;
            }
            if (name === '') {
                alert("昵称不能为空");
                return;
            }
            if (user === "") {
                alert("用户名不能为空");
                return;
            }
            if (passwd === "") {
                alert("密码不能为空");
                return;
            }
            if (status === '') {
                alert("状态不能为空");
                return;
            }
            $.ajax({
                url: "/reg.ajax",
                type: "POST",
                data: {
                    id:this.ed.id,
                    posi:this.ed.posi,
                    name:this.ed.name,
                    user:this.ed.user,
                    passwd:this.ed.passwd,
                    status:this.ed.status
                },
                dataType: "JSON",
                success: function (resp) {
                    console.log(resp.people);
                    if (resp.people) {
                        alert("注册成功");
                        window.location.href = "login.html";
                    }
                },
                error: function () {
                    alert("服务器错误，请联系管理员！");
                }
            });
        }
    }
});