import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [{
      path: '/',
      name: 'index',
      component: () => import('./views/index.vue'),
      children: [{
          path: '/',
          name: 'home',
          component: () => import('./views/home.vue'),
          meta: {
            title: '首页',
            requiresAuth: false
          }
        },
        {
          path: '/engage',
          name: 'engage',
          component: () => import('./views/engage.vue'),
          meta: {
            title: '填写请教员信息',
            requiresAuth: true
          }
        }, {
          path: '/teacher',
          name: 'teacher',
          component: () => import("./views/teacher.vue"),
          meta: {
            title: "教员列表",
            requiresAuth: false
          }
        },
        {
          path: '/engagelist',
          name: 'engageList',
          component: () => import("./views/engageList.vue"),
          meta: {
            title: "订单列表",
            requiresAuth: false
          }
        },
        {
          path: "/teacherDetail/:id",
          name: "teacherDetail",
          component: () => import("./views/teacherDetail.vue"),
          meta: {
            title: "教员详情信息",
            requiresAuth: false
          }
        },
        {
          path: "upload",
          name: "upload",
          component: () => import("./views/upload.vue"),
          meta: {
            title: "上传认证信息",
            requiresAuth: false
          }
        },
        {
          path: "post",
          name: "post",
          component: () => import("./views/post.vue"),
          meta: {
            title: "发表论坛信息",
            requiresAuth: false
          }
        }
      ]
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('./views/login.vue'),
      meta: {
        title: '登录'
      }
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('./views/register.vue'),
      meta: {
        title: '注册'
      }
    },
    {
      path: '/registerTeacher',
      name: 'registerTeacher',
      component: () => import('./views/registerTeacher.vue'),
      meta: {
        title: '注册为教师'
      }
    },
    {
      path: '/registerStudent',
      name: 'registerStudent',
      component: () => import('./views/registerStudent.vue'),
      meta: {
        title: '注册为学生'
      }
    },

  ]
})