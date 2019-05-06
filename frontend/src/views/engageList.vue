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
        </template>
      </el-table-column>
    </el-table>
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
    }
  },
  mounted() {
    this.type = this.$cookies.get("type");
    this.getEngage();
  }
};
</script>
<style>
#teacher {
  margin-top: 30px;
}
</style>

