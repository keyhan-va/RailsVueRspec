
<template>
  <div id="app">
    <el-menu :default-active="activeIndex2" class="el-menu-demo" mode="horizontal"
      @select="handleSelect"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#ffd04b">
      
      <el-menu-item index="1">{{title}}</el-menu-item>
    
      
      <el-menu-item class="Rightmenu" v-for="(menu,index) in menus" :key='index'> 
        <router-link :to="{ name:menu.route}"><el-button type="text">{{menu.name}}</el-button></router-link>
      </el-menu-item>
    </el-menu>
    <router-view></router-view>
  
  </div>
</template>








<script>
import axios from 'axios'
export default {
  data () {
    return {
      message: 'hello keyhan ',
      activeIndex: '1',
      activeIndex2: '1',


      title: 'My Vue js',
      menus:[
        {name:"Register",route:"Register"},
        {name:"Login",route:"Login"},
        {name:"Home",route:"Home"},
      ]
    };
  },
  
  
  methods: {
    handleSelect(key, keyPath) {
        console.log(key, keyPath);
      },
    
  }
}; 

</script>











<style scoped>

.el-menu .Rightmenu 
{
  float: right;
}


</style>
