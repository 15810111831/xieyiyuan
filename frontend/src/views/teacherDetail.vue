<template>
  <div style="position:relative">
    <div id="teacherDetail">
      <el-row>
        <el-col>
          <el-card show="always">
            <div slot="header" class="clearfix">
              <span>教员基本信息</span>
              <el-button style="float: right; padding: 3px 0" type="text">操作按钮</el-button>
            </div>
            <el-row :gutter="20" class="row">
              <el-col :span="6">姓名:</el-col>
              <el-col :span="6">{{detail.teacher_name}}</el-col>
              <el-col :span="6">高校:</el-col>
              <el-col :span="6">{{detail.teacher_school}}</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">来自省份:</el-col>
              <el-col :span="6">{{detail.teacherprofile_set[0].from_province}}</el-col>
              <el-col :span="6">性别:</el-col>
              <el-col :span="6">{{detail.teacher_gender}}</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">出生年月:</el-col>
              <el-col :span="6">{{detail.teacherprofile_set[0].birthday}}</el-col>
              <el-col :span="6">住址:</el-col>
              <el-col :span="6">昌平</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">学历:</el-col>
              <el-col :span="6">{{detail.teach_education}}</el-col>
              <el-col :span="6">认证情况:</el-col>
              <el-col :span="6">审核通过</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">专业:</el-col>
              <el-col :span="6">{{detail.teacher_specialty}}</el-col>
              <el-col :span="6">注册时间:</el-col>
              <el-col :span="6">{{detail.create_datetime_str}}</el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-card>
            <div slot="header" class="clearfix">
              <span>家教信息</span>
              <el-button style="float: right; padding: 3px 0" type="text">操作按钮</el-button>
            </div>
            <el-row :gutter="20" class="row">
              <el-col :span="6">可受教科目</el-col>
              <el-col :span="14">{{detail.teacher_subject_name}}</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">自我描述</el-col>
              <el-col :span="14">{{detail.teacherprofile_set[0].info}}</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">特长展示：</el-col>
              <el-col :span="14">{{detail.teacherprofile_set[0].description}}</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">可授课区域:</el-col>
              <el-col :span="6">{{detail.teach_area_name}}</el-col>
              <el-col :span="6">可辅导方式:</el-col>
              <el-col :span="6">{{detail.teach_way_name}}</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">所获证书：</el-col>
              <el-col :span="14">{{detail.teacherprofile_set[0].cert}}</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">家教简历</el-col>
              <el-col :span="14">{{detail.teacherprofile_set[0].resume}}</el-col>
            </el-row>
            <el-row :gutter="20" class="row">
              <el-col :span="6">薪水要求:</el-col>
              <el-col :span="14">{{detail.teach_price}}</el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </div>
  </div>
</template>
<script>
import { userDetail } from "../api/user";
export default {
  name: "teacherDetail",
  data() {
    return {
      detail: {},
      id: null
    };
  },
  methods: {
    getUserDetail() {
      userDetail(this.id).then(res => {
        this.detail = res.data;
      });
    }
  },
  mounted() {
    this.id = this.$route.params.id;
    this.getUserDetail();
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
</style>