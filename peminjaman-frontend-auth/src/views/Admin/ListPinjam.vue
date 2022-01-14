<template>
    <div class="row">
        <Sidebar />
        <div class="col">
            <div class="keranjang">
                <div class="ml-2">

                <div class="row">
                    <div class="col mt-3">
                    <h2>
                        Request
                        <strong>Peminjaman</strong>
                    </h2>
                    <div class="table-responsive mt-3">
                        <table class="table">
                        <thead>
                            <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Nama Lengkap</th>
                            <th scope="col">Email</th>
                            <th scope="col">Instansi</th>
                            <th scope="col">Ruangan</th>
                            <th scope="col">Tanggal</th>
                            <th scope="col">Jam</th>
                            <th scope="col">Keperluan</th>
                            <th scope="col">Status</th>
                            <th scope="col">Approval</th>
                            <th scope="col">Hapus</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(keranjang, index) in keranjangs" :key="keranjang.id">
                            <th>{{index+1}}</th>
                            <td >{{ keranjang.nama_lengkap }}</td>
                            <td >{{ keranjang.email }}</td>
                            <td >{{ keranjang.instansi }}</td>
                            <td>
                                <strong>{{ keranjang.kodeProduct }}</strong>
                            </td>
                            <!-- TGL -->
                            <td >{{ keranjang.tgl_pinjam }}</td>
                            <!-- JAM -->
                            <td >{{ keranjang.jam_start }} - {{ keranjang.jam_end }} </td>
                            <!-- KEPERLUAN -->
                            <td class="">{{ keranjang.keterangan ? keranjang.keterangan : "-" }}</td>

                            <!-- STATUS -->
                            <td ><strong>{{ keranjang.status }}</strong></td>
                            <td > 
                                <div>
                                    <button type="button" class="btn btn-success mr-2 mb-2 p-0" @click="okPinjam(keranjang.id)">               
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="fas fa-check" viewBox="0 0 16 16">
                                        <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                                        </svg>
                                    </button>
                                    <button type="button" class="btn btn-danger mb-2 p-0" @click="cancelPinjam(keranjang.id)">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                        </svg>
                                    </button>
                                </div>
                            </td>

                            <!-- HAPUS -->
                            <td>
                                <button type="button" class="btn btn-danger mb-2" @click="deleteKeranjang(keranjang.id)">
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
    </div>
</template>

<script>
    import axios from "axios";
    import Sidebar from "@/components/Sidebar.vue";

    export default {
    name: "Keranjang",
    components: {
        Sidebar,
    },
    data() {
        return {
        keranjangs: [],
        status: "OK",
        };
    },
    methods: {
        setKeranjangs(data) {
        this.keranjangs = data;
        },

        //EXPRESS
        async getKeranjangs() {
        try {
        const response = await axios.get("http://localhost:3000/keranjangs");
        this.keranjangs = response.data;
        } catch (err) {
        console.log(err);
        }
        },
        

        async okPinjam(id) {
            try {
                await axios.put(
                    `http://localhost:3000/keranjangs/${id}`,
                    {
                        status: "OK",                        
                    }
                );
                this.getKeranjangs();
            } catch (err) {
                console.log(err);
            }
        },

        async cancelPinjam(id) {
            try {
                await axios.put(
                    `http://localhost:3000/keranjangs/${id}`,
                    {
                        status: "Cancel",                        
                    }
                );
                this.getKeranjangs();
            } catch (err) {
                console.log(err);
            }
        },
            
        
        async deleteKeranjang(id) {
            try {
                await axios.delete(`http://localhost:3000/keranjangs/${id}`);
                this.getKeranjangs();
            } catch (err) {
                console.log(err);
            }
        },

// DB JSON FOR DUMMY DATA TEST
        // TERIMAPINJAM
        // terimapinjam(id) {
        // axios
        //     .patch("http://localhost:3000/keranjangs/" + id, {
        //         status: "OK"
        //     })
        //     .then(() => {
        //     this.$router.push({ path: "/admin/peminjaman"})
        //     // this.$toast.error("Sukses Menerima Peminjaman", {
        //     //     type: "success",
        //     //     position: "top-right",
        //     //     duration: 3000,
        //     //     dismissible: true,
        //     // });

        //     // Update Data keranjang
        //     axios
        //     .get("http://localhost:3000/keranjangs")
        //     .then((response) => this.setKeranjangs(response.data))
        //     .catch((error) => console.log(error));
        // })
        // .catch((error) => console.log(error));
        // },

// TOLAKPINJAM
        // tolakpinjam(id) {
        // axios
        //     .patch("http://localhost:3000/keranjangs/" + id, {
        //         status: "Cancel"
        //     })
        //     .then(() => {
        //     this.$router.push({ path: "/admin/peminjaman"})
        //     // this.$toast.error("Sukses Menolak Peminjaman", {
        //     //     type: "success",
        //     //     position: "top-right",
        //     //     duration: 3000,
        //     //     dismissible: true,
        //     // });

        //     // Update Data keranjang
        //     axios
        //     .get("http://localhost:3000/keranjangs")
        //     .then((response) => this.setKeranjangs(response.data))
        //     .catch((error) => console.log(error));
        // })
        // .catch((error) => console.log(error));
        // },

// HAPUS KERANJANG
        // hapusKeranjang(id) {
        // axios
        //     .delete("http://localhost:3000/keranjangs/" + id)
        //     .then(() => {
        //     this.$router.push({ path: "/admin/peminjaman"});
        //     // this.$toast.error("Sukses Hapus Peminjaman", {
        //     //     type: "error",
        //     //     position: "top-right",
        //     //     duration: 3000,
        //     //     dismissible: true,
        //     // });

        //     // Update Data keranjang
        //     axios
        //     .get("http://localhost:3000/keranjangs")
        //     .then((response) => this.setKeranjangs(response.data))
        //     .catch((error) => console.log(error));
        // })
        // .catch((error) => console.log(error));
        // },
    },
    mounted() {
        axios
        .get("http://localhost:3000/keranjangs")
        .then((response) => this.setKeranjangs(response.data))
        .catch((error) => console.log(error));
    },
    computed: {
    currentUser() {
        return this.$store.state.auth.user;
        }
    },
};
</script>

<style>
</style>