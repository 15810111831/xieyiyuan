<template>
  <el-main>
    <div class="title">
      <h2>登录</h2>
    </div>
    <el-form
      :status-icon="true"
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      class="demo-ruleForm"
    >
      <el-row :gutter="20">
        <el-col :span="8" :offset="7">
          <el-form-item label="用户名" prop="username">
            <el-input v-model="ruleForm.username"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="8" :offset="7">
          <el-form-item label="密码" prop="password">
            <el-input v-model="ruleForm.password" type="password"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="8" :offset="7">
          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')">登录</el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="8" :offset="8">
          <router-link to="/register">没有账号? 去注册</router-link>
        </el-col>
      </el-row>
    </el-form>
  </el-main>
</template>

<script>
export default {
  name: "login",
  data() {
    return {
      ruleForm: {
        username: "",
        password: ""
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入正确密码", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    async login() {
      let data = await this.$axios.post("/rest-auth/api/login/", this.ruleForm);
      if (data && data.data.key) {
        this.$cookies.set("Token", data.data.key);
        this.$router.push({
          path: "/",
          name: "home"
        });
      }
    },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.login();
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
};
</script>

<style>
.title {
  margin-bottom: 30px;
}
</style>

