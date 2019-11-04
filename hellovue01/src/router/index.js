import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import orderList from '../pages/order_list.vue'
import orderEdit from '../pages/order_edit.vue'
import generList from '../pages/gener_list.vue'
import goodsList from '../pages/goods_list.vue'
import goodsEdit from '../pages/goods_edit.vue'


//防止多次点击同一个界面报错
const originalPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    //订单展示页面
    {
      path: '/order/order_list',
      name: 'orderList',
      component: orderList
    },
    //订单编辑页面（和增加应该是同一个页面）
    {
      path: '/order/order_edit',
      name: 'orderEdit',
      component: orderEdit
    },
    //商品类别展示页面
    {
      path: '/gener/gener_list',
      name: 'generList',
      component: generList
    },
    //商品展示页面
    {
      path: '/goods/goods_list',
      name: 'goodsList',
      component: goodsList
    },
    //商品编辑页面
    {
      path: '/goods/goods_edit',
      name: 'goodsEdit',
      component: goodsEdit
    }
  ]
})
