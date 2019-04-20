<template>
  <div>
    <my-head></my-head>
    <router-view></router-view>
  </div>
</template>

<script>
import myHead from "@/components/head";
export default {
  name: "index",
  components: {
    myHead
  }
};
</script>
