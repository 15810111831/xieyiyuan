<template>
  <div id="postDetail">
    <h2>做家教注意事项</h2>
    <el-row type="flex">
      <el-col :span="6" :offset="6">作者: 管理员</el-col>
      <!-- <el-col :span="6">创建时间: {{detail.create_datetime_str}}</el-col> -->
    </el-row>
    <el-card style="margin-top:30px;">
      <div>
        1、教员注册：免费注册，须填写详细的个人资料。经过确认后，您的信息才会在网站上显示。
        2、教员认证：须带1寸相片一张、学生证、身份证、资格证等证书。认证后发给教员家教认证码。
        3、安排学员：平台根据家教情况，电话告知教员家教具体情况，或者学员通过自行选定确定家教，由教员自行联系家长，确定上课细节，。
        4、上门家教：教员前往学员处教学时，应携带教员认证卡及相关证件，并主动向家长出示。
      </div>
    </el-card>
  </div>
</template>

<style scoped>
#postDetail {
  width: 800px;
  margin: 30px auto;
}
</style>