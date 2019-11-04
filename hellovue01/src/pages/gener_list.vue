<template>
  <div>
    <el-table :data="tableData" style="width: 100%">
      <el-table-column type="index" :index="indexMethod">
      </el-table-column>
      <el-table-column prop="generName" label="类别名称" align="center">
      </el-table-column>
      <el-table-column prop="createTime" label="添加时间" align="center">
      </el-table-column>
      <el-table-column prop="updateTime" label="修改时间" align="center">
      </el-table-column>
      <el-table-column router fixed="right" label="操作" width="180">
        <template slot-scope="scope">
          <!-- slot-scope可以获取到单元格 scope.$index,当前行的索引，从0开始 ;scope.row当前行的数据;-->
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div style="text-align: center;">
      <el-button-group>
        <el-button type="primary" @click="toFirstPage">首页</el-button>
        <el-button type="primary" icon="el-icon-arrow-left" @click="toLastPage">上一页</el-button>
        <el-button type="primary" @click="toNextPage">下一页<i class="el-icon-arrow-right el-icon--right"></i></el-button>
        <el-button type="primary" @click="toOverPage">尾页</el-button>
        <el-button type="primary" disabled :rowCount="rowCount">总条数{{rowCount}}</el-button>
        <el-button type="primary" disabled :pageCount="pageCount">总页数{{pageCount}}</el-button>
        <el-button type="primary" disabled :pageCurrent="pageCurrent">当前页{{pageCurrent}}</el-button>
      </el-button-group>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        tableData: [{
          generName: '上海市普陀区金沙江路 1518 弄',
          createTime: '2019/4/5 12:21:32',
          updateTime: '2019/5/4 12:31:10'
        }, {
          generName: '上海市普陀区金沙江路 1517 弄',
          createTime: '2019/4/5 12:21:32',
          updateTime: '2019/5/4 12:31:10'
        }, {
          generName: '上海市普陀区金沙江路 1517 弄',
          createTime: '2019/4/5 12:21:32',
          updateTime: '2019/5/4 12:31:10'
        }, {
          generName: '上海市普陀区金沙江路 1517 弄',
          createTime: '2019/4/5 12:21:32',
          updateTime: '2019/5/4 12:31:10'
        }, {
          generName: '上海市普陀区金沙江路 1517 弄',
          createTime: '2019/4/5 12:21:32',
          updateTime: '2019/5/4 12:31:10'
        }],
        rowCount: 0,
        pageCount: 0,
        pageCurrent: 0
      }
    },
    methods: {
      //序号增加
      indexMethod(index) {
        return index + 1;
      },
      //index当前行索引，row当前行数据里面包括id
      //点击删除之后的操作
      handleDelete(index, row) {
        this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          //执行删除操作
          this.$message({
            type: 'success',
            message: '删除成功!',
          });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        });
      },
      //点击编辑之后的操作
      handleEdit(index, row) {
        this.$prompt('请输入新的名称', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          //邮箱格式的正则表达式验证：inputPattern: /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/,
          //inputErrorMessage: '邮箱格式不正确'
        }).then(({
          value
        }) => {
          //处理输入之后的新的名称，也就是执行修改
          this.$message({
            type: 'success',
            message: '你的邮箱是: ' + value
          });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '取消输入'
          });
        });
      },

      //首页
      toFirstPage() {
        alert("首页");
      },
      //上一页
      toLastPage() {
        alert("上一页");
      },
      //下一页
      toNextPage() {
        alert("下一页");
      },
      //尾页
      toOverPage() {
        alert("尾页");
      },
      //封装好得到数据的请求
      getObjectToPage(){

      }
    },
    //在页面加载完之后发起异步请求加载数据
    created(){

    }
  };
</script>
