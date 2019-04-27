<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>预约的教师</span>
      </div>
      <el-table :data="data" style="width: 100%" max-height="250">
        <el-table-column fixed prop="teacher_name" label="教师"></el-table-column>
        <el-table-column prop="engage.name" label="姓名"></el-table-column>
        <el-table-column prop="get_status_display" label="状态"></el-table-column>
        <el-table-column fixed="right" label="操作" width="120">
          <template slot-scope="scope">
            <el-button @click="changeStatus(scope.row)" type="text" size="small">取消预约</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import { choiceteacherList, choiceteacherPatch } from "../api/choiceTeacher";

export default {
  name: "studentinfo",
  data() {
    return {
      data: null
    };
  },
  methods: {
    changeStatus(row) {
      this.$confirm("是否取消当前教师预约", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        let data = {
          status: 2
        };
        choiceteacherPatch(row.id, data).then(res => {
          console.log(res);
          choiceteacherList({ student: this.$cookies.get("user_id") }).then(
            res => {
              this.data = res.data.results;
              this.$message({
                type: "warning",
                message: "已取消当前教师预约"
              });
            }
          );
        });
      });
    }
  },
  beforeCreate() {
    choiceteacherList({ student: this.$cookies.get("user_id") }).then(res => {
      this.data = res.data.results;
    });
  }
};
</script>

