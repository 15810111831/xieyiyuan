<template>
  <el-main>
    <div class="title">
      <h2>注册</h2>
    </div>
    <div class="content">
      <el-button type="primary" class="child" @click="toRegister(1)">注册成为教师</el-button>
      <el-button type="success" class="child" @click="toRegister(2)">注册成为学生</el-button>
    </div>
    <el-row :gutter="20">
      <el-col :span="8" :offset="8">
        <router-link to="/login">已有账号 去登录!!!</router-link>
      </el-col>
    </el-row>
  </el-main>
</template>

<script>
export default {
  name: "register",
  methods: {
    toRegister(type) {
      if (type == 1) {
        this.$router.push({
          path: "/registerTeacher",
          name: "registerTeacher"
        });
      } else {
        this.$router.push({
          path: "/registerStudent",
          name: "registerStudent"
        });
      }
    }
  }
};
</script>

<style>
.title {
  margin-bottom: 30px;
}
.content {
  margin: auto;
  width: 300px;
  height: 200px;
  border: 1px solid #e34821;
}
.child {
  margin-top: 72px;
}
</style>

