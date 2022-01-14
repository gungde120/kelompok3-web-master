<template>
    <div class="row">
        <Sidebar />
        <div class="col">
            <div class="ml-3">

        <div class="row mt-3">
            <div class="col">
            <h2>
                List
                <strong>Ruangan</strong>
            </h2>
            <div class="table-responsive mt-3">
                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Foto</th>
                    <th scope="col">Ruangan</th>
                    <th scope="col">Jumlah Kursi</th>
                    <th scope="col">Jumlah Meja</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Hapus</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(product, index) in products" :key="product.id">

                    <th>{{index+1}}</th>

                    <td>
                        <img
                        :src=" '/images/' + product.gambar "
                        class="img-fluid shadow"
                        width="200"
                        />
                    </td>

                    <td>
                        <strong>{{ product.nama }}</strong>
                    </td>
                    <!-- KURSI -->
                    <td >{{ product.kursi }}</td>
                    <!-- MEJA -->
                    <td >{{ product.meja }}</td>

                    <!-- EDIT -->
                    <td>
                        <router-link :to="'/moderator/ruangan/editruangan/'+product.id">
                            <button type="button" class="btn btn-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                                </svg>
                            </button>
                        </router-link>
                    </td>

                    <!-- HAPUS -->
                    <td>
                        <button type="button" class="btn btn-danger" @click="hapusRuangan(products.id)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </button>
                    </td>
                    </tr>

                </tbody>
                </table>
            </div>
            </div>
        </div>
        </div>
        </div>
    </div>   
</template>

<script>
    import axios from "axios";
    import Sidebar from "@/components/Sidebar.vue";

    export default {
    name: "ModListRuangan",
    components: {
        Sidebar,
    },
    data() {
        return {
        products: [],
        pesan: {},
        };
    },
    methods: {
        setProducts(data) {
        this.products = data;
        
        },

        // // UPDATE STATUS
        // updateKeranjang(id) {
        //     axios
        //     .put("http://localhost:3000/keranjangs/" + id)
        //     .then(() => {
        //     this.keranjangs.status = '';
        //     this.$toast.error("Sukses Update Status", {
        //         type: "error",
        //         position: "top-right",
        //         duration: 3000,
        //         dismissible: true,
        //     });

        //     // Update Data keranjang
        //     axios
        //     .get("http://localhost:3000/keranjangs")
        //     .then((response) => this.setKeranjangs(response.data))
        //     .catch((error) => console.log(error));
        // })
        // .catch((error) => console.log(error));
        // },

    // HAPUS RUANGAN
        hapusRuangan(id) {
        axios
            .delete("http://localhost:3000/products/" + id)
            .then(() => {
            this.$toast.error("Sukses Hapus Ruangan", {
                type: "error",
                position: "top-right",
                duration: 3000,
                dismissible: true,
            });

        // Update Data Ruangan
        axios
        .get("http://localhost:3000/products")
        .then((response) => this.setProducts(response.data))
        .catch((error) => console.log(error));
        })
        .catch((error) => console.log(error));
    }
    },
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