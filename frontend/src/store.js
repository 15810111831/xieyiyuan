import Vue from 'vue'
import Vuex from 'vuex'
import {
  Message
} from 'element-ui'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {},
  getters: {},
  mutations: {
    errHandler(state, err) {
      var msg = ''
      if (err.status === 401 || err.status === 403) {
        msg = '请先登陆'
      } else if (err.status == 500) {
        msg = '服务器错误，请稍后再试'
      } else {
        for (var i in err.data) {
          msg = err.data[i];
          break;
        }
        if (typeof msg == 'object') {
          msg = msg[0]
        }
      }
      Message({
        type: 'error',
        message: msg
      })
    },
  },
  actions: {

  }
})