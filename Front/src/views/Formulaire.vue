<template>
    <div class="form"> 
        <form class="connexion" onsubmit="return false;" ref="signIn">
            <h1>Connexion</h1>
            <label><b>Mail</b></label>
            <input type="text" placeholder="Entrer votre mail" name="mail" required><br>
            <label><b>Mot de passe</b></label>
            <input type="password" placeholder="Entrer le mot de passe" name="password" required>
            <input @click="signIn" type="submit"  value='Se connecté' >
        </form>
        <form class="inscription" onsubmit="return false;" ref="signUp">
            <h1>Inscription</h1>
            <label><b>Nom d'utilisateur</b></label>
            <input type="text" placeholder="Entrer le nom d'utilisateur" name="nom" required><br>
            <label><b>Prénom d'utilisateur</b></label>
            <input type="text" placeholder="Entrer le nom d'utilisateur" name="prenom" required><br>
            <label><b>Mail d'utilisateur</b></label>
            <input type="text" placeholder="Entrer le nom d'utilisateur" name="mail" required><br>
            <label><b>Mot de passe</b></label>
            <input type="password" placeholder="Entrer le mot de passe" name="password" required>
            <input @click="signUp" type="submit" value="S'inscrire" >
            
        </form>
    </div>    
</template>

<script>

import axios from "axios"
export default {
  name: 'Formulaire',
  methods:{
    async signIn(){
      const bodyFormData = new FormData(this.$refs.signIn)
      const response = await axios.post("http://localhost/mangameAPI/connexion.php",bodyFormData)
      sessionStorage.setItem('id', response.data[0].Id_Utilisateur)
      sessionStorage.setItem('nom', response.data[0].Nom_Utilisateur)
      sessionStorage.setItem('prenom', response.data[0].Prenom_Utilisateur)
      sessionStorage.setItem('isAdmin', response.data[0].isAdmin)
      if(sessionStorage.getItem("isAdmin")){
        this.$router.push("/Admin") 
      }
      else{
        this.$router.push("/Produits")
      }
                  
    },
    async signUp(){
      const bodyFormData = new FormData(this.$refs.signUp)
      const response = await axios.post("http://localhost/mangameAPI/inscription.php",bodyFormData)
      console.log(response.data)
      if(response.data){
          alert("Inscription réussie")
      }
      else{
          alert("Echec")
      }
    }
  }
}
</script>

<style scoped>

.form{
  display: flex;
  justify-content:  center;
  align-items: flex-start;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
    
}
.connexion{
    padding: 20px;
}
.inscription{
    padding: 20px;
}
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=password]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #42b983;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #42b983;
}

</style>
