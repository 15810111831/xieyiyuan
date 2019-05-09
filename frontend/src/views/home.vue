<template>
  <div id="home">
    <el-carousel :interval="4000" type="card" height="200px">
      <el-carousel-item v-for="item in images" :key="item">
        <img :src="item" alt>
      </el-carousel-item>
    </el-carousel>

    <el-row class="row" type="flex" justify="center">
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>官方提示</span>
          </div>
          <!-- <div>
            <div class="el-icon-warning">
              <router-link to="/toteacher">做家教</router-link>
            </div>
          </div>
          <br>
          <div class="el-icon-warning">
            <router-link to="/tostudent">请家教</router-link>
          </div>-->
          <el-table :data="adminArticles" style="width: 100%">
            <el-table-column prop="title" label="标题"></el-table-column>
            <el-table-column fixed="right" label="操作" width="100">
              <template slot-scope="scope">
                <el-button @click="watchArticle(scope.row)" type="text" size="small">查看</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>

    <el-row type="flex" justify="space-around" class="row">
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>高校分类</span>
            <router-link style="float: right; padding: 3px 0" to="/teacher">更多</router-link>
          </div>
          <div v-for="o in schools" :key="o.id" class="text item">{{o.name}}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>科目分类</span>
            <router-link style="float: right; padding: 3px 0" to="/teacher">更多</router-link>
          </div>
          <div v-for="o in subjects" :key="o.id" class="text item">{{o.name }}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>区域分类</span>
            <router-link style="float: right; padding: 3px 0" to="/teacher">更多</router-link>
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
            <router-link style="float: right; padding: 3px 0" to="/teacher">更多</router-link>
          </div>
          <el-table :data="teachers" style="width: 100%">
            <el-table-column label="头像" width="100">
              <template slot-scope="scope">
                <img
                  style="width: 50px;height:50px;"
                  :src="scope.row.teacherprofile_set[0].head_img"
                >
              </template>
            </el-table-column>
            <el-table-column label="教师评级" width="250">
              <template slot-scope="scope">
                <el-rate
                  v-model="scope.row.teacherprofile_set[0].rate"
                  show-text
                  disabled
                  :texts="['一星教师', '二星教师', '中级教师', '高级教师', '金牌教师']"
                ></el-rate>
              </template>
            </el-table-column>
            <el-table-column prop="teacher_name" label="姓名"></el-table-column>
            <el-table-column prop="teacher_gender" label="性别"></el-table-column>
            <el-table-column prop="teacher_subject_name" label="职教学科"></el-table-column>
            <el-table-column prop="teacher_position_name" label="目前身份"></el-table-column>
            <el-table-column prop="create_datetime_str" label="认证日期"></el-table-column>
            <el-table-column fixed="right" label="操作" width="100">
              <template slot-scope="scope">
                <el-button
                  @click="watchTeacher(scope.$index, scope.row)"
                  type="text"
                  size="small"
                >查看</el-button>
                <el-button
                  @click="choice(scope.$index, scope.row)"
                  type="text"
                  size="small"
                  v-if="type == 2"
                >预约</el-button>
              </template>
            </el-table-column>
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
            <router-link style="float: right; padding: 3px 0" to="/teacher">更多</router-link>
          </div>
          <el-table :data="student_teachers" style="width: 100%">
            <el-table-column label="头像" width="100">
              <template slot-scope="scope">
                <img
                  style="width: 50px;height:50px;"
                  :src="scope.row.teacherprofile_set[0].head_img"
                >
              </template>
            </el-table-column>
            <el-table-column label="教师评级" width="250">
              <template slot-scope="scope">
                <el-rate
                  v-model="scope.row.teacherprofile_set[0].rate"
                  show-text
                  disabled
                  :texts="['一星教师', '二星教师', '中级教师', '高级教师', '金牌教师']"
                ></el-rate>
              </template>
            </el-table-column>
            <el-table-column prop="teacher_name" label="姓名"></el-table-column>
            <el-table-column prop="teacher_gender" label="性别"></el-table-column>
            <el-table-column prop="teacher_specialty" label="专业"></el-table-column>
            <el-table-column prop="teacher_school" label="高校"></el-table-column>
            <el-table-column prop="create_datetime_str" label="认证日期"></el-table-column>
            <el-table-column fixed="right" label="操作" width="100">
              <template slot-scope="scope">
                <el-button @click="watchTeacher(scope.row)" type="text" size="small">查看</el-button>
                <el-button
                  @click="choice(scope.$index, scope.row)"
                  type="text"
                  size="small"
                  v-if="type == 2"
                >预约</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>

    <!-- 学员需求 -->
    <el-row type="flex" justify="space-around" class="row">
      <el-col :span="12">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>最新学员需求</span>
            <router-link style="float: right; padding: 3px 0" to="/engageList">更多</router-link>
          </div>
          <el-table :data="engage_data" style="width: 100%">
            <el-table-column prop="subject" label="求教学科"></el-table-column>
            <el-table-column prop="district_des" label="授课区域"></el-table-column>
            <el-table-column prop="teacher_des" label="要求"></el-table-column>
            <el-table-column prop="create_datetime_str" label="时间"></el-table-column>
            <el-table-column fixed="right" label="操作" width="100">
              <template slot-scope="scope">
                <el-button @click="watchEngage(scope.row)" type="text" size="small">查看</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
    <!-- 论坛文章 -->
    <el-row type="flex" justify="space-around" class="row">
      <el-col :span="12">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>论坛文章</span>
            <router-link style="float: right; padding: 3px 0" to="/postList">更多</router-link>
          </div>
          <el-table :data="articles" style="width: 100%">
            <el-table-column prop="title" label="标题"></el-table-column>
            <el-table-column fixed="right" label="操作" width="100">
              <template slot-scope="scope">
                <el-button @click="watchArticle(scope.row)" type="text" size="small">查看</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>

    <!-- 预约表单 -->
    <el-dialog title="预约教师" :visible.sync="showForm" width="50%" v-if="type == 2">
      <el-form
        ref="form"
        :model="form"
        :rules="rules"
        label-width="80px"
        label-position="top"
        :inline="true"
      >
        <el-form-item label="选择发布的相关信息" prop="engage">
          <el-select v-model="form.engage" placeholder="请选择">
            <el-option
              v-for="item in userEngage"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="开始日期" prop="start_date">
          <el-date-picker
            v-model="form.start_date"
            type="date"
            placeholder="选择日期"
            value-format="yyyy-MM-dd"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="结束日期" prop="end_date">
          <el-date-picker
            v-model="form.end_date"
            type="date"
            placeholder="选择日期"
            value-format="yyyy-MM-dd"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="日均价" prop="price">
          <el-input type="number" v-model="form.price"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button @click="choiceTeacher" type="primary">保存</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>
