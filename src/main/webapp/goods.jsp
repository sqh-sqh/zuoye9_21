<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>产品信息</title>
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
                        <h4 class="modal-title" id="myModalLabel">修改产品</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="goodId">产品编号</label>
                            <input name="goodId" type="text" disabled="disabled" class="form-control" id="goodId" placeholder="产品名称" v-model="ed.goodId">
                        </div>
                        <div class="form-group">
                            <label for="code">产品名称</label>
                            <input name="code" type="text" class="form-control" id="code" placeholder="产品名称" v-model="ed.code">
                        </div>
                        <div class="form-group">
                            <label for="format">产品规格</label>
                            <input name="format" type="text" class="form-control" id="format" placeholder="产品规格" v-model="ed.format">
                        </div>
                        <div class="form-group">
                            <label for="measure">单位</label>
                            <input name="measure" type="text" class="form-control" id="measure" placeholder="单位" v-model="ed.measure">
                        </div>
                        <div class="form-group">
                            <label for="quantity">数量</label>
                            <input name="quantity" type="text" class="form-control" id=quantity placeholder="数量" v-model="ed.quantity">
                        </div>
                        <div class="form-group">
                            <label for="price">单价</label>
                            <input name="price" type="text" class="form-control" id="price" placeholder="单价" v-model="ed.price">
                        </div>
                        <div class="form-group">
                            <label for="putTime">采购时间</label>
                            <input name="putTime" type="text" disabled="disabled" class="form-control" id="putTime" placeholder="采购时间" v-model="ed.putTime">
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
            <div class="panel-heading">产品列表数据</div>

            <div class="panel-body">
                <form class="form-inline">
                    <div class="form-group">
                        <button id="btn" type="button" class="btn btn-success" @click="openMo1()">新增</button>
                        <div class="input-group">
                            <div class="input-group-addon">产品名</div>
                            <input type="text" class="form-control" placeholder="请输入产品名" v-model="sd.goods">
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon">产品规格</div>
                            <input type="text" class="form-control" placeholder="请输入产品规格" v-model="sd.format">
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
                            <h4 class="modal-title" id="myModalLabel1">添加产品</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="code">产品名称</label>
                                <input name="code" type="text" class="form-control" id="code1" placeholder="产品名称" v-model="ad.code">
                            </div>
                            <div class="form-group">
                                <label for="format">产品规格</label>
                                <input name="format" type="text" class="form-control" id="format1" placeholder="产品规格" v-model="ad.format">
                            </div>
                            <div class="form-group">
                                <label for="measure">单位</label>
                                <input name="measure" type="text" class="form-control" id="measure1" placeholder="单位" v-model="ad.measure">
                            </div>
                            <div class="form-group">
                                <label for="quantity">数量</label>
                                <input name="quantity" type="text" class="form-control" id="quantity1" placeholder="数量" v-model="ad.quantity">
                            </div>
                            <div class="form-group">
                                <label for="price">单价</label>
                                <input name="price" type="text" class="form-control" id="price1" placeholder="单价" v-model="ad.price">
                            </div>
                            <div class="form-group">
                                <label for="putTime">采购时间</label>
                                <input name="putTime" type="text" class="form-control" id="putTime1" placeholder="采购时间" v-model="ad.putTime">
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
                <td>产品编号</td>
                <td>产品名称</td>
                <td>产品规格</td>
                <td>单位</td>
                <td>数量</td>
                <td>单价</td>
                <td>采购时间</td>
                <td>操作</td>
            </tr>
            <tr v-for="data in dataList">
                <td>
                    <input type="checkbox" :value="data.goodId" v-model="ids">
                </td>
                <td>{{data.goodId}}</td>
                <td>{{data.code}}</td>
                <td>{{data.format}}</td>
                <td>{{data.measure}}</td>
                <td>{{data.quantity}}</td>
                <td>{{data.price}}</td>
                <td>{{data.putTime}}</td>
                <td>
                    <button type="button" class="btn btn-link btn-xs" @click="edit(data)">编辑</button>
                    <button type="button" class="btn btn-link btn-xs" @click="del(data.goodId)">删除</button>
                </td>
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
<script src="js/goods.js"></script>
<script src="plugins/layer/layer.js"></script>

</body>
</html>
