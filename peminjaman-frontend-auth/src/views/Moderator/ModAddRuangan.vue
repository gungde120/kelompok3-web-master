<template>
    <div class="row">
        <Sidebar />
        <div class="col">
            <!-- CONTENT -->
            <div class="ml-4" style="max-width: 500px">   
                <div class="row">
                    <div class="col">
                    <form class="mt-4" v-on:submit.prevent @submit="addProduct" aria-required="true"> 
                        <div class="my-3">
                            <strong>Nama Ruangan</strong> 
                            <br>
                            <input class="form-control" v-model="add.nama" type="name" placeholder='Ruang 3H, Studio 1, ..' required/>
                        </div>
                        <div class="my-3">
                            <strong>Kode Ruangan</strong>
                            <br>
                            <input class="form-control" v-model="add.kode" type="name" placeholder='3H, 3Z, studio 1, ..' required/>
                        </div>
                        <div class="my-3">
                            <strong>Jumlah Kursi</strong> 
                            <br>
                            <input class="form-control" v-model="add.kursi" type="number" placeholder="Masukkan jumlah kursi" required/>
                        </div>
                        <div class="my-3">
                            <strong>Jumlah Meja</strong> 
                            <br>
                            <input class="form-control" v-model="add.meja" type="number" placeholder="Masukkan jumlah meja" required/>
                        </div>
                        <div class="my-3">
                            <strong>Upload Foto</strong> 
                            <br>
                            <input class="mt-2" type="file" placeholder="Upload Gambar"/>
                        </div>
                    

                        <input type="submit" value="Tambah" class="btn btn-success my-3">
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
        add: {},
        };
    },

    methods: {
        async addProduct() {
        try {
            await axios.post("http://localhost:3000/products", {
            nama: this.add.nama,
            kode: this.add.kode,
            kursi: this.add.kursi,
            meja: this.add.meja,
            gambar: "altimg.jpg"
            });
            this.$router.push("/moderator/ruangan");
        } catch (err) {
            console.log(err);
        }
    },

    }

    }
</script>

<style>

</style>
