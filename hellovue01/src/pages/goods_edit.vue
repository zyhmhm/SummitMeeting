<template>
  <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
    <el-form-item label="商品名称" prop="name" style="width: 30%">
      <el-input v-model="ruleForm.name"></el-input>
    </el-form-item>
    <el-form-item label="所属店铺" prop="shopName">
      <el-select v-model="ruleForm.shopName" placeholder="请选择活动区域">
        <el-option label="区域一" value="shanghai"></el-option>
        <el-option label="区域二" value="beijing"></el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="所属类别" prop="generName">
      <el-select v-model="ruleForm.generName" placeholder="请选择活动区域">
        <el-option label="区域一" value="shanghai"></el-option>
        <el-option label="区域二" value="beijing"></el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="商品价格" prop="price" style="width: 30%">
      <el-input-number v-model="ruleForm.price" :precision="2" min="0"></el-input-number>
    </el-form-item>
     <el-form-item label="选择图片" style="width: 30%;">
       <div>
          <el-pic></el-pic>
       </div>
     </el-form-item>
    <el-form-item label="商品描述" prop="desc" style="width: 30%;">
      <el-input type="textarea" v-model="ruleForm.desc"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
      <el-button @click="resetForm('ruleForm')">重置</el-button>
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
  }
</style>

<script>
  import pic from '../components/pic.vue'
  export default {
    data() {
      return {
        //路由过来时接受参数
        param: [],
        ruleForm: {
          name: '',
          shopName: '',
          generName: '',
          price: null,
          desc: ''
        },
        rules: {
          name: [{
              required: true,
              message: '请输入活动名称',
              trigger: 'blur'
            },
            {
              min: 3,
              max: 5,
              message: '长度在 3 到 5 个字符',
              trigger: 'blur'
            }
          ],
          shopName: [{
            required: true,
            message: '请选择活所属店铺',
            trigger: 'change'
          }],
          generName: [{
            required: true,
            message: '请选择活所属类别',
            trigger: 'change'
          }]
        }
      };
    },
    components:{
      'el-pic': pic
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            alert('submit!');
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
      //新增商品
      doHandleAdd(){

      },
      //编辑商品
      doHandleEdit(){

      }
    },
    created(){
      //接受上一个路由界面传过来的参数
      this.param=this.$route.params.param;
      console.log(this.param);
      if(!this.param.flag){
        this.doHandleAdd();
      }else{
        doHandleEdit(this.param.id);
      }
    }

  }
</script>
