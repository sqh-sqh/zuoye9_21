var app = new Vue({
    el: '.my-body',
    data: {
        dataList: [],
        // 搜索数据
        sd : {
            fin: '',
            vou:''
        },
        // 分页数据
        page : {
            index : 1,
            max: 1,
            pager: []
        },
        // 编辑数据
        ed : {
            financeId:'',
            user:'',
            voucher:'',
            payTime:'',
            infor:''
        },
        //新增数据
        ad : {
            financeId:'',
            user:'',
            voucher:'',
            payTime:'',
            infor:''
        }
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
                url: "/finance",
                type: "POST",
                data: {
                    index: pageIndex,
                    user: app.sd.fin,
                    voucher: app.sd.vou
                },
                dataType: "JSON",
                success: function (resp) {
                    app.dataList = resp.list;
                    app.runPage(resp.max);
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
        //打开新增
        openMo1: function () {
            $('#editMo1').modal({
                backdrop: 'static',
                keyboard: false,
            });
        },
        // 关闭
        hideMo: function () {
            this.ed.financeId = "";
            this.ed.user='';
            this.ed.voucher='';
            this.ed.payTime='';
            this.ed.infor='';
            $('#editMo').modal('hide');
        },
        // 关闭新增
        hideMo1: function () {
            this.ed.financeId = "";
            this.ed.user='';
            this.ed.voucher='';
            this.ed.payTime='';
            this.ed.infor='';
            $('#editMo1').modal('hide');
        },
        // 编辑
        edit: function(data) {
            this.ed.financeId = data.financeId;
            this.ed.user=data.user;
            this.ed.voucher=data.voucher;
            this.ed.payTime=data.payTime;
            this.ed.infor=data.infor;
            this.openMo();
        },
        // 保存数据
        save: function () {
            $.ajax({
                url: "/saveFinance.ajax",
                type: "POST",
                data: {
                    financeId:this.ed.financeId,
                    user:this.ed.user,
                    voucher:this.ed.voucher,
                    payTime:this.ed.payTime,
                    infor:this.ed.infor
                },
                dataType: "JSON",
                success: function (resp) {
                    console.log(resp);
                    if (resp.type){
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
        // 保存新增数据
        saves: function () {
            $.ajax({
                url: "/addFinance.ajax",
                type: "POST",
                data: {
                    financeId:this.ad.financeId,
                    user:this.ad.user,
                    voucher:this.ad.voucher,
                    payTime:this.ad.payTime,
                    infor:this.ad.infor
                },
                dataType: "JSON",
                success: function (resp) {
                    console.log(resp);
                    if (resp.f){
                        // 成功的时候
                        app.hideMo1();
                        app.getList(app.page.index);
                    }
                },
                error: function () {
                    alert("err");
                }
            });
        },
        // 删除数据
        del: function (financeId) {
            var type = confirm("确定要删除该数据吗？");
            if (type) {
                $.ajax({
                    url: "/delFinance.ajax",
                    type: "POST",
                    data: {
                        financeId: financeId,
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        console.log(resp.type);
                        // 成功的时候
                        app.getList(app.page.index);
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
