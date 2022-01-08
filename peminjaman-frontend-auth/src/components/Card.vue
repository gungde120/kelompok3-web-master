<template>
    <div class="card" style="width: 18rem;">
        <img :src=" '../images/' + product.gambar" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">{{ product.nama }}</h5>
            <h5>
            Jumlah Kursi : <strong>{{ product.kursi }}</strong>
            </h5>
            <h5>
            Jumlah Meja : <strong>{{ product.meja }}</strong>
            </h5>
            <router-link class="btn btn-success" :to="'/user/ruangan/'+product.id"> Pinjam</router-link>
        </div>
</div>
</template>

<script>
export default {
    name: "Card",
    props: ["product"],
};
</script>