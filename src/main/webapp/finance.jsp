<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>boot</title>
    <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/tab.css" rel="stylesheet">

</head>
<body>
    <div class="my-body">
        <div class="modal fade" id="editMo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" @click="hideMo()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="financeId">财务编号</label>
                            <input name="financeId" type="text" disabled="disabled" class="form-control" id="financeId" placeholder="输入修改的财务ID" v-model="ed.financeId">
                        </div>
                        <div class="form-group">
                            <label for="user">员工账号</label>
                            <input name="user" type="text" disabled="disabled" class="form-control" id="user" placeholder="输入修改的财务状态" v-model="ed.user">
                        </div>
                        <div class="form-group">
                            <label for="voucher">凭证号</label>
                            <input name="voucher" type="text" disabled="disabled" class="form-control" id="voucher" placeholder="输入修改的财务状态" v-model="ed.voucher">
                        </div>
                        <div class="form-group">
                            <label for="payTime">入账时间</label>
                            <input name="payTime" type="text" disabled="disabled" class="form-control" id="payTime" placeholder="输入修改的财务状态" v-model="ed.payTime">
                        </div>
                        <div class="form-group">
                            <label for="infor">财务状态</label>
                            <input name="infor" type="text" class="form-control" id="infor" placeholder="输入修改的财务状态" v-model="ed.infor">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" @click="hideMo()">关闭</button>
                        <button type="button" class="btn btn-primary"  @click="save()">确认</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">财务列表数据</div>

            <div class="panel-body">
                <form class="form-inline">
                    <div class="form-group">
                        <button id="btn" type="button" class="btn btn-success" @click="openMo1()">新增</button>
                         <div class="input-group">
                             <div class="input-group-addon">财务</div>
                             <input type="text" class="form-control" placeholder="请输入员工账号" v-model="sd.fin">
                         </div>
                        <div class="input-group">
                            <div class="input-group-addon">凭证号</div>
                            <input type="text" class="form-control" placeholder="请输入凭证号" v-model="sd.vou">
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" @click="getList(1)">搜索</button>
                </form>
            </div>

            <div class="modal fade" id="editMo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" aria-label="Close" @click="hideMo1()">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel1">添加财务</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="user">员工编号</label>
                                <input name="user" type="text" class="form-control" id="user1" placeholder="员工编号" v-model="ad.user">
                            </div>
                            <div class="form-group">
                                <label for="voucher">凭证号</label>
                                <input name="voucher" type="text" class="form-control" id="voucher1" placeholder="凭证号" v-model="ad.voucher">
                            </div>
                            <div class="form-group">
                                <label for="payTime">入账时间</label>
                                <input name="payTime" type="text" class="form-control" id="payTime1" placeholder="入账时间" v-model="ad.payTime">
                            </div>
                            <div>
                                <label for="infor">财务状态</label>
                                <input name="infor" type="text" class="form-control" id="infor1" placeholder="财务状态" v-model="ad.infor">
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
                <td>编号</td>
                <td>员工ID</td>
                <td>凭证号</td>
                <td>入账时间</td>
                <td>状态(0销账，1可用)</td>
                <td>操作</td>
            </tr>
            <tr v-for="data in dataList">
                <td>{{data.financeId}}</td>
                <td>{{data.user}}</td>
                <td>{{data.voucher}}</td>
                <td>{{data.payTime}}</td>
                <td>{{data.infor}}</td>
                <td>
                    <button type="button" class="btn btn-link btn-xs" @click="edit(data)">处理</button>
                    <button type="button" class="btn btn-link btn-xs" @click="del(data.financeId)">删除</button>
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
                    <a aria-label="Previous" v-on:click="upPage()">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    <li v-for="pi in page.pager">
                        <a v-on:click="getList(pi)">{{pi}}</a>
                    </li>
                    <li>
                        <a aria-label="Next" v-on:click="downPage()">
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
<script src="js/finance.js"></script>
<script src="plugins/layer/layer.js"></script>

</body>
</html>
