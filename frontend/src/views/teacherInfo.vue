<template>
  <el-main>
    <div class="formContent">
      <h2>个人信息</h2>
      <el-form
        :model="ruleForm"
        :rules="rules"
        :label-position="labelPosition"
        ref="ruleForm"
        label-width="100px"
      >
        <div class="formTitle">
          <b>请填写基本信息</b>
        </div>
        <el-form-item label="真实姓名" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-radio-group v-model="ruleForm.gender">
            <el-radio-button :label="1">男</el-radio-button>
            <el-radio-button :label="2">女</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="出生日期" prop="birthday">
          <el-date-picker
            value-format="yyyy-MM-dd"
            v-model="ruleForm.birthday"
            type="date"
            placeholder="选择出生日期"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="头像">
          <el-upload
            class="avatar-uploader"
            action="#"
            :auto-upload="false"
            :show-file-list="false"
            :on-change="handleAvatarSuccess"
          >
            <img v-if="imgUrl" :src="imgUrl" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="出生地" prop="from_province">
          <el-input v-model="ruleForm.from_province"></el-input>
        </el-form-item>
        <el-form-item label="目前学历" prop="education">
          <el-select v-model="ruleForm.education" placeholder="请选择">
            <el-option
              v-for="item in educationOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="身份证" prop="id_code">
          <el-input v-model="ruleForm.id_code"></el-input>
        </el-form-item>
        <el-form-item label="专业" prop="specialty">
          <el-input v-model="ruleForm.specialty"></el-input>
        </el-form-item>
        <el-form-item label="目前身份" prop="position">
          <el-select v-model="ruleForm.position" placeholder="请选择">
            <el-option
              v-for="item in positionOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="毕业高校" prop="school">
          <el-select v-model="ruleForm.school" placeholder="请选择">
            <el-option
              v-for="item in schoolOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>

        <div class="formTitle">
          <b>请填写联系方式</b>
        </div>
        <el-form-item label="目前所在省份/城市" prop="province">
          <el-input v-model="ruleForm.province" placeholder="请输入"></el-input>
        </el-form-item>
        <el-form-item label="生活住所" prop="life_area">
          <el-select v-model.number="ruleForm.life_area" placeholder="请选择">
            <el-option
              v-for="item in districtOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="工作住所" prop="work_area">
          <el-select v-model="ruleForm.work_area" placeholder="请选择">
            <el-option
              v-for="item in districtOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="手机号" prop="mobile">
          <el-input v-model="ruleForm.mobile"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="ruleForm.email"></el-input>
        </el-form-item>
        <el-form-item label="通讯地址" prop="address">
          <el-input v-model="ruleForm.address"></el-input>
        </el-form-item>
        <el-form-item label="邮编" prop="postal_code">
          <el-input v-model="ruleForm.postal_code"></el-input>
        </el-form-item>

        <div class="formTitle">
          <b>其他信息</b>
        </div>
        <el-form-item label="可授科目" prop="subjects">
          <el-select v-model="ruleForm.subjects" placeholder="请选择" multiple>
            <el-option
              v-for="item in subjectOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="可授课区域" prop="teach_area">
          <el-select v-model="ruleForm.teach_area" placeholder="请选择" multiple>
            <el-option
              v-for="item in districtOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="可授课方式" prop="way">
          <el-select v-model="ruleForm.way" placeholder="请选择" multiple>
            <el-option
              v-for="item in wayOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="薪水要求" prop="price">
          <el-select v-model="ruleForm.price" placeholder="请选择" multiple>
            <el-option
              v-for="item in priceOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="自我描述" prop="info">
          <el-input v-model="ruleForm.info" type="textarea"></el-input>
        </el-form-item>
        <el-form-item label="详情描述" prop="description">
          <el-input v-model="ruleForm.description" type="textarea"></el-input>
        </el-form-item>
        <el-form-item label="获得证书" prop="cert">
          <el-input v-model="ruleForm.cert" type="textarea"></el-input>
        </el-form-item>
        <el-form-item label="家教简历" prop="resume">
          <el-input v-model="ruleForm.resume" type="textarea"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')">保存</el-button>
        </el-form-item>
      </el-form>
    </div>
  </el-main>
</template>

