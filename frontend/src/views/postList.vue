<template>
  <div id="postList">
    <el-row>
      <el-select v-model="type" placeholder="请选择文章类别">
        <el-option v-for="item in typeOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>
      </el-select>
      <el-input v-model="title" placeholder="请输入标题" style="width: 300px;"></el-input>
      <el-button @click="search">搜索</el-button>
    </el-row>
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
import { articleTypeList } from "../api/articletype";
import { articleList } from "../api/article";
export default {
  name: "postList",
  data() {
    return {
      tableData: [],
      tableProps: [
        {
          value: "title",
          label: "标题"
        },
        {
          value: "type.name",
          label: "类别"
        },
        {
          value: "user.username",
          label: "作者"
        },
        {
          value: "create_datetime_str",
          label: "创建时间"
        }
      ],
      total: null,
      route: {
        path: "/post/:id",
        name: "postDetail"
      },
      type: "",
      title: "",
      typeOptions: [
        {
          id: 0,
          name: "请选择"
        }
      ]
    };
  },
  methods: {
    search() {
      let params = { page_size: 20 };
      if (this.type && this.type != 0) {
        params["type"] = this.type;
      }
      if (this.title) {
        params["search"] = this.title;
      }
      articleList(params).then(res => {
        console.log("search");
        this.tableData = res.data.results;
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
    articleList().then(res => {
      this.tableData = res.data.results;
      this.total = Math.ceil(res.data.count / 20);
    });
    articleTypeList({ page_size: 100 }).then(res => {
      for (let i = 0; i < res.data.results.length; i++) {
        this.typeOptions.push(res.data.results[i]);
      }
    });
  }
};
</script>
<style>
#teacher {
  margin-top: 30px;
}
</style>

