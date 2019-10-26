<template>
  <el-form @submit.native.prevent ref="form" :model="form" label-width="100px" label-position="left">
    <el-form-item label="用户名称">
      <el-input v-model="form.userName"></el-input>
    </el-form-item>
    <el-form-item label="店铺名称">
      <el-input v-model="form.shopName"></el-input>
    </el-form-item>
    <el-form-item label="支付价格">
      <el-input v-model="form.price"></el-input>
    </el-form-item>
    <el-form-item label="收货人姓名">
      <el-input v-model="form.contactName"></el-input>
    </el-form-item>
    <el-form-item label="收货人电话">
      <el-input v-model="form.contactTell"></el-input>
    </el-form-item>
    <el-form-item label="收货人地址">
      <el-input v-model="form.contactAddr"></el-input>
    </el-form-item>
    <el-form-item label="订单创建时间">
      <el-input v-model="form.createTime"></el-input>
    </el-form-item>
    <el-form-item label="订单支付时间">
      <el-input v-model="form.payTime"></el-input>
    </el-form-item>
    <el-form-item label="支付状态">
      <el-input v-model="form.statu"></el-input>
    </el-form-item>
    <el-form-item label="商品名称">
      <el-input v-model="form.goods"></el-input>
    </el-form-item>
    
    <el-form-item label="活动形式">
      <el-input type="textarea" v-model="form.desc"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="onSubmit">提交</el-button>
      <el-button>取消</el-button>
    </el-form-item>
  </el-form>
</template>


<script>
  export default {
    data() {
      return {
        form: {
        },
        param: []
      }
    },
    methods: {
      onSubmit() {
        console.log('submit!');
      }
    },
    created() {
      this.param=this.$route.query.param;
      //console.log(this.param.id);
      if(this.param.flag==1){
        var id = this.$qs.stringify({"goodsId":this.param.id});
        this.$http.get("/order/doFindObjectById",
        {params: {
          goodsId: this.param.id
        },
        })
        .then(res =>{
          console.log(res.data);
          this.form = res.data.data;
       });
      }
    }
  }
</script>
