<template>
  <div id="teacher">
    <teacher-search></teacher-search>
    <teacher-list :tableData="tableData" :tableProps="tableProps" :total="total" :route="route"></teacher-list>
  </div>
</template>
<script>
import teacherSearch from "../components/teacher_search";
import teacherList from "../components/list";

import { getUserList } from "../api/user";

export default {
  name: "teacher",
  components: {
    teacherSearch,
    teacherList
  },
  data() {
    return {
      tableData: [],
      tableProps: [
        {
          value: "teacher_name",
          label: "姓名"
        },
        {
          value: "teacher_position_name",
          label: "目前身份"
        },
        {
          value: "teacher_gender",
          label: "性别"
        },
        {
          value: "teacher_school",
          label: "高校"
        },
        {
          value: "teacher_specialty",
          label: "专业"
        },
        {
          value: "teach_area_name",
          label: "授课区域"
        },
        {
          value: "teacher_subject_name",
          label: "可教授课程"
        },
        {
          value: "teacherprofile_set[0].description",
          label: "自我描述"
        },
        {
          value: "create_datetime_str",
          label: "认证日期"
        }
      ],
      total: null,
      route: {
        path: "/teacherDetail/:id",
        name: "teacherDetail"
      },
      search: ""
    };
  },
  methods: {
    getTeacher() {
      getUserList({
        page_size: 20,
        type: 1,
        search: this.search
      })
        .then(res => {
          this.tableData = res.data.results;
          this.total = Math.ceil(res.data.count / 20);
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    }
  },
  mounted() {
    this.getTeacher();
  },
  watch: {
    $route(to, from, next) {
      this.search = to.query.search;
      console.log("search", this.search);
      this.getTeacher();
    }
  }
};
</script>
<style>
#teacher {
  margin-top: 30px;
}
</style>

