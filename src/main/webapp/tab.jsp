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
    <div class="panel panel-default">
        <div class="panel-heading">用户列表数据</div>

        <div class="panel-body">
            <form class="form-inline">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">员工</div>
                        <input type="text" class="form-control" placeholder="请输入员工账号" v-model="sd.people">
                    </div>
                    <div class="input-group">
                        <div class="input-group-addon">职位</div>
                        <input type="text" class="form-control" placeholder="请输入员工职位" v-model="sd.posi">
                    </div>
                </div>
                <button type="button" class="btn btn-primary" @click="getList(1)">搜索</button>
            </form>
        </div>

    </div>
    <table class="table table-bordered table-hover table-condensed">
        <tr class="active">
            <td>编号</td>
            <td>职务</td>
            <td>昵称</td>
            <td>账号</td>
            <td>密码</td>
            <td>状态(0禁用，1可用)</td>
            <td>操作</td>
        </tr>
        <tr v-for="data in dataList">
            <td>{{data.id}}</td>
            <td>{{data.posi}}</td>
            <td>{{data.name}}</td>
            <td>{{data.user}}</td>
            <td>{{data.passwd}}</td>
            <td>{{data.status}}</td>
            <td><a href="#" class="btn" data-toggle="modal" data-target="#myModal" @click="edit(data)">修改</a></td>
        </tr>
    </table>

    <div class="page-inf">
        共<span id="totalPage">{{page.max}}</span>页
        有<span id="totalCount">{{page.dataCount}}</span>条数据
        本页是第<span id="index">{{page.index}}</span>页
        有<span id="total">{{dataList.length}}</span>条数据
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
                        <label for="id">
                            <span class="glyphicon" aria-hidden="true"></span> 员工ID
                        </label>
                        <input name="id" type="text" disabled="disabled" class="form-control" id="id" placeholder="输入需要修改的员工ID" v-model="ed.id">
                    </div>
                    <div class="form-group">
                        <label for="posi">
                            <span class="glyphicon" aria-hidden="true"></span> 职务
                        </label>
                        <input name="posi" type="text" class="form-control" id="posi" placeholder="输入需要修改的职务" v-model="ed.posi">
                    </div>
                    <div class="form-group">
                        <label for="name">
                            <span class="glyphicon" aria-hidden="true"></span> 昵称
                        </label>
                        <input name="name" type="text" class="form-control" id="name" placeholder="输入需要修改昵称" v-model="ed.name">
                    </div>
                    <div class="form-group">
                        <label for="user">
                            <span class="glyphicon" aria-hidden="true"></span> 账号
                        </label>
                        <input name="user" type="text" class="form-control" id="user" placeholder="输入修改的账号" v-model="ed.user">
                    </div>
                    <div class="form-group">
                        <label for="passwd">
                            <span class="glyphicon" aria-hidden="true"></span> 密码
                        </label>
                        <input name="passwd" type="text" class="form-control" id="passwd" placeholder="输入需要修改的密码" v-model="ed.passwd">
                    </div>
                    <div class="form-group">
                        <label for="status">
                            <span class="glyphicon" aria-hidden="true"></span> 状态
                        </label>
                        <input name="status" type="text" class="form-control" id="status" placeholder="输入需要修改的状态" v-model="ed.status">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="hideMo()">关闭</button>
                    <button type="button" class="btn btn-primary" @click="save()">确认</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="plugins/jquery/jquery-3.5.1.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/vue/vue.js"></script>
<script src="js/tab.js"></script>
<script src="plugins/layer/layer.js"></script>

</body>
</html>
