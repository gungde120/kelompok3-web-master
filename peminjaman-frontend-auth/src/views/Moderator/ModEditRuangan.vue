<template>
    <div class="row">
        <Sidebar />
        <div class="col">
            <!-- CONTENT -->
            <div class="container">   
                <div class="row mt-4">
                    <div class="col-md-6">
                        <img :src=" '/images/' + product.gambar" class="img-fluid" alt="">
                    </div>
                    
                    <div class="col-md-6 mt-3">
                    <h2>
                        <strong>{{ product.nama }}</strong>
                    </h2>
                    <hr />

                    <h5>
                        Jumlah Kursi :
                        <strong>{{ product.kursi }}</strong>
                    </h5>

                    <h5>
                        Jumlah Meja :
                        <strong>{{ product.meja }}</strong>
                    </h5>

                    <hr />
                    <form class="mt-4" v-on:submit.prevent>
                        
                        <div>
                            Ubah Jumlah Kursi
                            <br>
                            <input class="form-control" v-model="kursi" type="number" placeholder="Masukkan Angka"/>
                            <div class="mt-2">Jumlah Kursi Terbaru : <strong>{{ kursi }}</strong> </div>
                        </div>
                    <hr />
                        <div>
                            Ubah Jumlah Meja
                            <br>
                            <input class="form-control" v-model="meja" type="number" placeholder="Masukkan Angka"/>
                            <div class="mt-2">Jumlah Meja Terbaru : <strong>{{ meja }}</strong></div>
                        </div>
                    <hr />
                        <button type="submit" class="btn btn-success" @click="updateProduct(product.id)">
                        Simpan
                        </button>
                        <router-link to="/moderator/ruangan">
                            <button type="submit" class="btn btn-danger ml-3">
                            Cancel
                            </button>
                        </router-link>
                    </form>
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
    name: "ModEditRuangan",
    components: {
        Sidebar,
    },
    data() {
        return {
        product: {},
        kursi: "",
        meja: ""
        };
    },
    methods: {
        //JSON
    setProduct(data) {
        this.product = data;
    },

    async updateProduct() {
        try {
            await axios.put(
                `http://localhost:3000/products/${this.$route.params.id}`,
            {
                kursi: this.kursi,
                meja: this.meja,
            }
        );
        this.kursi = "";
        this.meja = "";
        this.$router.push("/moderator/ruangan/");
        } catch (err) {
            console.log(err);
        }
    },

//DB JSON
    //     updateProduct(id) {
    //     // this.edit.kursi = this.products.kursi;
    //     // this.edit.meja = this.products.meja;
    //     axios
    //         .patch("http://localhost:3000/products/"+ id, {
    //             kursi: this.kursi,
    //             meja: this.meja,
    //         })
    //         .then(() => {
    //             this.$router.push({ path: "/admin/ruangan"})
    //             this.$toast.success("Sukses Edit Ruangan", {
    //             type: "success",
    //             position: "top-right",
    //             duration: 3000,
    //             dismissible: true,
    //             });
    //         })
    //         .catch((err) => console.log(err));
    // },

    },
    mounted() {
        axios
        .get("http://localhost:3000/products/" + this.$route.params.id)
        .then((response) => this.setProduct(response.data))
        .catch((error) => console.log(error));
    },
};
</script>

<style>
</style>