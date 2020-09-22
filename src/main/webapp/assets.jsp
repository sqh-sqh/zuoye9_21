<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>资产信息</title>
    <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/tab.css" rel="stylesheet">
</head>
<body>
    <div class="my-body">
        <div class="modal fade" id="editMo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" aria-label="Close" @click="hideMo()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">修改资产</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="assetsId">资产编号</label>
                            <input name="assetsId" type="text" disabled="disabled" class="form-control" id="assetsId" placeholder="资产编号" v-model="ed.assetsId">
                        </div>
                        <div class="form-group">
                            <label for="classId">资产类型</label>
                            <input name="classId" type="text" class="form-control" id="classId" placeholder="输入资产类型编号" v-model="ed.classId">
                        </div>
                        <div class="form-group">
                            <label for="financeId">财务编号</label>
                            <input name="financeId" type="text" disabled="disabled" class="form-control" id="financeId" placeholder="财务编号" v-model="ed.financeId">
                        </div>
                        <div class="form-group">
                            <label for="goodId">产品编号</label>
                            <input name="goodId" type="text" class="form-control" id="goodId" placeholder="输入对应的产品编号" v-model="ed.goodId">
                        </div>
                        <div class="form-group">
                            <label for="user">员工账号</label>
                            <input name="user" type="text" disabled="disabled" class="form-control" id=user placeholder="员工账号" v-model="ed.user">
                        </div>
                        <div class="form-group">
                            <label for="mode">状态</label>
                            <input name="mode" type="text" class="form-control" id="mode" placeholder="状态" v-model="ed.mode">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" @click="hideMo()">取消</button>
                        <button type="button" class="btn btn-primary" @click="save()">保存</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">资产列表数据</div>

            <div class="panel-body">
                <form class="form-inline">
                    <div class="form-group">
                        <button id="btn" type="button" class="btn btn-success" @click="openMo1()">新增</button>
                        <div class="input-group">
                            <div class="input-group-addon">资产类型</div>
                            <input type="text" class="form-control" placeholder="资产类型" v-model="sd.goods">
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon">员工编号</div>
                            <input type="text" class="form-control" placeholder="员工编号" v-model="sd.people">
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" @click="getList(1)">搜索</button>
                    <button type="button" class="btn btn-success" @click="selectAll()">
                        {{allSel ? '取消' : '全选'}}
                    </button>
                    <button type="button" class="btn btn-primary" @click="delMore()">删除</button>
                </form>
            </div>

            <div class="modal fade" id="editMo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" aria-label="Close" @click="hideMo1()">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel1">添加资产</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="classId">资产类型</label>
                                <input name="classId" type="text" class="form-control" id="classId1" placeholder="输入资产类型编号" v-model="ad.classId">
                            </div>
                            <div class="form-group">
                                <label for="financeId">财务编号</label>
                                <input name="financeId" type="text" class="form-control" id="financeId1" placeholder="财务编号" v-model="ad.financeId">
                            </div>
                            <div class="form-group">
                                <label for="goodId1">产品名称</label>
                                <input name="goodId" type="text" class="form-control" id="goodId1" placeholder="输入产品编号" v-model="ad.goodId">
                            </div>
                            <div class="form-group">
                                <label for="user">员工账号</label>
                                <input name="user" type="text" class="form-control" id="user1" placeholder="员工账号" v-model="ad.user">
                            </div>
                            <div class="form-group">
                                <label for="mode">状态</label>
                                <input name="mode" type="text" class="form-control" id="mode1" placeholder="状态" v-model="ad.mode">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" @click="hideMo1()">取消</button>
                            <button type="button" class="btn btn-primary" @click="saves()">保存</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <table class="table table-bordered table-hover table-condensed">
            <tr class="active">
                <td>选择</td>
                <td>资产类型</td>
                <td>财务编号</td>
                <td>产品名称</td>
                <td>员工账号</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
            <tr v-for="data in dataList">
                <td>
                    <input type="checkbox" :value="data.assetsId" v-model="ids">
                </td>
                <td>{{data.assetsCall}}</td>
                <td>{{data.financeId}}</td>
                <td>{{data.code}}</td>
                <td>{{data.user}}</td>
                <td>{{data.mode}}</td>
                <td>
                    <button type="button" class="btn btn-link btn-xs" @click="edit(data)">编辑</button>
                    <button type="button" class="btn btn-link btn-xs" @click="del(data.assetsId)">删除</button>
                </td>
            </tr>
        </table>

        <div class="page-inf">
            <i></i> 共
            <span id="totalPage">{{page.max}}</span>页 本页有<span id="totalCount">{{dataList.length}}</span>条数据
        </div>

        <div class="my-nav">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a aria-label="Previous" @click="upPage()">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li v-for="pi in page.pager">
                        <a v-on:click="getList(pi)">{{pi}}</a>
                    </li>
                    <li>
                        <a aria-label="Next" @click="downPage()">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

<script src="plugins/jquery/jquery-3.5.1.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/vue/vue.js"></script>
<script src="js/assets.js"></script>
<script src="plugins/layer/layer.js"></script>

</body>
</html>
