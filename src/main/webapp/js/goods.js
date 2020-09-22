var app = new Vue({
    el: '.my-body',
    data: {
        dataList: [],
        // 搜索数据
        sd : {
            goods: '',
            format:''
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
            goodId:'',
            code:'',
            format:'',
            measure:'',
            quantity:'',
            price:'',
            putTime:''
        },
        //新增数据
        ad : {
            goodId:'',
            code:'',
            format:'',
            measure:'',
            quantity:'',
            price:'',
            putTime:''
        },
        // 多选删除
        ids: [],
        // 全选标志
        allSel: false
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
                url: "/goods",
                type: "POST",
                data: {
                    index: pageIndex,
                    code: app.sd.goods,
                    format: app.sd.format
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
        //打开新增
        openMo1: function () {
            $('#editMo1').modal({
                backdrop: 'static',
                keyboard: false,
            });
        },
        // 关闭
        hideMo: function () {
            this.ed.goodId = "";
            this.ed.code='';
            this.ed.format='';
            this.ed.measure='';
            this.ed.quantity='';
            this.ed.price='';
            this.ed.putTime='';
            $('#editMo').modal('hide');
        },
        // 关闭新增
        hideMo1: function () {
            this.ed.goodId = "";
            this.ed.code='';
            this.ed.format='';
            this.ed.measure='';
            this.ed.quantity='';
            this.ed.price='';
            this.ed.putTime='';
            $('#editMo1').modal('hide');
        },
        // 编辑
        edit: function(data) {
            this.ed.goodId = data.goodId;
            this.ed.code=data.code;
            this.ed.format=data.format;
            this.ed.measure=data.measure;
            this.ed.quantity=data.quantity;
            this.ed.price=data.price;
            this.ed.putTime=data.putTime;
            this.openMo();
        },
        // 保存数据
        save: function () {
            $.ajax({
                url: "/save.ajax",
                type: "POST",
                data: {
                    goodId:this.ed.goodId,
                    code:this.ed.code,
                    format:this.ed.format,
                    measure:this.ed.measure,
                    quantity:this.ed.quantity,
                    price:this.ed.price,
                    putTime:this.ed.putTime
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
                url: "/add.ajax",
                type: "POST",
                data: {
                    goodId:this.ad.goodId,
                    code:this.ad.code,
                    format:this.ad.format,
                    measure:this.ad.measure,
                    quantity:this.ad.quantity,
                    price:this.ad.price,
                    putTime:this.ad.putTime
                },
                dataType: "JSON",
                success: function (resp) {
                    console.log(resp);
                    if (resp.a){
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
        del: function (delIds) {
            var type = confirm("确定要删除该数据吗？");
            if (type) {
                $.ajax({
                    url: "/del.ajax",
                    type: "POST",
                    data: {
                        ids: delIds,
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        console.log(resp.type);
                        if (resp.type){
                            // 成功的时候
                            app.getList(app.page.index);
                            app.ids=[];
                        }
                    },
                    error: function () {
                        alert("err");
                    }
                });
            }
        },
        // 全选 || 取消全选
        selectAll: function() {
            if (this.allSel) {
                // 取消
                this.ids = [];
            } else {
                // 全选
                for (var i = 0; i < this.dataList.length; i++) {
                    this.ids.push(this.dataList[i].goodId);
                }
            }
            this.allSel = !this.allSel;
        },
        // 多选删除
        delMore : function () {
            if (this.ids.length <= 0) {
                alert("请选择您要删除的数据");
                return;
            }
            var idStr = this.ids.join(",");
            this.del(idStr);
        }
    }
});
// 初始化数据
app.getList(app.page.index);
