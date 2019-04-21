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
          </template>
        </el-table-column>
      </el-table>
    </el-main>
  </div>
</template>
<script>
import { getUserList } from "../api/user";
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
    }
  }
};
</script>

