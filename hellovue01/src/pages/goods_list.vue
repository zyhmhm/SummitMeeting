<template>
  <div>
    <el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55">
      </el-table-column>
      <el-table-column prop="goodName" label="姓名" width="120">
      </el-table-column>
      <el-table-column prop="statu" label="状态" show-overflow-tooltip>
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
    </el-table>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        tableData: [{
          goodName: '冰淇淋',
          statu: '上架',
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.00
        },{
          goodName: '冰淇淋',
          statu: '上架',
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.00
        },{
          goodName: '冰淇淋',
          statu: '上架',
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.00
        },{
          goodName: '冰淇淋',
          statu: '上架',
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.00
        },{
          goodName: '冰淇淋',
          statu: '上架',
          shopName: '冰爽一夏',
          generName: '甜品',
          fabulous: 10,
          number: 53,
          des: '好吃啊',
          price: 3.5
        }],
        multipleSelection: []
      }
    },

    methods: {
      toggleSelection(rows) {
        if (rows) {
          rows.forEach(row => {
            this.$refs.multipleTable.toggleRowSelection(row);
          });
        } else {
          this.$refs.multipleTable.clearSelection();
        }
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      }
    }
  }
</script>
