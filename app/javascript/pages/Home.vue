
<template>
  <div id="app">
    <h1> Vue JS Get Data from API By Axios</h1>


    <el-form >
      <el-input class="InpuTitle" type="textarea" autosize placeholder="Input Title" v-model="article.title"></el-input>
      <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 4}" placeholder="Input Body" v-model="article.body"> </el-input>
      <el-button class="Savebtn" type="Submit" @click="addArticle(article.id)">Save</el-button>
    </el-form>


    <div v-for="article in articles" v-bind:key="article.id">
      <el-card class="box-card">
        <h3>{{ article.title }}</h3>
        <p>{{ article.body }}</p>
        <hr>
        <el-button type="danger" icon="el-icon-delete" size="mini"  @click="deletArticle(article.id)" circle></el-button>
        <el-button type="primary" icon="el-icon-edit" size="mini" @click="editArticle(article)" circle></el-button>
      </el-card>
    </div>


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

      menu:[
        {name:"About"},
        {name:"Link2"},
        {name:"Serch"},
      ],

      articles: [],
      article:{
        id: '',
        title: '',
        body: ''
      },
      article_id: '',
      edit: false

    };
  },
  created(){
    this.fetchArticles();
  },

  methods: {
    handleSelect(key, keyPath) {
        console.log(key, keyPath);
      },

    fetchArticles(){
      fetch('http://localhost:3000/api/v1/articles/')
        .then(res => res.json())
        .then(res => {
          this.articles = res.data;
          // console.log(res.data);
        })
    },
    deletArticle(id){
      if(confirm('Are You Sure?')){
        fetch(`http://localhost:3000/api/v1/articles/${id}`,{
          method: 'delete'
        })
        .then(res => res.json())
        .then(data => {
          alert('Article Removed');
          this.fetchArticles();
        })
        .catch(err => console.log(err));
      }
    },
    addArticle(id){
      if (this.edit === false) {
        //Add
        fetch('http://localhost:3000/api/v1/articles/',{
          method: 'post',
          body: JSON.stringify(this.article),
          headers: {
            'content-type': 'application/json'
          }
        })
        .then(res => res.json())
        .then(data => {
          this.article.title ='';
          this.article.body = '';
          alert('Article Added');
          this.fetchArticles();
        })
        .catch(err => console.log(err));
      }
      else{
        //Update1
        fetch(`http://localhost:3000/api/v1/articles/${id}`,{
          method: 'put',
          body: JSON.stringify(this.article),
          headers: {
            'content-type': 'application/json'
          }
        })
        .then(res => res.json())
        .then(data => {
          this.article.title ='';
          this.article.body = '';
          alert('Article Updated');
          this.fetchArticles();
        })
        .catch(err => console.log(err));
      }
    },
    editArticle(article) {
      this.edit = true;
      this.article.id = article.id;
      this.article.article_id = article.id;
      //console.log(article_id);
      this.article.title = article.title;
      this.article.body = article.body;
    }
  }
};
  

</script>




<style scoped>
.el-menu--horizontal>.el-menu-item {
    float: right;
}

  .InpuTitle {
    margin: 20px 0;
  }
  .Savebtn{
    margin: 20px 0px;
  }
  .box-card .text {
    font-size: 14px;
  }

  .box-card .item {
    padding: 18px 0;
    
  }

  .box-card {
    margin-bottom: 2px;
  }

</style>