<script>
import { getSchoolList } from "../api/school";
import { getSubjectList } from "../api/subject";
import { getDistrictList } from "../api/district";
import { getUserList } from "../api/user";
import { engageList } from "../api/engage";
import { articleList } from "../api/article";
import { choiceteacherPost } from "../api/choiceTeacher";

export default {
  name: "home",
  data() {
    return {
      images: [
        "./images/QJ6315772934.jpg",
        "./images/QJ6632293985.jpg",
        "./images/QJ6787475237.jpg",
        "./images/QJ6849370044.jpg",
        "./images/QJ6912756960.jpg",
        "./images/QJ8167624593.jpg"
      ],
      schools: [],
      subjects: [],
      districts: [],
      teachers: [],
      student_teachers: [],
      engage_data: [],
      userEngage: [],
      articles: [],
      activeIndex: "",
      type: null,
      showForm: false,
      form: {
        user: null,
        engage: null,
        student: parseInt(this.$cookies.get("user_id")),
        start_date: "",
        end_date: "",
        price: null
      },
      rules: {
        engage: [
          {
            required: true,
            message: "请选择发布的信息",
            type: "number",
            tigger: ["blur", "change"]
          }
        ],
        start_date: [
          {
            required: true,
            message: "请选择开始日期",
            tigger: ["blur", "change"]
          }
        ],
        end_date: [
          {
            required: true,
            message: "请选择结束日期",
            tigger: ["blur", "change"]
          }
        ],
        price: [
          {
            required: true,
            message: "请输入日均价",
            tigger: "blur"
          }
        ]
      }
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
    setArticle() {
      articleList({}).then(res => {
        for (var i = 0; i < res.data.results.length - 2; i++) {
          this.articles.push(res.data.results[i]);
        }
      });
    },
    setAdminArticle() {
      articleList({
        type: 6
      }).then(res => {
        this.adminArticles = res.data.results;
      });
    },
    setUserEngage() {
      engageList({
        user: this.$cookies.get("user_id")
      }).then(res => {
        this.userEngage = res.data.results;
      });
    },
    watchTeacher(index, row) {
      this.$router.push({
        path: "/teacherDetail/:id",
        name: "teacherDetail",
        params: { id: row.id }
      });
    },
    watchArticle(row) {
      this.$router.push({
        path: "/post/:id",
        name: "postDetail",
        params: { id: row.id }
      });
    },
    watchEngage(row) {
      this.$router.push({
        path: "/engage/:id",
        name: "engageDetail",
        params: { id: row.id }
      });
    },
    choice(index, row) {
      this.form.user = row.id;
      this.showForm = true;
    },
    choiceTeacher() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          choiceteacherPost(this.form)
            .then(res => {
              this.$message({
                type: "success",
                message: "已选定该教师,可以在个人信息中查看"
              });
              this.showForm = false;
            })
            .catch(err => {
              this.$store.commit("errHandler", err);
              this.showForm = false;
            });
        }
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
    this.setArticle();
    this.setUserEngage();
    this.setAdminArticle();
    this.type = this.$cookies.get("type");
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

.row {
  margin-bottom: 30px;
}
.item-child {
  margin-right: 35px;
}
</style>