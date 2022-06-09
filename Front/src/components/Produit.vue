<template>
    <div class="produit">
        <img :src="'http://localhost/mangameAPI/img/' + prod.Lien_Image">
        <div class="info">
            <p>{{prod.Nom_Article}}</p><br>
            <p>{{prod.Prix_Article}} €</p>
            <span><button @click="add" class="bouton">+</button> <button @click="remove" class="bouton">-</button></span>
        </div>  
    </div>
</template>

<script>
export default {
    name: "Produit",
    props: {
        prod: Object
    },
    data(){
        return {
            panier: JSON.parse(sessionStorage.getItem('panier')) ?? []
        }
    },
    methods:{
        add(){
            this.panier.push([this.prod.Id_Article,this.prod.Nom_Article,this.prod.Prix_Article])
            sessionStorage.setItem('panier', JSON.stringify(this.panier))
        },
        remove(){
            this.panier.pop([this.prod.Id_Article,this.prod.Nom_Article,this.prod.Prix_Article])
            sessionStorage.setItem('panier', JSON.stringify(this.panier))
        }
    }
}
</script>

<style scoped>
.produit{
    width: 22vw;
    aspect-ratio: 1/1;    
    border-radius: 16px;
    box-shadow: 10px 10px 10px gainsboro;
    padding-top: 20px; 
    display: inline-block;
    flex-direction: column;
    flex-wrap: nowrap;
    align-content: normal;
    justify-content: center;
    align-items: center;

}

p{
   font-weight: bold; 
}

img{
    width: 50%;
    height: 50%;
}

.bouton{
    width: 30px;
    height: 30px;
    border: none;
    background-color: #41b882;
}
</style>