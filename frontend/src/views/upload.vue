<template>
  <div id="upload">
    <h2>请上传身份证正面照片 -- 好进行教师信息审核</h2>
    <el-upload
      class="avatar-uploader"
      :show-file-list="false"
      :auto-upload="false"
      :on-change="handleAvatarSuccess"
      :before-upload="beforeAvatarUpload"
    >
      <!-- <img v-if="imageUrl" :src="imageUrl" class="avatar"> -->
      <i class="el-icon-plus avatar-uploader-icon"></i>
    </el-upload>
    <div id="img"></div>
    <el-button type="primary" @click="upload">上传</el-button>
  </div>
</template>
<script>
import { userUploadIdCard, userDetail } from "../api/user";

export default {
  name: "upload",
  data() {
    return {
      imageUrl: "",
      file: null
    };
  },
  methods: {
    handleAvatarSuccess(file, filelist) {
      this.file = file.raw;
      var reader = new FileReader();
      reader.onload = function() {
        this.imageUrl = this.result;
        console.log();
        document.getElementById("img").innerHTML =
          "<img style='max-width:200px;max-height:200px;' class='up_img' src='" +
          this.result +
          "' />";
      };
      reader.readAsDataURL(file.raw);
    },
    beforeAvatarUpload(file) {
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isLt2M;
    },
    upload() {
      let formData = new FormData();
      formData.append("id_code_pic", this.file);
      userUploadIdCard(this.$cookies.get("user_id"), formData)
        .then(res => {
          console.log(res);
          this.$message({
            type: "success",
            message: "上传成功，请等待审核"
          });
          this.$router.push({
            path: "/",
            name: "home"
          });
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mounted() {
    userDetail(this.$cookies.get("user_id")).then(res => {
      if (res.data.teacherprofile_set[0].id_code_pic) {
        document.getElementById("img").innerHTML =
          "<img style='max-width:200px;max-height:200px;' class='up_img' src='" +
          res.data.teacherprofile_set[0].id_code_pic +
          "' />";
      }
    });
  }
};
</script>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
#upload {
  margin-top: 50px;
}
</style>
