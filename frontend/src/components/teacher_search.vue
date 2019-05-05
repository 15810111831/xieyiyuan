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
      subjectOptions: [{ id: 0, name: "请选择" }],
      districtOptions: [{ id: 0, name: "请选择" }],
      positionOptions: [{ id: 0, name: "请选择" }],
      schoolOptions: [{ id: 0, name: "请选择" }],
      genderOptions: [
        {
          id: 0,
          name: "请选择"
        },
        {
          id: 1,
          name: "男"
        },
        {
          id: 2,
          name: "女"
        }
      ],
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
        for (let i = 0; i < res.data.results.length; i++) {
          this.subjectOptions.push(res.data.results[i]);
        }
      });
    },
    getSchool() {
      getSchoolList({
        page_size: 100
      }).then(res => {
        for (let i = 0; i < res.data.results.length; i++) {
          this.schoolOptions.push(res.data.results[i]);
        }
      });
    },
    getPosition() {
      getPositionList({
        page_size: 100
      }).then(res => {
        for (let i = 0; i < res.data.results.length; i++) {
          this.positionOptions.push(res.data.results[i]);
        }
      });
    },
    getDistric() {
      getDistrictList({
        page_size: 100
      }).then(res => {
        for (let i = 0; i < res.data.results.length; i++) {
          this.districtOptions.push(res.data.results[i]);
        }
      });
    },
    searchTeacher() {
      let params = {
        type: 1
      };
      if (this.subject && this.subject != 0) {
        params.teacherprofile__subjects = this.subject;
      }
      if (this.school && this.school != 0) {
        params.teacherprofile__school = this.school;
      }
      if (this.position && this.position != 0) {
        params.teacherprofile__position = this.position;
      }
      if (this.gender && this.gender != 0) {
        params.teacherprofile__gender = this.gender;
      }
      if (this.district && this.district != 0) {
        params.teacherprofile__district = this.district;
      }
      getUserList(params).then(res => {
        this.$parent.tableData = res.data.results;
        this.$parent.total = res.data.count;
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

