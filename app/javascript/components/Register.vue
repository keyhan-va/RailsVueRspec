<template>
  <div class="login">
    <el-card>
      <h2>Register</h2>
      <el-form class="login-form"  ref="form" @submit.native.prevent="onSubmit">

        <el-form-item prop="email"> <el-input v-model="email" placeholder="E-mail"></el-input></el-form-item>
        <el-form-item prop="password"><el-input v-model="password" placeholder="Password" type="password"></el-input></el-form-item>
        <el-form-item prop="confirm_password"><el-input v-model="confirm_password" placeholder="password again" type="password"></el-input></el-form-item>
        <el-form-item><el-button :loading="loading" class="Register-button" type="primary" native-type="submit" block>Register</el-button></el-form-item>
        <a class="forgot-password" href="https://google.com/">Forgot password ?</a>
      </el-form>
    </el-card>
  </div>
</template>



<script>
import Axios from 'axios';
export default {
  name: "Register",
  props: ['app'],
  data() {
    return {
     loading: false,
     email: '',
     password: '',
     confirm_password: '',
     errors: [],
    }
    
  },

  methods:{
      onSubmit()
      {
          this.errors = []; 
          if (!this.email)
          {
              this.errors.push('Email is requierd.');
          }
          if (!this.password)
          {
              this.errors.push('password is requierd.');
          }
          if (!this.confirm_password)
          {
              this.errors.push('confirm_password is requierd.');
          }
          if (this.password !== this.confirm_password  )
          {
              this.errors.push('passwords do not match.');
          }
          if (!this.errors.length) 
          {
              const data = {
                  email: this.email,
                  password: this.password,
                  confirm_password: this.confirm_password,
              }

              
              axios.post('/sign_up',{user:{email:this.email,password:this.password,password_confirmation:this.confirm_password}})
              .then((Response)=>{
                //   this.app.user = Response.data.email;
                  this.$router.push('/Home');
                  console.log(Response);
              })
              .catch((error)=>{
                console.log(error);
              })
          }
      }
  }
  
};
</script>



















<style scoped>
.login {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 100px;
}

.login-button {
  width: 100%;
  margin-top: 40px;
}
.login-form {
  width: 290px;
  
}
.forgot-password {
  margin-top: 10px;
}
</style>
<style lang="scss">
$teal: rgb(0, 124, 137);
.el-button--primary {
  background: $teal;
  border-color: $teal;

  &:hover,
  &.active,
  &:focus {
    background: lighten($teal, 7);
    border-color: lighten($teal, 7);
  }
}
.login .el-input__inner:hover {
  border-color: $teal;
}
.login .el-input__prefix {
  background: rgb(238, 237, 234);
  left: 0;
  height: calc(100% - 2px);
  left: 1px;
  top: 1px;
  border-radius: 3px;
  .el-input__icon {
    width: 30px;
  }
}
.login .el-input input {
  padding-left: 35px;
}
.login .el-card {
  padding-top: 0;
  padding-bottom: 30px;
}
h2 {
  font-family: "Open Sans";
  letter-spacing: 1px;
  font-family: Roboto, sans-serif;
  padding-bottom: 20px;
}
a {
  color: $teal;
  text-decoration: none;
  &:hover,
  &:active,
  &:focus {
    color: lighten($teal, 7);
  }
}
.login .el-card {
  width: 340px;
  display: flex;
  justify-content: center;
}
</style>


