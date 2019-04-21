<template>
  <div id="post">
    <h2>发表论坛文章</h2>
    <el-form ref="form" :model="form" label-width="80px" :rules="rules">
      <el-form-item label="标题" prop="title">
        <el-input v-model="form.title"></el-input>
      </el-form-item>
      <el-form-item label="文章类别" prop="type">
        <el-select v-model="form.type" placeholder="请选择文章类别">
          <el-option v-for="item in typeOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="内容" prop="content">
        <quill-editor ref="contentEditor" v-model="form.content" :options="options"></quill-editor>
      </el-form-item>
      <el-button type="primary" @click="create(form)">发表文章</el-button>
    </el-form>
  </div>
</template>

<script>
import { quillEditor } from "vue-quill-editor";
import { articleTypeList } from "../api/articletype";
import { articlePost } from "../api/article";
export default {
  name: "post",
  components: {
    quillEditor
  },
  data() {
    return {
      options: {
        placeholder: "请输入内容"
      },
      created: false,
      form: {
        title: null,
        type: null,
        content: null,
        user: null
      },
      rules: {
        title: [{ required: true, message: "请输入文章标题", trigger: "blur" }],
        type: [
          {
            required: true,
            message: "请选择文章类别",
            trigger: ["blur", "change"]
          }
        ],
        content: [
          { required: true, message: "请输入文章内容", trigger: "blur" }
        ]
      },
      typeOptions: []
    };
  },
  methods: {
    fetchArticleType() {
      articleTypeList().then(res => {
        this.typeOptions = res.data.results;
      });
    },
    create(formName) {
      if (this.created) return false;
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.created = true;
          articlePost(this.form)
            .then(res => {
              this.created = false;
              this.$message({
                type: "success",
                message: "发表成功"
              });
              this.$router.push({
                path: "/",
                name: "home"
              });
            })
            .catch(err => {
              this.$store.commit("errHandler", err);
              this.created = false;
            });
        }
      });
    }
  },
  mounted() {
    this.fetchArticleType();
    this.form.user = parseInt(this.$cookies.get("user_id"));
  }
};
</script>
<style scoped>
#post {
  width: 1200px;
  margin: 30px auto;
}
</style>