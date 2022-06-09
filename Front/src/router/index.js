import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Formulaire from '../views/Formulaire.vue'
import Produits from '../views/Produits.vue'
import Admin from '../views/Admin.vue'
import Panier from '../views/Panier.vue'



Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/Formulaire',
    name: 'Formulaire',
    component: Formulaire
  },
  {
    path: '/Produits',
    name: 'Produits',
    component: Produits
  },
  {
    path: '/Admin',
    name: 'Admin',
    component: Admin
  },
  {
    path: '/Panier',
    name: 'Panier',
    component: Panier
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
