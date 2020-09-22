var app = new Vue({
    el: '.my-body',
    data: {
        dataList: [],
        // 搜索数据
        sd : {
            goods: '',
            posi: ''
        },
        // 分页数据
        page : {
            index : 1,
            max: 1,
            pager: [],
            dataCount:""
        },
        // 编辑数据
        ed : {
            id:'',
            posi:'',
            name:'',
            user:'',
            passwd:'',
            status:''
        },
    },
    methods: {
        // 上一页
        upPage: function () {
            if (this.page.index > 1) {
                this.page.index = this.page.index - 1;
                this.getList(this.page.index);
            }
        },
        // 下一页
        downPage: function () {
            if (this.page.index < this.page.max) {
                this.page.index = this.page.index + 1;
                this.getList(this.page.index);
            }
        },
        // 计算分页
        runPage: function (max) {
            this.page.max = max;
            this.page.pager = [];
            for (var i = 1; i <= max; i++) {
                this.page.pager.push(i);
            }
        },
        // 获取列表数据
        getList: function (pageIndex) {
            this.page.index = pageIndex;
            $.ajax({
                url: "/people",
                type: "POST",
                data: {
                    index: pageIndex,
                    user: app.sd.people,
                    posi: app.sd.posi
                },
                dataType: "JSON",
                success: function (resp) {
                    app.dataList = resp.dataList;
                    app.page.dataCount = resp.dataCount;
                    app.runPage(resp.pageCount);
                },
                error: function () {
                    alert("err");
                }
            });
        },
        // 打开
        openMo: function () {
            $('#editMo').modal({
                backdrop: 'static',
                keyboard: false,
            });
        },
        // 关闭
        hideMo: function () {
            this.ed.id = "";
            this.ed.posi='';
            this.ed.name='';
            this.ed.user='';
            this.ed.passwd='';
            this.ed.status='';
            $('#editMo').modal('hide');
        },
        // 编辑
        edit: function(data) {
            this.ed.id = data.id;
            this.ed.posi=data.posi;
            this.ed.name=data.name;
            this.ed.user=data.user;
            this.ed.passwd=data.passwd;
            this.ed.status=data.status;
            this.openMo();
        },
        // 保存数据
        save: function () {
            $.ajax({
                url: "/tab.ajax",
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
                    console.log(resp);
                    if (resp.t){
                        // 成功的时候
                        app.hideMo();
                        app.getList(app.page.index);
                    }
                },
                error: function () {
                    alert("err");
                }
            });
        },
        // 删除数据
        del: function (delId) {
            var type = confirm("确定要删除该数据吗？");
            if (type) {
                $.ajax({
                    url: "/del.ajax",
                    type: "POST",
                    data: {
                        goodsId: delId,
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        console.log(resp);
                        // 成功的时候
                        // app.getList(app.page.index);
                    },
                    error: function () {
                        alert("err");
                    }
                });
            }
        }
    }
});
// 初始化数据
app.getList(app.page.index);
