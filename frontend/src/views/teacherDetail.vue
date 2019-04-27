<template>
  <div style="position:relative">
    <div id="teacherDetail">
      <el-row>
        <el-col>
          <el-card show="always">
            <div slot="header" class="clearfix">
              <span>教员基本信息</span>
              <el-button type="primary" @click="showForm = true">预约该教师</el-button>
            </div>
            <el-table :data="detail" style="width: 100%">
              <el-table-column type="expand">
                <template slot-scope="props">
                  <el-form label-position="left" inline class="demo-table-expand">
                    <el-form-item label="可受教科目">
                      <span>{{ props.row.teacher_subject_name }}</span>
                    </el-form-item>
                    <el-form-item label="自我描述">
                      <span>{{ props.row.teacherprofile_set[0].info }}</span>
                    </el-form-item>
                    <el-form-item label="特长展示">
                      <span>{{ props.row.teacherprofile_set[0].description }}</span>
                    </el-form-item>
                    <el-form-item label="可授课区域">
                      <span>{{ props.row.teach_area_name }}</span>
                    </el-form-item>
                    <el-form-item label="可辅导方式">
                      <span>{{ props.row.teach_way_name }}</span>
                    </el-form-item>
                    <el-form-item label="所获证书">
                      <span>{{ props.row.teacherprofile_set[0].cert }}</span>
                    </el-form-item>
                    <el-form-item label="家教简历">
                      <span>{{ props.row.teacherprofile_set[0].resume }}</span>
                    </el-form-item>
                    <el-form-item label="薪水要求">
                      <span>{{ props.row.teach_price}}</span>
                    </el-form-item>
                  </el-form>
                </template>
              </el-table-column>

              <el-table-column label="头像" width="100">
                <template slot-scope="scope">
                  <img
                    style="width: 50px;height:50px;"
                    :src="scope.row.teacherprofile_set[0].head_img"
                  >
                </template>
              </el-table-column>
              <el-table-column prop="teacherprofile_set[0].from_province" label="来自省份" width="100"></el-table-column>
              <el-table-column prop="teacher_gender" label="性别" width="100"></el-table-column>
              <el-table-column prop="teacherprofile_set[0].birthday" label="出生年月"></el-table-column>
              <el-table-column prop="teacherprofile_set[0].address" label="住址"></el-table-column>
              <el-table-column prop="teach_education" label="学历"></el-table-column>
              <el-table-column prop="teacher_specialty" label="专业"></el-table-column>
              <el-table-column label="认证情况">审核通过</el-table-column>
            </el-table>
          </el-card>
        </el-col>
      </el-row>
    </div>

    <el-collapse style="margin-top:40px;">
      <el-collapse-item title="评论列表" name="1" v-if="comments.length > 0">
        <el-timeline-item
          v-for="comment in comments"
          :key="comment.id"
          :timestamp="comment.create_date"
        >{{comment.comment}}</el-timeline-item>
      </el-collapse-item>
      <el-collapse-item v-if="comments.length == 0" title="评论列表">暂无评论</el-collapse-item>
    </el-collapse>
    <el-button @click="showComment" type="primary">添加评论</el-button>
    <el-dialog title="添加评论" :visible.sync="commentVisible" width="50%">
      <el-form ref="form" :model="form" label-width="80px" :rules="rules">
        <el-form-item label="评论内容" prop="comment">
          <el-input type="textarea" v-model="form.comment"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="create">发表</el-button>
          <el-button @click="commentVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!-- 预约表单 -->
    <el-dialog title="预约教师" :visible.sync="showForm" width="50%" v-if="type == 2">
      <el-form
        ref="engageForm"
        :model="engageForm"
        :rules="engageRules"
        label-width="80px"
        label-position="top"
        :inline="true"
      >
        <el-form-item label="选择发布的相关信息" prop="engage">
          <el-select v-model="engageForm.engage" placeholder="请选择">
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
            v-model="engageForm.start_date"
            type="date"
            placeholder="选择日期"
            value-format="yyyy-MM-dd"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="结束日期" prop="end_date">
          <el-date-picker
            v-model="engageForm.end_date"
            type="date"
            placeholder="选择日期"
            value-format="yyyy-MM-dd"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="日均价" prop="price">
          <el-input type="number" v-model="engageForm.price"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button @click="choiceTeacher" type="primary">保存</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>
<script>
import { userDetail } from "../api/user";
import { choiceteacherPost } from "../api/choiceTeacher";
import { engageList } from "../api/engage";
import { userCommentList, userCommentPost } from "../api/user_comment";
export default {
  name: "teacherDetail",
  data() {
    return {
      detail: [],
      id: null,
      created: false,
      commentVisible: false,
      comments: [],
      form: {
        comment: "",
        user: null,
        creator: parseInt(this.$cookies.get("user_id"))
      },
      rules: {
        comment: [{ required: true, message: "请添加评论", trigger: "blur" }]
      },
      showForm: false,
      type: null,
      userEngage: [],
      engageForm: {
        user: null,
        engage: null,
        student: parseInt(this.$cookies.get("user_id")),
        start_date: "",
        end_date: "",
        price: null
      },
      engageRules: {
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
    getUserDetail() {
      userDetail(this.id).then(res => {
        console.log(res.data);
        this.detail.push(res.data);
      });
    },
    showComment() {
      this.commentVisible = true;
    },
    create() {
      if (this.created) return false;
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.created = true;
          userCommentPost(this.form)
            .then(res => {
              this.created = false;
              this.$message({
                type: "success",
                message: "发表成功, 审核通过将会显示"
              });
              this.commentVisible = false;
            })
            .catch(err => {
              this.$store.commit("errHandler", err);
              this.created = false;
            });
        }
      });
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
    this.form.user = this.id = this.$route.params.id;
    this.engageForm.user = this.id = this.$route.params.id;
    this.getUserDetail();
    this.type = this.$cookies.get("type");
    userCommentList({ user: this.id }).then(res => {
      this.comments = res.data.results;
    });
    engageList({
      user: this.$cookies.get("user_id")
    }).then(res => {
      this.userEngage = res.data.results;
    });
  }
};
</script>
<style scope>
#teacherDetail {
  width: 800px;
  margin: 0 auto;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}
.row {
  border-bottom: 1px solid #000;
  padding: 5px 0;
}

.demo-table-expand {
  font-size: 0;
}
.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}
.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}
</style>