<template>
  <div class="panier">
    <div class="head">
        <span>Nom Article</span>
        <span>Prix Article</span>
    </div>
    <p v-for="item in panier" :key="panier.indexOf(item)">
        <span>{{item[1]}}</span>
        <span>{{item[2]}}</span>
    </p>
  </div>
</template>

<script>

export default {
  name: 'Panier',
  data(){
      return{
          panier: JSON.parse(sessionStorage.getItem("panier"))
      }
  }
  
}
</script>

<style scoped>

.head{
    background-color: #41b882;
}  

p, .head{
    border: 3px solid black;
    width: 70vw;
    display: flex;
    justify-content: space-between;
    padding: 10px 20px;
    margin: 1px;
}

p:nth-child(even){
    background-color: gainsboro;
}

p:not(p:nth-child(even)){
    background-color: whitesmoke;
}

.panier{
    display: flex;
    flex-direction: column;
    align-items: center;
}

</style>