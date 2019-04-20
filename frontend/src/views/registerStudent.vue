<template>
  <el-main>
    <div class="formContent">
      <h2>注册为学员</h2>
      <el-form
        :model="ruleForm"
        :rules="rules"
        :label-position="labelPosition"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="用户名" prop="username">
          <el-input v-model="ruleForm.username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="ruleForm.password"></el-input>
        </el-form-item>
        <el-form-item label="学员姓名" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="手机号" prop="mobile">
          <el-input v-model="ruleForm.mobile"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-radio-group v-model="ruleForm.gender">
            <el-radio-button :label="1">男</el-radio-button>
            <el-radio-button :label="2">女</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="通讯地址" prop="address">
          <el-input v-model="ruleForm.address"></el-input>
        </el-form-item>
        <el-form-item label="邮编" prop="postal_code">
          <el-input v-model="ruleForm.postal_code"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')">立即注册</el-button>
          <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </el-main>
</template>

<script>
import { userPost } from "../api/user";
export default {
  name: "registerStudent",
  data() {
    var checkMobile = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("手机号不能为空"));
      } else {
        var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (!myreg.test(value)) {
          return callback(new Error("请输入正确的手机号"));
        } else {
          return callback();
        }
      }
    };
    var checkGender = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("请选择性别"));
      } else {
        return callback();
      }
    };
    return {
      labelPosition: "right",
      created: false,
      ruleForm: {
        username: "",
        password: "",
        name: "",
        mobile: "",
        address: "",
        postal_code: "",
        gender: null,
        type: 2
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, message: "密码最少要6位", tigger: "blur" }
        ],
        name: [{ required: true, message: "请输入学员姓名", tigger: "blur" }],
        mobile: [{ required: true, validator: checkMobile, tigger: "blur" }],
        address: [
          { required: true, message: "请输入通讯地址", tigger: "blur" }
        ],
        postal_code: [
          { required: true, message: "请输入邮编", tigger: "blur" }
        ],
        gender: [{ required: true, validator: checkGender, tigger: "blur" }]
      }
    };
  },
  methods: {
    submitForm(formName) {
      if (this.created) {
        return false;
      }
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.created = true;
          userPost(this.ruleForm)
            .then(res => {
              console.log(res);
              this.$message({
                type: "success",
                message: "注册成功,3秒后跳转至登录页面"
              });
              setTimeout(() => {
                this.created = false;
                this.$router.push({
                  path: "/login"
                });
              }, 3000);
            })
            .catch(err => {
              this.$store.commit("errHandler", err);
              this.created = false;
            });
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

<style >
.formContent {
  padding: 30px 300px;
}
</style>