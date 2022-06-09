<template>
    <div class="commande">
        <table>
            <thead>
                <tr>
                    <th>Id commande</th>
                    <th>Id utilisateur</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{com.Id_Commande}}</td>
                    <td>{{com.Id_Utilisateur}}</td>
                    <td><button>Validé</button></td>
                    <td><button>Supprimer</button></td>
                </tr>
            </tbody>
        </table>  
    </div>
</template>

<script>
export default {
    name: "Commande",
    props: {
        com: Object
    }
}
</script>

<style scoped>

button{
    background-color: #41b882;
}
p{
   font-weight: bold; 
}

.bouton{
    width: 30px;
    height: 30px;
    border: none;
    background-color: #41b882;
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