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
                                    <button type="button" class="btn btn-success mr-2 mb-2" @click="okPinjam(keranjang.id)">               
                                        OK
                                    </button>
                                    <button type="button" class="btn btn-danger mb-2" @click="cancelPinjam(keranjang.id)">
                                        Cancel
                                    </button>
                                </div>
                            </td>

                            <!-- HAPUS -->
                            <td>
                                <button type="button" class="btn btn-danger mb-2" @click="deleteKeranjang(keranjang.id)">
                                    Hapus
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