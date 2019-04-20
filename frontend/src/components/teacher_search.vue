<template>
  <div id="search">
    <el-row>
      <el-select v-model="subject" placeholder="请选择家教科目">
        <el-option
          v-for="item in subjectOptions"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        ></el-option>
      </el-select>
      <el-select v-model="district" placeholder="区域">
        <el-option
          v-for="item in districtOptions"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        ></el-option>
      </el-select>
      <el-select v-model="position" placeholder="请选择教师身份">
        <el-option
          v-for="item in positionOptions"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        ></el-option>
      </el-select>
      <el-select v-model="gender" placeholder="性别">
        <el-option v-for="item in genderOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>
      </el-select>
      <el-select v-model="school" placeholder="请选择高校">
        <el-option v-for="item in schoolOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>
      </el-select>
      <el-button @click="searchTeacher">搜索</el-button>
    </el-row>
  </div>
</template>

<script scope>
import { getSubjectList } from "../api/subject";
import { getSchoolList } from "../api/school";
import { getPositionList } from "../api/position";
import { getDistrictList } from "../api/district";
import { getUserList } from "../api/user";
export default {
  name: "head",
  data() {
    return {
      subjectOptions: [],
      districtOptions: [],
      positionOptions: [],
      genderOptions: [
        {
          id: 1,
          name: "男"
        },
        {
          id: 2,
          name: "女"
        }
      ],
      schoolOptions: [],
      subject: "",
      district: "",
      position: "",
      gender: "",
      school: ""
    };
  },
  methods: {
    getSubject() {
      getSubjectList({
        page_size: 100
      }).then(res => {
        this.subjectOptions = res.data.results;
      });
    },
    getSchool() {
      getSchoolList({
        page_size: 100
      }).then(res => {
        this.schoolOptions = res.data.results;
      });
    },
    getPosition() {
      getPositionList({
        page_size: 100
      }).then(res => {
        this.positionOptions = res.data.results;
      });
    },
    getDistric() {
      getDistrictList({
        page_size: 100
      }).then(res => {
        this.districtOptions = res.data.results;
      });
    },
    searchTeacher() {
      let params = {
        type: 1
      };
      if (this.subject) {
        params.teacherprofile__subjects = this.subject;
      }
      if (this.school) {
        params.teacherprofile__school = this.school;
      }
      if (this.position) {
        params.teacherprofile__position = this.position;
      }
      if (this.gender) {
        params.teacherprofile__gender = this.gender;
      }
      if (this.district) {
        params.teacherprofile__district = this.district;
      }
      getUserList(params).then(res => {
        console.log(res);
        this.$parent.tableData = res.data.results;
        this.$parent.total = res.data.count;
        console.log(this);
      });
    }
  },
  mounted() {
    this.getSubject();
    this.getSchool();
    this.getPosition();
    this.getDistric();
  }
};
</script>

