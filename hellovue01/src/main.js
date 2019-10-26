// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios';
import qs from 'qs'; //用来解决vue中post请求

Vue.prototype.$qs = qs;
Vue.prototype.$axios = axios;
Vue.use(ElementUI);
Vue.config.productionTip = false

/*设置一个固定的请求头*/
Vue.prototype.$http = axios.create({
  baseURL: "http://localhost:80/"
})
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
