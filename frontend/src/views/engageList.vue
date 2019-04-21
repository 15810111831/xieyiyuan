<template>
  <div id="teacher">
    <engage-search></engage-search>
    <list :tableData="tableData" :tableProps="tableProps" :total="total" :route="route"></list>
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
      }
    };
  },
  methods: {
    getEngage() {
      engageList({
        page_size: 20,
        type: 1
      })
        .then(res => {
          console.log(res.data.results);
          this.tableData = res.data.results;
          this.total = res.data.count;
        })
        .catch(err => {
          this.$store.commit("errHandler", err);
        });
    }
  },
  mounted() {
    this.getEngage();
  }
};
</script>
<style>
#teacher {
  margin-top: 30px;
}
</style>

