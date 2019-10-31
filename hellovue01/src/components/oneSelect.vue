<template>
  <el-select v-model="value" clearable placeholder="请选择">
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
    }
    /* updated() {
      console.log(this.value);
    } */
  }
</script>
