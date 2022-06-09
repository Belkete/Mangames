<template>
  <div class="admin">
    <Commande v-for="commande in listCommande" :key="commande.Id_Commande" :com="commande" />
  </div>
</template>

<script>
// @ is an alias to /src
import axios from "axios"
import Commande from '../components/Commande.vue'

export default {
  name: 'Admin',
  components: {
    Commande
  },
  data () {
    return {
      listCommande: []
    }
  },
  async created () {
    // getListeCommande
    const response = await axios.get("http://localhost/mangameAPI/listCommande.php")
    console.log(response.data)
    this.listCommande = response.data
  }
}
</script>

<style scoped>
.admin{
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 2rem;
}
table,
td {
    border: 1px solid #333;
}

thead,
tfoot {
    background-color: #333;
    color: #fff;
}

</style>