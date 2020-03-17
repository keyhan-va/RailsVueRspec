import Vue from 'vue'
import App from '../app.vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios';

import VueRouter from 'vue-router';
import HelloWorld from '../pages/Home';
import Register from '../components/Register';
import Login from '../components/Login';

window.axios=axios;
axios.defaults.baseURL = 'http://localhost:3000/api/v1';



Vue.use(ElementUI);
Vue.use(VueRouter);


const router = new VueRouter({
    routes: [
        { path: '/home', name: 'Home', component: HelloWorld },
        { path: '/Register', name: 'Register', component: Register },
        { path: '/Login', name: 'Login', component: Login }
    ],
       mode: 'history'
});


document.addEventListener('DOMContentLoaded', () => {
// document.body.appendChild(document.createElement('app'))
const app = new Vue({
    

    App,
    render: createEl => createEl(App),

    router,

}).$mount('#app')

console.log("")
})