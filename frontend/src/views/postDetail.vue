<template>
  <div id="postDetail">
    <h2>{{detail.title}}</h2>
    <el-row type="flex">
      <el-col :span="6" :offset="6">作者: {{detail.user.username}}</el-col>
      <el-col :span="6">创建时间: {{detail.create_datetime_str}}</el-col>
    </el-row>
    <el-card style="margin-top:30px;">
      <div v-html="detail.content"></div>
    </el-card>
    <el-collapse v-model="activeNames" style="margin-top:40px;">
      <el-collapse-item title="评论列表" name="1" v-if="comments.length > 0">
        <el-timeline-item
          v-for="comment in comments"
          :key="comment.id"
          :timestamp="comment.create_datetime_str"
        >{{comment.content}}</el-timeline-item>
      </el-collapse-item>
      <el-collapse-item v-if="comments.length == 0" title="评论列表">暂无评论</el-collapse-item>
    </el-collapse>
    <el-button @click="showComment">添加评论</el-button>
    <el-dialog title="添加评论" :visible.sync="commentVisible" width="30%">
      <el-form ref="form" :model="form" label-width="80px" :rules="rules">
        <el-form-item label="评论内容">
          <el-input type="textarea" v-model="form.content"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="create">发表</el-button>
          <el-button @click="commentVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { quillEditor } from "vue-quill-editor";
import { articleTypeList } from "../api/articletype";
import { articleDetail } from "../api/article";
import { commentList, commentPost } from "../api/comment";

export default {
  name: "postDetail",
  components: {
    quillEditor
  },
  data() {
    return {
      created: false,
      detail: {},
      form: {
        content: null,
        user: null,
        article: null
      },
      rules: {
        content: [
          { required: true, message: "请输入评论内容", trigger: "blur" }
        ]
      },
      typeOptions: [],
      comments: [],
      activeNames: "",
      commentVisible: false
    };
  },
  methods: {
    fetchArticleType() {
      articleTypeList().then(res => {
        this.typeOptions = res.data.results;
      });
    },
    create() {
      if (this.created) return false;
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.created = true;
          commentPost(this.form)
            .then(res => {
              this.created = false;
              console.log(res);
              this.$message({
                type: "success",
                message: "发表成功, 审核通过将会显示"
              });
              this.commentVisible = false;
            })
            .catch(err => {
              this.$store.commit("errHandler", err);
              this.created = false;
            });
        }
      });
    },
    showComment() {
      if (!this.$cookies.get("user_id")) {
        this.$message({
          type: "warning",
          message: "请先去登陆再进行评论"
        });
        return false;
      } else {
        this.commentVisible = true;
      }
    }
  },
  mounted() {
    this.fetchArticleType();
    this.form.user = parseInt(this.$cookies.get("user_id"));
    this.form.article = this.$route.params.id;
    articleDetail(this.$route.params.id).then(res => {
      this.detail = res.data;
    });
    commentList({
      // article: this.$route.params.id
    }).then(res => {
      this.comments = res.data.results;
    });
  }
};
</script>
<style scoped>
#postDetail {
  width: 1200px;
  margin: 30px auto;
}
</style>