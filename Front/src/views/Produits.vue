<template>
  <div>
    <Produit v-for="produit in listProduit" :key="produit.Id_Article" :prod="produit" />
  </div>
</template>

<script>
// @ is an alias to /src
import Produit from '../components/Produit.vue'
import axios from "axios"

export default {
  name: 'Produits',
  components: {
    Produit
  },
  data () {
    return {
      listProduit: []
    }
  },
  async created () {
    // getListeProduit
    const response = await axios.get("http://localhost/mangameAPI/listeProduit.php")
    this.listProduit = response.data
  }
}
</script>