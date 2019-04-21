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
          value: "teacherprofile_set[0].teach_area",
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
          label: "登记日期"
        }
      ],
      total: null,
      route: {
        path: "/teacherDetail/:id",
        name: "teacherDetail"
      }
    };
  },
  methods: {
    getTeacher() {
      getUserList({
        page_size: 20,
        type: 1
      })
        .then(res => {
          console.log(res);
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
  }
};
</script>
<style>
#teacher {
  margin-top: 30px;
}
</style>

