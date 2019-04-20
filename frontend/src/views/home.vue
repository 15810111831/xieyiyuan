<template>
  <div id="home">
    <el-carousel :interval="4000" type="card" height="200px">
      <el-carousel-item v-for="item in 6" :key="item">
        <h3>{{ item }}</h3>
      </el-carousel-item>
    </el-carousel>

    <el-row type="flex" justify="space-around" class="row">
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>高校分类</span>
            <el-button style="float: right; padding: 3px 0" type="text">更多</el-button>
          </div>
          <div v-for="o in schools" :key="o.id" class="text item">{{o.name}}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>科目分类</span>
            <el-button style="float: right; padding: 3px 0" type="text">更多</el-button>
          </div>
          <div v-for="o in subjects" :key="o.id" class="text item">{{o.name }}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>区域分类</span>
            <el-button style="float: right; padding: 3px 0" type="text">更多</el-button>
          </div>
          <div v-for="o in districts" :key="o.id" class="text item">{{o.name}}</div>
        </el-card>
      </el-col>
    </el-row>
    <!-- 专业教师 -->
    <el-row type="flex" justify="space-around" class="row">
      <el-col :span="12">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>专业教师库</span>
            <el-button style="float: right; padding: 3px 0" type="text">更多</el-button>
          </div>
          <el-table :data="teachers" style="width: 100%" @row-click="rowClick">
            <el-table-column prop="teacher_name" label="姓名"></el-table-column>
            <el-table-column prop="teacher_gender" label="性别"></el-table-column>
            <el-table-column prop="teacher_subject_name" label="职教学科"></el-table-column>
            <el-table-column prop="teacher_position_name" label="目前身份"></el-table-column>
            <el-table-column prop="create_datetime_str" label="认证日期"></el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
    <!-- 大学生教师 -->
    <el-row type="flex" justify="space-around" class="row">
      <el-col :span="12">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>大学生教员库</span>
            <el-button style="float: right; padding: 3px 0" type="text">更多</el-button>
          </div>
          <el-table :data="student_teachers" style="width: 100%">
            <el-table-column prop="teacher_name" label="姓名"></el-table-column>
            <el-table-column prop="teacher_gender" label="性别"></el-table-column>
            <el-table-column prop="teacher_specialty" label="专业"></el-table-column>
            <el-table-column prop="teacher_school" label="高校"></el-table-column>
            <el-table-column prop="create_datetime_str" label="认证日期"></el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>

    <!-- 大学生教师 -->
    <el-row type="flex" justify="space-around" class="row">
      <el-col :span="12">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>最新学员需求</span>
            <el-button style="float: right; padding: 3px 0" type="text">更多</el-button>
          </div>
          <el-table :data="engage_data" style="width: 100%">
            <el-table-column prop="subject" label="求教学科"></el-table-column>
            <el-table-column prop="district_des" label="授课区域"></el-table-column>
            <el-table-column prop="teacher_des" label="要求"></el-table-column>
            <el-table-column prop="create_datetime_str" label="时间"></el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import { getSchoolList } from "../api/school";
import { getSubjectList } from "../api/subject";
import { getDistrictList } from "../api/district";
import { getUserList } from "../api/user";
import { engageList } from "../api/engage";

export default {
  name: "home",
  data() {
    return {
      schools: [],
      subjects: [],
      districts: [],
      teachers: [],
      student_teachers: [],
      engage_data: [],
      activeIndex: ""
    };
  },
  methods: {
    setSchool() {
      getSchoolList({ page_size: 5 })
        .then(res => {
          this.schools = res.data.results;
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    },
    setSubject() {
      getSubjectList({ page_size: 5 })
        .then(res => {
          this.subjects = res.data.results;
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    },
    setDistrict() {
      getDistrictList({ page_size: 5 })
        .then(res => {
          this.districts = res.data.results;
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    },
    setTeacher() {
      getUserList({
        page_size: 15,
        type: 1,
        search: "教师"
      })
        .then(res => {
          console.log(res);
          this.teachers = res.data.results;
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    },
    setStudentTeacher() {
      getUserList({
        page_size: 15,
        type: 1,
        search: "学生"
      })
        .then(res => {
          console.log(res);
          this.student_teachers = res.data.results;
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    },
    setEngage() {
      engageList({}).then(res => {
        this.engage_data = res.data.results;
      });
    },
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    rowClick(row, column) {
      this.$router.push({
        path: "/teacherDetail/:id",
        name: "teacherDetail",
        params: { id: row.id }
      });
    }
  },
  mounted() {
    this.setSchool();
    this.setSubject();
    this.setDistrict();
    this.setTeacher();
    this.setStudentTeacher();
    this.setEngage();
  }
};
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

.row {
  margin-bottom: 30px;
}
.item-child {
  margin-right: 35px;
}
</style>