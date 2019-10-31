<template>
  <el-form @submit.native.prevent ref="form" :model="form" label-width="100px" label-position="left">
    <el-form-item label="用户名称">
      <el-input v-model="form.userName"></el-input>
    </el-form-item>
    <el-form-item label="店铺名称">
      <!-- 将父组件的值传递到子组件中-->
      <one-select :options="shops" :value="value"></one-select>
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

    <el-form-item label="订单备注">
      <el-input type="textarea" v-model="form.desc"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="onSubmit">提交</el-button>
      <el-button>取消</el-button>
    </el-form-item>
  </el-form>
</template>

<style>
  html,
  body {
    margin: auto;
  }
  .el-form {
    margin: auto;
    width: 60%;
  }
</style>

<script>
  import oneSelect from '../components/oneSelect.vue';

  export default {
    components: {
      'one-select':oneSelect
    },
    data() {
      return {
        form: {
        },
        param: [],
        shops: [
          {
            label: '甜品',
            value: 1
          },{
            label: '中餐',
            value: 2
          }
        ],
        value: null
      }
    },
    methods: {
      onSubmit() {
        console.log(this.value);
        console.log('submit!');
      },
      beforeDataProcess (rawData) {
        var shopList = [];
        for(var i=0;i<rawData.length;i++){
          shopList[i] = {
              label: rawData[i].shopname,
              value: rawData[i].id
            }
        }
        return shopList;
      }
    },
    created() {
      //接受上一个路由界面传过来的参数
      this.param=this.$route.query.param;
      //console.log(this.param.id);
      //flag表示是增加还是编辑，1表示编辑
      if(this.param.flag==1){
        //处理参数
        var id = this.$qs.stringify({"goodsId":this.param.id});
        //发起一个get请求
        this.$http.get("/order/doFindObjectById",
        {params: {
          goodsId: this.param.id
        },
        })
        .then(res =>{
          //处理返回的结果
          console.log(res.data);
          this.form = res.data.data;
       });
       this.$http.get("/shop/doFindObjects").then(res =>{
         console.log(res.data.data);
         this.shops = this.beforeDataProcess(res.data.data);
         console.log(this.shops);
       })
      }
    },
    updated() {
      console.log(this.value);
    }
  }
</script>
