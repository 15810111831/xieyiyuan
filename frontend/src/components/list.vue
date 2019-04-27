<template>
  <div id="list">
    <el-main>
      <el-pagination
        background
        layout="prev, pager, next"
        :total="total"
        :page-size="20"
        @current-change="handleCurrentChange"
      ></el-pagination>
      <el-table :data="tableData" style="width: 100%" ref="table">
        <el-table-column
          v-for="prop in tableProps"
          :key="prop.value"
          :prop="prop.value"
          :label="prop.label"
        ></el-table-column>
        <el-table-column fixed="right" label="操作" width="100">
          <template slot-scope="scope">
            <el-button @click="toDetail(scope.row)" type="text" size="small">查看</el-button>
            <el-button
              @click="choice(scope.$index, scope.row)"
              type="text"
              size="small"
              v-if="type == 2"
            >预约</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-main>
    <!-- 预约表单 -->
    <el-dialog title="预约教师" :visible.sync="showForm" width="50%" v-if="type == 2">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="top">
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
        <el-form-item>
          <el-button @click="choiceTeacher" type="primary">保存</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>
<script>
import { getUserList } from "../api/user";
import { engageList } from "../api/engage";
import { choiceteacherPost } from "../api/choiceTeacher";
export default {
  name: "list",
  props: {
    total: {
      type: Number,
      default: 0
    },
    tableData: {
      type: Array,
      default: []
    },
    tableProps: {
      type: Array,
      default: []
    },
    route: {
      type: Object,
      detault: {}
    }
  },
  data() {
    return {
      type: null,
      showForm: false,
      form: {
        user: null,
        engage: null,
        student: parseInt(this.$cookies.get("user_id"))
      },
      rules: {
        engage: [
          {
            required: true,
            message: "请选择发布的信息",
            tigger: ["blur", "change"]
          }
        ]
      },
      userEngage: []
    };
  },
  methods: {
    handleCurrentChange(val) {
      getUserList({
        page: val,
        type: 1
      })
        .then(res => {
          console.log(res);
          this.tableData = res.data.results;
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    },
    toDetail(row) {
      this.$router.push({
        path: this.route.path,
        name: this.route.name,
        params: { id: row.id }
      });
    },
    setUserEngage() {
      engageList({
        user: this.$cookies.get("user_id")
      }).then(res => {
        this.userEngage = res.data.results;
      });
    },
    choice(index, row) {
      this.form.user = row.id;
      this.showForm = true;
    },
    choiceTeacher() {
      console.log(this.form);
      choiceteacherPost(this.form)
        .then(res => {
          console.log(res);
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
  },
  mounted() {
    this.type = this.$cookies.get("type");
    this.setUserEngage();
  }
};
</script>

