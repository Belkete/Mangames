<template>
  <div class="header">
    <img src="http://localhost/mangameAPI/img/logo.PNG" />
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/Produits">Articles</router-link> |
      <router-link to="/Panier">Panier</router-link>
    </div>
    <router-link v-if="id == null" to="/Formulaire" class="router">Connexion / Créer compte</router-link>
    <span v-else-if="isAdmin">Bonjour {{nom}} {{prenom}} <button @click="deconnexion">Deconnexion</button></span>
    <span v-else>Bonjour {{nom}} {{prenom}} <button @click="deconnexion">Deconnexion</button></span>
  </div>
</template>

<script>

export default {
  name: 'Header',

  data(){
    return {
      id: sessionStorage.getItem("id"),
      nom: sessionStorage.getItem("nom"),
      prenom: sessionStorage.getItem("prenom"),
      isAdmin: sessionStorage.getItem("isAdmin")
    }
  },
  methods:{
    deconnexion(){
      sessionStorage.clear()
      this.id = null
    }
  },
  mounted(){
    const refresh = setInterval(()=>{
      this.id= sessionStorage.getItem("id")
      if(this.id!=null){
        clearInterval(refresh)
      }
    },1000)
    
  }
}
</script>


<style scoped>
.header {
  position: -webkit-sticky;
  position: sticky;
  left: 0;
  top: 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  height: 80px;
  z-index: 999;
  background-color: #fff;
  box-shadow: 0 0 25px #0000001a;
}
.router{
  background-color: #41b882;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}

button{
  background-color: #41b882;
}

img{
  width: 100px;
}
</style>