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
      <el-select v-model="teacher_gender" placeholder="教员性别">
        <el-option
          v-for="item in teachGenderOptions"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        ></el-option>
      </el-select>
      <el-input style="width:250px;" v-model="subject" placeholder="请输入请教学科"></el-input>
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
          id: 0,
          name: "请选择"
        },
        {
          id: 1,
          name: "男"
        },
        {
          id: 2,
          name: "女"
        },
        {
          id: 3,
          name: "均可"
        }
      ],
      districtOptions: [{ id: 0, name: "请选择" }],
      genderOptions: [
        {
          id: 0,
          name: "请选择"
        },
        {
          id: 1,
          name: "男"
        },
        {
          id: 2,
          name: "女"
        }
      ],
      district: null,
      gender: null,
      teacher_gender: null,
      subject: ""
    };
  },
  methods: {
    getDistric() {
      getDistrictList({
        page_size: 100
      }).then(res => {
        for (let i = 0; i < res.data.results.length; i++) {
          this.districtOptions.push(res.data.results[i]);
        }
      });
    },
    searchEngage() {
      let params = {
        page_size: 20
      };
      if (this.teacher_gender && this.teacher_gender != 0) {
        params.teacher_gender = this.teacher_gender;
      }
      if (this.gender && this.gender != 0) {
        params.gender = this.gender;
      }
      if (this.district && this.district != 0) {
        params.district = this.district;
      }
      if (this.subject && this.subject != 0) {
        params.search = this.subject;
      }
      engageList(params).then(res => {
        this.$parent.tableData = res.data.results;
        this.$parent.total = Math.ceil(res.data.count / 20);
      });
    }
  },
  mounted() {
    this.getDistric();
  }
};
</script>

