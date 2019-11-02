<template>
  <div id="app">
    <el-container style="height: 100vh; border: 1px solid #eee">
      <el-header style="text-align: right; font-size: 20px; height: 120px;">
        <el-dropdown>
          <i class="el-icon-setting" style="margin: 0,auto;"></i>
           <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item>查看</el-dropdown-item>
                    <el-dropdown-item>新增</el-dropdown-item>
                    <el-dropdown-item>退出</el-dropdown-item>
           </el-dropdown-menu>
        </el-dropdown>
        <span>王小虎</span>
      </el-header>
      <el-container>
        <el-aside width="200px" style="background-color: #409EFF;">
          <el-menu router :default-openeds="['1', '3']">
            <el-submenu index="1">
              <template slot="title">
                <i class="el-icon-s-operation"></i>数据管理
              </template>
              <el-menu-item index="/goods/goods_list">商品管理</el-menu-item>
              <el-menu-item index="/gener/gener_list">类别管理</el-menu-item>
              <el-menu-item index="1-3">用户管理</el-menu-item>
              <el-menu-item index="1-4">店铺管理</el-menu-item>
              <el-menu-item index="/order/order_list">订单管理</el-menu-item>
            </el-submenu>
            <el-submenu index="2">
              <template slot="title">
                <i class="el-icon-s-operation"></i>权限管理
              </template>
              <el-menu-item index="2-1">角色管理</el-menu-item>
              <el-menu-item index="2-2">菜单管理</el-menu-item>
              <el-menu-item index="2-3">后台日志管理</el-menu-item>
              <el-menu-item index="2-4">管理员管理</el-menu-item>
              <el-menu-item index="2-5">修改密码</el-menu-item>
            </el-submenu>
          </el-menu>
        </el-aside>
        <el-main>
          <router-view />
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
  export default {
    name: 'App'
  }
</script>

<style>
  html,
  body{
    padding: 0;
    margin: 0;
  }
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
    margin: 0,auto;
  }

  .el-aside {
    background-color:#409EFF;
    color: #333;
  }
  .el-submenu {
    background-color: #409EFF;
  }
</style>

<script>
  export default {
    data() {
      return {};
      }
  };
</script>
