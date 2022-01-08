<template>
    <div>
        <div class="row mt-4">
            <div class="col">
                <h2>
                Jadwal
                <strong>Peminjaman</strong>
                </h2>
            </div>
        </div>
        <div class="table-responsive mt-3">
            <table class="table">
                <thead>
                <tr>
                <th scope="col">No.</th>
                <th scope="col">Foto</th>
                <th scope="col">Ruangan</th>
                <th scope="col">Nama</th>
                <th scope="col">Tanggal</th>
                <th scope="col">Jam</th>
                <th scope="col">Keperluan</th>
                <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
            <tr v-for="(keranjang, index) in keranjangs" :key="keranjang.id">
                <th>{{index+1}}</th>
                    <td>
                        <img
                        :src=" '/images/' + keranjang.products.gambar "
                        class="img-fluid shadow"
                        width="200"
                        />
                    </td>
                    <td>
                    <strong>{{ keranjang.products.nama }}</strong>
                    </td>
                    <td >{{ keranjang.atas_nama }}</td>
                    <!-- TGL -->
                    <td >{{ keranjang.tgl_pinjam }}</td>
                    <!-- JAM -->
                    <td >{{ keranjang.jam_start }} - {{ keranjang.jam_end }} </td>
                    <!-- KEPERLUAN -->
                    <td >{{ keranjang.keterangan ? keranjang.keterangan : "-" }}</td>
                    <!-- STATUS -->
                    <td class="h5"><strong>{{ keranjang.status }}</strong></td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
// @ is an alias to /src
import axios from "axios";

export default {
    name: "Keranjang",
    data() {
    return {
        keranjangs: [],
    };
    },
    methods: {
    setKeranjangs(data) {
        this.keranjangs = data;
    },
    },
    mounted() {
    axios
        .get("http://localhost:3000/keranjangs")
        .then((response) => this.setKeranjangs(response.data))
        .catch((error) => console.log(error));
    },
};
</script>