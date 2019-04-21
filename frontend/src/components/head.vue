<template>
  <div id="head">
    <el-menu :default-active="activeIndex" mode="horizontal" @select="handleSelect" router>
      <el-menu-item index="/login" v-if="!username">登录</el-menu-item>
      <el-menu-item index="/register" v-if="!username">注册</el-menu-item>
      <el-submenu index="/userinfo" v-if="username">
        <template slot="title">用户: {{username}}</template>
        <el-menu-item index="/teacherinfo/">详情信息</el-menu-item>
      </el-submenu>
      <el-menu-item index="/">首页</el-menu-item>
      <el-menu-item index="/engage" v-if="type == 2">请家教</el-menu-item>
      <el-menu-item index="/teacher">教员库</el-menu-item>
      <el-menu-item index="/teacher?search=教师">专业教师</el-menu-item>
      <el-menu-item index="/teacher?search=学生">大学生家教</el-menu-item>
      <el-menu-item index="/engageList">学员库</el-menu-item>
      <el-menu-item index="/postList">论坛</el-menu-item>
      <el-menu-item index="/post" v-if="username">发表论坛文章</el-menu-item>
      <el-menu-item index="/upload" v-if="teacher_status != 2 && type == 1">上传认证信息</el-menu-item>
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
      type: "",
      teacher_status: null
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
          this.username = res.data.username;
          this.type = res.data.type;
          if (res.data.teacherprofile_set.length > 0) {
            this.teacher_status = res.data.teacherprofile_set[0].status;
          }
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

