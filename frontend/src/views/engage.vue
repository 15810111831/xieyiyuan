<template>
  <el-main>
    <div class="formContent">
      <h2>填写 - 请家教信息</h2>
      <el-form
        :model="ruleForm"
        :rules="rules"
        :label-position="labelPosition"
        ref="ruleForm"
        label-width="100px"
      >
        <div class="formTitle">
          <b>请填写您的联系方式</b>
        </div>
        <el-form-item label="联系人" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="手机号" prop="mobile">
          <el-input v-model="ruleForm.mobile"></el-input>
        </el-form-item>
        <el-form-item label="您所在的位置地区" prop="district">
          <el-select v-model.number="ruleForm.district" placeholder="请选择">
            <el-option
              v-for="item in districtOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="授课地区详细描述" prop="district_des">
          <el-input v-model="ruleForm.district_des"></el-input>
        </el-form-item>

        <div class="formTitle">
          <b>请填写学员的基本信息</b>
        </div>
        <el-form-item label="性别" prop="gender">
          <el-radio-group v-model="ruleForm.gender">
            <el-radio-button :label="1">男</el-radio-button>
            <el-radio-button :label="2">女</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="学员年级" prop="grade">
          <el-select v-model.number="ruleForm.grade" placeholder="请选择">
            <el-option
              v-for="item in gradeOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="求教学科" prop="subject">
          <el-input v-model="ruleForm.subject"></el-input>
        </el-form-item>
        <el-form-item label="可上课时间" prop="class_begin">
          <el-input v-model="ruleForm.class_begin"></el-input>
        </el-form-item>
        <el-form-item label="学员情况描述" prop="description">
          <el-input v-model="ruleForm.description" type="textarea"></el-input>
        </el-form-item>

        <div class="formTitle">
          <b>请填写您对教员的要求</b>
        </div>
        <el-form-item label="性别" prop="teacher_gender">
          <el-radio-group v-model="ruleForm.teacher_gender">
            <el-radio-button :label="1">男</el-radio-button>
            <el-radio-button :label="2">女</el-radio-button>
            <el-radio-button :label="3">均可</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="对教员其他要求" prop="teacher_des">
          <el-input v-model="ruleForm.teacher_des" type="textarea"></el-input>
        </el-form-item>
        <el-form-item label="收费标准" prop="charge">
          <el-input v-model="ruleForm.charge"></el-input>
        </el-form-item>
      </el-form>
    </div>
  </el-main>
</template>

<script>
import { getGradeList } from "../api/grade";
import { getDistrictList } from "../api/district";
import { engagePost } from "../api/engage";
export default {
  name: "engage",
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
    var checkSelect = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("请选择相应信息"));
      } else {
        callback();
      }
    };
    var checkGender = (rule, value, callback) => {
      return callback();
    };
    return {
      labelPosition: "right",
      ruleForm: {
        name: null,
        mobile: null,
        district: null,
        district_des: null,
        gender: null,
        grade: null,
        subject: null,
        class_begin: null,
        description: null,
        teacher_gender: null,
        teacher_des: null,
        charge: null,
        user: null
      },
      rules: {
        name: [{ required: true, message: "请输入学员姓名", trigger: "blur" }],
        mobile: [{ required: true, validator: checkMobile, tigger: "blur" }],
        grade: [{ required: true, message: "请选择学员年级" }],
        subject: [
          { required: true, message: "请输入求教学科", tigger: "blur" }
        ],
        charge: [{ required: true, message: "请输入收费要求", tigger: "blur" }]
      },
      districtOptions: [],
      gradeOptions: []
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
          engagePost(this.ruleForm)
            .then(res => {
              console.log(res);
              this.$message({
                type: "success",
                message: "注册成功,3秒后跳转至登录页面"
              });
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
    },
    getDistrict() {
      getDistrictList()
        .then(res => {
          this.districtOptions = res.data.results;
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    },
    getGrade() {
      getGradeList({ page_size: 30 })
        .then(res => {
          this.gradeOptions = res.data.results;
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    }
  },
  mounted() {
    this.getDistrict();
    this.getGrade();
    this.ruleForm.user = this.$cookies.get("user_id");
  }
};
</script>

<style>
.formContent {
  padding: 30px 300px;
}
.formTitle {
  width: 300px;
  padding-left: 15px;
  background-color: #409eff;
  margin-right: 200px;
  margin-bottom: 20px;
  text-align: left;
}
</style>