<script>
import { userDetail } from "../api/user";
import { teacherprofilePatch } from "../api/teacherprofile";
import { getDistrictList } from "../api/district";
import { getPositionList } from "../api/position";
import { getschoolList, getSchoolList } from "../api/school";
import { getSubjectList } from "../api/subject";
import { getWayList } from "../api/way";
import { getPriceList } from "../api/price";
export default {
  name: "teacherinfo",
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
      if (!value) {
        return callback(new Error("请选择性别"));
      } else {
        return callback();
      }
    };
    return {
      labelPosition: "right",
      id: null,
      imgUrl: "",
      formData: null,
      ruleForm: {
        name: "",
        gender: null,
        birthday: "",
        from_province: null,
        education: null,
        id_code: "",
        specialty: "",
        position: null,
        school: null,
        province: "",
        life_area: null,
        work_area: null,
        mobile: "",
        email: "",
        address: "",
        postal_code: "",
        subjects: [],
        way: [],
        price: [],
        teach_area: [],
        info: "",
        description: "",
        resume: ""
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, message: "密码最少要6位", tigger: "blur" }
        ],
        name: [{ required: true, message: "请输入真实姓名", tigger: "blur" }],
        mobile: [{ required: true, validator: checkMobile, tigger: "blur" }],
        email: [
          { required: true, tigger: "blur", message: "请输入邮箱地址" },
          {
            type: "email",
            message: "请输入正确邮箱地址",
            tigger: ["blur", "change"]
          }
        ],
        address: [
          { required: true, message: "请输入通讯地址", tigger: "blur" }
        ],
        postal_code: [
          { required: true, message: "请输入邮编", tigger: "blur" }
        ],
        gender: [{ required: true, validator: checkGender, tigger: "blur" }],
        birthday: [
          { required: true, message: "请选择出生日期", tigger: "change" }
        ],
        from_province: [
          { required: true, message: "请输入出生地", tigger: "blur" }
        ],
        education: [
          {
            required: true,
            message: "请选择目前学历",
            tigger: "change",
            validator: checkSelect
          }
        ],
        id_code: [{ required: true, message: "请输入身份证", tigger: "blur" }],
        specialty: [{ required: true, message: "请输入专业", tigger: "blur" }],
        position: [
          {
            required: true,
            message: "请选择身份",
            tigger: "change",
            validator: checkSelect
          }
        ],
        school: [
          {
            required: true,
            message: "请选择毕业院校",
            tigger: ["change", "blur"],
            validator: checkSelect
          }
        ],
        province: [
          { required: true, message: "请输入目前所在城市/省份", tigger: "blur" }
        ],
        life_area: [
          {
            required: true,
            validator: checkSelect,
            message: "请选择生活所在地",
            tigger: ["blur", "change"]
          }
        ],
        work_area: [
          {
            required: true,
            validator: checkSelect,
            message: "请选择工作所在地",
            tigger: ["blur", "change"]
          }
        ]
      },
      educationOptions: [
        {
          id: 1,
          name: "大专以下"
        },
        {
          id: 2,
          name: "大专在读"
        },
        {
          id: 3,
          name: "大专毕业"
        },
        {
          id: 4,
          name: "本科在读"
        },
        {
          id: 5,
          name: "本科毕业"
        },
        {
          id: 6,
          name: "研究生在读"
        },
        {
          id: 7,
          name: "硕士在读"
        },
        {
          id: 8,
          name: "硕士毕业"
        },
        {
          id: 9,
          name: "博士在读"
        },
        {
          id: 10,
          name: "博士毕业"
        }
      ],
      districtOptions: [],
      positionOptions: [],
      schoolOptions: [],
      subjectOptions: [],
      wayOptions: [],
      priceOptions: []
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
          let that = this;
          teacherprofilePatch(this.id, this.formData)
            .then(res => {
              console.log(res);
              this.$message({
                type: "success",
                message: "保存成功"
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
      getDistrictList().then(res => {
        this.districtOptions = res.data.results;
      });
    },
    getPosition() {
      getPositionList({ page_size: 100 }).then(res => {
        this.positionOptions = res.data.results;
      });
    },
    getSchool() {
      getSchoolList({ page_size: 100 }).then(res => {
        this.schoolOptions = res.data.results;
      });
    },
    handleAvatarSuccess(file, filelist) {
      console.log(file);
      this.ruleForm.head_img = file.raw;
      var reader = new FileReader();
      reader.onload = function() {
        var result = this.result;
        this.imgUrl = result;
        console.log(this.imgUrl);
      };
      reader.readAsDataURL(file.raw);
    }
  },
  mounted() {
    this.getPosition();
    this.getSchool();
    this.getDistrict();
    getSubjectList({ page_size: 100 }).then(res => {
      this.subjectOptions = res.data.results;
    });
    getWayList({ page_size: 100 }).then(res => {
      this.wayOptions = res.data.results;
    });
    getPriceList({ page_size: 100 }).then(res => {
      this.priceOptions = res.data.results;
    });
    userDetail(this.$cookies.get("user_id")).then(res => {
      this.ruleForm = res.data.teacherprofile_set[0];
      delete this.ruleForm["id_code_pic"];
      this.id = res.data.teacherprofile_set[0].id;
      this.imgUrl = res.data.teacherprofile_set[0].head_img;
    });
    this.formData = new FormData();
  }
};
</script>

<style >
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
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>