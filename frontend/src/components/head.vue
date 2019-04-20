<template>
  <div id="head">
    <el-menu :default-active="activeIndex" mode="horizontal" @select="handleSelect" router>
      <el-menu-item index="/login" v-if="!username">登录</el-menu-item>
      <el-menu-item index="/register" v-if="!username">注册</el-menu-item>
      <el-submenu index="userinfo" v-if="username">
        <template slot="title">用户: {{username}}</template>
        <el-menu-item index="/user_detail">详情信息</el-menu-item>
        <el-menu-item index="/logout" @click="logout">退出</el-menu-item>
      </el-submenu>
      <el-menu-item index="/engage">请家教</el-menu-item>
      <el-menu-item index="/teacher">教员库</el-menu-item>
      <el-menu-item index="/teacher?search=教师">专业教师</el-menu-item>
      <el-menu-item index="/teacher?search=学生">大学生家教</el-menu-item>
      <el-menu-item index="/engageList">学员库</el-menu-item>
      <el-menu-item index="/upload">上传认证信息</el-menu-item>
    </el-menu>
  </div>
</template>

<script scope>
import { userInfo } from "../api/user";
export default {
  name: "head",
  data() {
    return {
      activeIndex: "",
      username: "",
      type: ""
    };
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    getUserInfo() {
      let key = this.$cookies.get("Token", "");
      if (key) {
        userInfo(key).then(res => {
          console.log(res.data);
          this.username = res.data.username;
          this.type = res.data.type;
          this.$cookies.set("user_id", res.data.id);
          this.$cookies.set("type", res.data.type);
          this.$cookies.set("username", res.data.username);
        });
      }
    },
    logout() {
      this.$cookies.set("user_id", "");
      this.$cookies.set("type", "");
      this.$cookies.set("username", "");
      this.username = "";
      this.type = "";
      this.$router.push({
        path: "/",
        name: "home"
      });
    }
  },
  mounted() {
    this.getUserInfo();
  }
};
</script>

