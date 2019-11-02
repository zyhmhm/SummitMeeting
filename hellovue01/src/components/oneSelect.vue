<template>
  <el-select v-model="value" clearable placeholder="请选择" @change="change()">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value">
    </el-option>
  </el-select>
</template>

<script>
  export default {
    props: {
      options: Array,
      value: null
    },
    methods:{
      //当值改变的时候触发，和开始用钩子函数update类似
      change(){
        this.$emit("bindChange",this.value);
      }
    }
  }
</script>
