<template>
  <div id="teacher">
    <engage-search></engage-search>
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
import engageSearch from "../components/engage_search";
import list from "../components/list";

import { engageList } from "../api/engage";
export default {
  name: "engageList",
  components: {
    engageSearch,
    list
  },
  data() {
    return {
      type: null,
      tableData: [],
      tableProps: [
        {
          value: "code",
          label: "订单号"
        },
        {
          value: "get_gender_display",
          label: "学员性别"
        },
        {
          value: "grade.name",
          label: "学员年级"
        },
        {
          value: "subject",
          label: "求教学科"
        },
        {
          value: "description",
          label: "学员要求"
        },
        {
          value: "district_des",
          label: "授课区域"
        },
        {
          value: "create_datetime_str",
          label: "发布详情"
        }
      ],
      total: null,
      route: {
        path: "/engage/:id",
        name: "engageDetail"
      },
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
      },
      userEngage: []
    };
  },
  methods: {
    getEngage() {
      engageList({
        page_size: 20,
        type: 1
      })
        .then(res => {
          this.tableData = res.data.results;
          this.total = res.data.count;
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
    choice(index, row) {
      this.form.user = row.id;
      this.showForm = true;
    },
    setUserEngage() {
      engageList({
        user: this.$cookies.get("user_id")
      }).then(res => {
        this.userEngage = res.data.results;
      });
    },
    choiceTeacher() {
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
    this.getEngage();
    this.setUserEngage();
  }
};
</script>
<style>
#teacher {
  margin-top: 30px;
}
</style>

