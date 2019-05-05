<template>
  <div id="postDetail">
    <h2>请家教流程：</h2>
    <el-row type="flex">
      <br>
      <el-col :span="6" :offset="9">作者: 管理员</el-col>
    </el-row>
    <el-card style="margin-top:30px;">
      <div>
        1、学员注册：免费注册，须填写详细的个人资料。经过确认后，您的信息才会在网站上显示。
        2、学员认证：须带1寸相片一张、学生证、身份证等身份证明。认证后发给学员认证码。
        3、可直接拨打平台热线电话010—1234567，客服人员将会根据您的要求挑选合适的教员.
        4、您可以直接登录，进入专业老师信息库、星级教员库、大学生教员库、金牌教员库挑选您满意的教员
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