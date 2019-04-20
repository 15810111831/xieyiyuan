import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import auth from '../utils/auth'
import VueCookies from 'vue-cookies'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import VueQuillEditor from 'vue-quill-editor'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'

Vue.config.productionTip = false;
Vue.use(ElementUI);
Vue.use(VueCookies)
Vue.use(VueQuillEditor)

axios.defaults.headers.common['X-CSRFToken'] = VueCookies.get("csrftoken");
Vue.prototype.$axios = axios;

// 路由守卫,判断是否登录
router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title;
  }

  if (to.meta.requiresAuth) {
    if (!auth.authentication()) {
      next({
        path: '/login'
      })
    } else {
      next()
    }
  } else {
    next()
  }

  if (to.name == 'login') {
    if (auth.authentication()) {
      next({
        path: '/'
      })
    } else {
      next()
    }
  }
})

axios.interceptors.response.use(function (response) {
  // 对响应数据做点什么
  return response;
}, function (error) {
  // 对响应错误做点什么
  return Promise.reject(error.response);
});

axios.interceptors.request.use(
  config => {
    if (VueCookies.get("Token")) {
      config.headers['Authorization'] = 'Token ' + VueCookies.get("Token")
    }
    return config
  },
  error => {
    return Promise.reject(error)
  }
)


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')