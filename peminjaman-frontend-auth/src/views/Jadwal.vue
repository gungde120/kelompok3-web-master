<template>
        <div class="col ml-3">
            <div class="keranjang">
                <div class="ml-3">

                <div class="row">
                    <div class="col-fluid mt-3" >
                    <h3>
                        Jadwal
                        <strong>Peminjaman</strong>
                        
                    </h3>
                    </div>

                    <div class="col mt-3 ml-2">
                        <input
                            v-model="searchPinjam"
                            type="search"
                            class="form-control text-center"
                            style="max-width: 21rem"
                            placeholder="Search By Tanggal.."
                            aria-label="Cari"
                            aria-describedby="basic-addon1"
                        />
                    </div>
                    

                    <div class="table-responsive mt-3 text-center">
                        <table class="table table-striped table-bordered">
                        <thead class="table-dark">
                            <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Tanggal</th>
                            <th scope="col">Nama Lengkap</th>
                            <th scope="col">Email</th>
                            <th scope="col">Instansi</th>
                            <th scope="col">Ruangan</th>
                            <th scope="col">Jam</th>
                            <th scope="col">Keperluan</th>
                            <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(keranjang, index) in filteredkeranjangs" :key="keranjang.id">
                            <th>{{index+1}}</th>
                            <!-- TGL -->
                            <td>
                                {{ keranjang.tgl_pinjam }}
                            </td>
                            <td >{{ keranjang.nama_lengkap }}</td>
                            <td >{{ keranjang.email }}</td>
                            <td >{{ keranjang.instansi }}</td>
                            <td>
                                <strong>{{ keranjang.kodeProduct }}</strong>
                            </td>                            
                            <!-- JAM -->
                            <td >{{ keranjang.jam_start }} - {{ keranjang.jam_end }} </td>
                            <!-- KEPERLUAN -->
                            <td class="">{{ keranjang.keterangan ? keranjang.keterangan : "-" }}</td>

                            <!-- STATUS -->
                            <td ><strong>{{ keranjang.status }}</strong></td>
                            
                            </tr>

                        </tbody>
                        </table>
                    </div>
                    
                </div>
                </div>
            </div>
        </div>
</template>

<script>
    import axios from "axios";

    export default {
    name: "Keranjang",
    components: {
    },
    data() {
        return {
        keranjangs: [],
        searchPinjam: '',
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
    },

    filteredkeranjangs() {
        if(this.searchPinjam) {
        return this.keranjangs.filter(keranjang => {
            return keranjang.tgl_pinjam.toLowerCase().includes(this.searchPinjam.toLowerCase())
            })
        } else{
            return this.keranjangs;
        }
    }
    
    },
};
</script>

<style>
</style>