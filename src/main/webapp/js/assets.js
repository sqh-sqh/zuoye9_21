var app = new Vue({
    el: '.my-body',
    data: {
        dataList: [],
        // 搜索数据
        sd : {
            goods: '',
            people:''
        },
        // 分页数据
        page : {
            index : 1,
            max: 1,
            pager: []
        },
        // 编辑数据
        ed : {
            assetsId:'',
            classId:'',
            financeId:'',
            code:'',
            user:'',
            mode:''
        },
        //新增数据
        ad : {
            assetsId:'',
            classId:'',
            financeId:'',
            goodId:'',
            user:'',
            mode:''
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
                url: "/assets",
                type: "POST",
                data: {
                    index: pageIndex,
                    assetsCall: app.sd.goods,
                    user: app.sd.people
                },
                dataType: "JSON",
                success: function (resp) {
                    app.dataList = resp.list;
                    app.runPage(resp.max);
                },
                error: function () {
                    layer.alert("err");
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
            this.ed.assetsId = "";
            this.ed.assetsCall='';
            this.ed.financeId='';
            this.ed.code='';
            this.ed.user='';
            this.ed.mode='';
            $('#editMo').modal('hide');
        },
        // 关闭新增
        hideMo1: function () {
            this.ed.assetsId = "";
            this.ed.assetsCall='';
            this.ed.financeId='';
            this.ed.goodId='';
            this.ed.user='';
            this.ed.mode='';
            $('#editMo1').modal('hide');
        },
        // 编辑
        edit: function(data) {
            this.ed.assetsId = data.assetsId;
            this.ed.classId=data.classId;
            this.ed.financeId=data.financeId;
            this.ed.goodId=data.goodId;
            this.ed.user=data.user;
            this.ed.mode=data.mode;
            this.openMo();
        },
        // 保存数据
        save: function () {
            $.ajax({
                url: "/saveAssets.ajax",
                type: "POST",
                data: {
                    assetsId:this.ed.assetsId,
                    classId:this.ed.classId,
                    financeId:this.ed.financeId,
                    goodId:this.ed.goodId,
                    user:this.ed.user,
                    mode:this.ed.mode
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
                    layer.alert("err");
                }
            });
        },
        // 保存新增数据
        saves: function () {
            $.ajax({
                url: "/addAssets.ajax",
                type: "POST",
                data: {
                    assetsId:this.ad.assetsId,
                    classId:this.ad.classId,
                    financeId:this.ad.financeId,
                    goodId:this.ad.goodId,
                    user:this.ad.user,
                    mode:this.ad.mode
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
                    layer.alert("err");
                }
            });
        },
        // 删除数据
        del: function (delIds) {
            layer.confirm('确定要删除数据吗？', {
                btn: ['删除', '取消'] //按钮
            }, function (index) {
                $.ajax({
                    url: "/delAssets.ajax",
                    type: "POST",
                    data: {
                        ids: delIds,
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        console.log(resp.type);
                        if (resp.type) {
                            layer.close(index);
                            // 成功的时候
                            app.getList(app.page.index);
                            app.ids = [];
                        }
                    },
                    error: function () {
                        layer.alert("err");
                    }
                });
            });
        },
        // 全选 || 取消全选
        selectAll: function() {
            if (this.allSel) {
                // 取消
                this.ids = [];
            } else {
                // 全选
                for (var i = 0; i < this.dataList.length; i++) {
                    this.ids.push(this.dataList[i].assetsId);
                }
            }
            this.allSel = !this.allSel;
        },
        // 多选删除
        delMore : function () {
            if (this.ids.length <= 0) {
                layer.alert("请选择您要删除的数据");
                return;
            }
            var idStr = this.ids.join(",");
            this.del(idStr);
        }
    }
});
// 初始化数据
app.getList(app.page.index);
