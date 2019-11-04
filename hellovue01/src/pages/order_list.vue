<template>
  <el-table :data="tableData" stripe style="width: 100%">
    <!-- max height 可以设置最大高度-->
    <el-table-column fixed prop="userName" label="用户名称" width="100">
    </el-table-column>
    <el-table-column prop="shopName" label="店铺名称" width="120">
    </el-table-column>
    <el-table-column prop="price" label="支付价格" width="120">
    </el-table-column>
    <el-table-column prop="contactName" label="收货人姓名" width="120">
    </el-table-column>
    <el-table-column prop="contactTell" label="收货人电话" width="120">
    </el-table-column>
    <el-table-column prop="contactAddr" label="收货人地址" width="180">
    </el-table-column>
    <el-table-column prop="createTime" label="订单创建时间" width="180">
    </el-table-column>
    <el-table-column prop="payTime" label="订单支付时间" width="180">
    </el-table-column>
    <el-table-column prop="statu" label="支付状态">
    </el-table-column>
    <el-table-column prop="goods" label="商品名称">
    </el-table-column>
    <el-table-column router fixed="right" label="操作" width="180">
      <template slot-scope="scope">
        <!-- slot-scope可以获取到单元格 scope.$index,当前行的索引，从0开始 ;scope.row当前行的数据;-->
        <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
        <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>

  </el-table>
</template>

<script>
  export default {
    methods: {
      handleEdit(index, row) {
        console.log(index);
        console.log(row);
        var param = {
          "id": row.id,
          "flag": 1
        };
        /* 按钮点击加载路由 path 传参数刷新之后id还在 query更像get,会拼接而params不会拼接在url*/
        this.$router.push({path: "/order/order_edit", query:{param:param}});
      },
      handleDelete(index, row) {
        var flag = confirm("确认删除吗?");
        if (flag) {
          var id = row.id;
          var param = this.$qs.stringify({"id":id});
          var url = "/order/doDeleteObject";
          this.$http.post(url, param).then(res => {
            console.log(res.data);
            if (res.data.state == 1) {
              alert("删除成功!");
              doGetObject();
            }else{alert("请先选择一个订单");}
          })
        }
      },
      doGetObject() {
        this.$http.get("/order/doFindObjects").then(res => {
          console.log(res);
          console.log(res.data.data);
          this.tableData = res.data.data;
        })
      }
    },
    data() {
      return {
        tableData: []
      }
    },
    /*生命周期钩子函数:
      create：组件实例创建完成，属性已绑定 ，但是dom还未生成，$el属性还不存在
    */
    created() {
      //this.id = this.$route.params.id;
      this.doGetObject();
    }
  }
</script>
