<template>
  <div>
    <div align="right" style="margin-right: 50px;">
      <el-input
          placeholder="请输入内容"
          prefix-icon="el-icon-search"
          v-model="input"
          clearable
          size="small"
          style="width: 300px;">
        </el-input>
        <el-button type="success" size="small" @click="handleAdd" style="font-size: 3px;">添加</el-button>
    </div>
    <el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55">
      </el-table-column>
      <el-table-column prop="goodName" label="姓名" width="120">
      </el-table-column>
      <el-table-column label="状态" show-overflow-tooltip>
        <template slot-scope="scope">
          <p v-if="scope.row.statue">上架</p>
          <p v-else style="color: red;">下架</p>
        </template>
      </el-table-column>
      <el-table-column prop="shopName" label="所属店铺" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="generName" label="所属类别" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="fabulous" label="点赞数" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="number" label="销量" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="des" label="描述" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="price" label="价格" show-overflow-tooltip>
      </el-table-column>
      <el-table-column label="上下架">
        <template slot-scope="scope">
          <el-button type="warning" size="mini" @click="changeStatue(scope.$index, scope.row)">
            <p v-if="scope.row.statue">下架</p>
            <p v-else>上架</p>
          </el-button>
        </template>
      </el-table-column>
      <el-table-column router fixed="right" label="操作" width="180">
        <template slot-scope="scope">
          <!-- slot-scope可以获取到单元格 scope.$index,当前行的索引，从0开始 ;scope.row当前行的数据;-->
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        tableData: [{
          id: 1,
          goodName: '冰淇淋',
          statue: 1,
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.00
        }, {
          id: 2,
          goodName: '冰淇淋',
          statue: 0,
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.00
        }, {
          id: 4,
          goodName: '冰淇淋',
          statue: 0,
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.00
        }, {
          id: 5,
          goodName: '冰淇淋',
          statue: 1,
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.00
        }, {
          id: 6,
          goodName: '冰淇淋',
          statue: 1,
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.5
        }],
        multipleSelection: [],
        ids: [],
        input: '',
      }
    },
    methods: {
      //全选和全不选操作
      toggleSelection(rows) {
        if (rows) {
          rows.forEach(row => {
            this.$refs.multipleTable.toggleRowSelection(row);
          });
        } else {
          this.$refs.multipleTable.clearSelection();
        }
      },
      //获取多选框选中得值并将值传给ids
      handleSelectionChange(val) {
        this.multipleSelection = val;
        var sss = [];
        val.forEach(function(ele) {
          sss.push(ele.id);
        });
        this.ids = sss;
      },
      //改变商品状态
      changeStatue(index, row) {
        if (row.statue === 1) row.statue = 0;
        else row.statue = 1;
        //发起异步请求，将数据库里面的状态改变

      },
      //跳转到编辑商品页面或者新增商品页面
      handleEdit(index, row) {
        var param = {
          "id": row.id,
          "flag": 1
        };
        /* 按钮点击加载路由,并将判断参数和id传入到编辑页面 name 传参数,刷新之后id不在*/
        this.$router.push({
          name: 'goodsEdit',
          params: {
            'param': param
          }
        });
      },
      handleDelete(index, row) {

      },
      handleAdd(){
        var param = {
          "flag": 0
        };
        /* 按钮点击加载路由,并将判断参数和id传入到编辑页面 name 传参数,刷新之后id不在*/
        this.$router.push({
          name: 'goodsEdit',
          params: {
            'param': param
          }
        });
      }
    }
  }
</script>
