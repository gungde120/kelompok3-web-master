<template>
    <div class="container">
        <div class="row mt-4">
            <div class="col ml-3">
            <h3>
                Daftar
                <strong>Ruangan</strong>
            </h3>

            <input
                v-model="searchRoom"
                type="search"
                class="form-control text-center mt-3"
                style="max-width: 21rem"
                placeholder="Search Ruangan.."
                aria-label="Cari"
                aria-describedby="basic-addon1"    
                />
            </div>  
        </div>

        <div class="row mb-3 ml-auto">
            <div class="col-md-4 mt-4" v-for="product in filteredproducts" :key="product.id">
            <Card :product="product" />
            </div>
        </div>
    </div>
    <div>
        <hr>
        <!-- tabel peminjaman universal-->
        <Jadwal />
    </div>
</template>

    <script>
    import Jadwal from "@/views/Jadwal.vue";
    import Card from "@/components/Card.vue";
    import axios from "axios";

    export default {
    name: "Rooms",
    components: {
        Card,
        //NavbarUser,
        
        Jadwal,
    },
    data() {
        return {
        products: [],
        searchRoom: '',
        };
    },
    methods: {
        setProducts(data) {
        this.products = data;
        },
    },
    mounted() {
        axios
            .get("http://localhost:3000/products")
            .then((response) => this.setProducts(response.data))
            .catch((error) => console.log(error));
        },
    computed: {
        filteredproducts() {
        if(this.searchRoom) {
        return this.products.filter(product => {
            return product.nama.toLowerCase().includes(this.searchRoom.toLowerCase())
            })
        } else{
            return this.products;
        }
    }
    }
    
    };
</script>


<style>
</style>