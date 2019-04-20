<template>
  <div id="search">
    <el-row>
      <el-select v-model="district" placeholder="区域">
        <el-option
          v-for="item in districtOptions"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        ></el-option>
      </el-select>
      <el-select v-model="gender" placeholder="学员性别">
        <el-option v-for="item in genderOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>
      </el-select>
      <el-select v-model="teach_gender" placeholder="教员性别">
        <el-option
          v-for="item in teachGenderOptions"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        ></el-option>
      </el-select>
      <el-button @click="searchEngage">搜索</el-button>
    </el-row>
  </div>
</template>

<script scope>
import { getDistrictList } from "../api/district";
import { engageList } from "../api/engage";
export default {
  name: "head",
  data() {
    return {
      teachGenderOptions: [
        {
          id: 1,
          name: "男"
        },
        {
          id: 2,
          name: "女"
        }
      ],
      districtOptions: [],
      genderOptions: [
        {
          id: 1,
          name: "男"
        },
        {
          id: 2,
          name: "女"
        }
      ],
      district: "",
      gender: "",
      teach_gender: ""
    };
  },
  methods: {
    getDistric() {
      getDistrictList({
        page_size: 100
      }).then(res => {
        this.districtOptions = res.data.results;
      });
    },
    searchEngage() {
      let params = {
        type: 1
      };
      if (this.subject) {
        params.teacherprofile__subjects = this.subject;
      }
      if (this.school) {
        params.teacherprofile__school = this.school;
      }
      if (this.position) {
        params.teacherprofile__position = this.position;
      }
      if (this.gender) {
        params.teacherprofile__gender = this.gender;
      }
      if (this.district) {
        params.teacherprofile__district = this.district;
      }
      engageList(params).then(res => {
        console.log(res);
        this.$parent.tableData = res.data.results;
        this.$parent.total = res.data.count;
        console.log(this);
      });
    }
  },
  mounted() {
    this.getDistric();
  }
};
</script>

