<template>
    <div class="container">
        <!-- <Navbar />

        <div class="container">
        <div class="row mt-4">
            <div class="col">
            <h2>
                Daftar
                <strong>Ruangan</strong>
            </h2>
            </div>
        </div>

        <div>
            
        </div> -->

        <div class="row mb-3">
            <div class="col-md-4 mt-4" v-for="product in products" :key="product.id">
            <Card :product="product" />
            </div>
        </div>
        <hr>
        <!-- <Pesanan />
        </div> -->
    </div>
    <div class="mr-5 ml-5">
        <hr>
        <!-- tabel peminjaman universal-->
        <Pesanan />
    </div>
</template>

    <script>
    // @ is an alias to /src
    // import Navbar from "@/components/Navbar.vue";
    import Pesanan from "@/components/Pesanan.vue";
    import Card from "@/components/Card.vue";
    import axios from "axios";
    //import NavbarUser from "@/components/NavbarUser.vue";
    

    export default {
    name: "Rooms",
    components: {
        Card,
        //NavbarUser,
        
        Pesanan,
    },
    data() {
        return {
        products: [],
        };
    },
    methods: {
        setProducts(data) {
        this.products = data;
        },
    },
        // async getProducts() {
        //   try {
        //     const response = await axios.get("http://localhost:3000/products");
        //     this.products = response.data;
        //   } catch (err) {
        //     console.log(err);
        //   }
        // },
    mounted() {
        axios
            .get("http://localhost:3000/products")
            .then((response) => this.setProducts(response.data))
            .catch((error) => console.log(error));
        },
    };
</script>


<style>
</style>