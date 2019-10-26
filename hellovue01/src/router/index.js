import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import orderList from '../pages/order_list.vue'
import orderEdit from '../pages/order_edit.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/order/order_list',
      name: 'orderList',
      component: orderList
    },
    {
      path: '/order/order_edit',
      name: 'orderEdit',
      component: orderEdit
    }
  ]
})
