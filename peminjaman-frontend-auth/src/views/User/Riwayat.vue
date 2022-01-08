<template>
  <div class="keranjang">
    <div class="container-fluid">

      <div class="row mt-3 ml-1">
        <div class="col">
          <h2>
            Riwayat
            <strong>Peminjaman</strong>
          </h2>
          <div class="table-responsive mt-3">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">No.</th>
                  <th scope="col">Ruangan</th>
                  <th scope="col">Nama</th>
                  <th scope="col">Tanggal</th>
                  <th scope="col">Jam</th>
                  <th scope="col">Keperluan</th>
                  <th scope="col">Status</th>
                  <th scope="col">Hapus</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(keranjang, index) in keranjangs" :key="keranjang.id">
                  <th>{{index+1}}</th>
                  <!-- <td>
                    <img
                      :src=" '../images/' + keranjang.products.gambar "
                      class="img-fluid shadow"
                      width="200"
                    />
                  </td> -->
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
                  <!-- HAPUS -->
                  <td>
                      <button type="button" class="btn btn-danger" @click="hapusKeranjang(keranjang.id)">
                        <i class="fas fa-trash-alt"></i> Delete
                      </button>
                  </td>
                </tr>

              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Form Checkout -->
      <div class="row justify-content-end">
        <div class="col-md-4">
          <form class="mt-4" v-on:submit.prevent>
            <!-- <div class="form-group">
              <label for="nama">Nama :</label>
              <input type="text" class="form-control" v-model="pesan.nama" />
            </div>
            <div class="form-group">
              <label for="noMeja">Nomor Meja :</label>
              <input type="text" class="form-control" v-model="pesan.noMeja" />
            </div> -->

            <!-- <button type="submit" class="btn btn-success float-right" @click="checkout">
              <b-icon-cart></b-icon-cart> Pinjam
            </button> -->
          </form>
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
      pesan: {},
    };
  },
  methods: {
    setKeranjangs(data) {
      this.keranjangs = data;
    },
    hapusKeranjang(id) {
      axios
        .delete("http://localhost:3000/keranjangs/" + id)
        .then(() => {
          this.$router.push({ path: "/user/riwayat"});
          // this.$toast.error("Sukses Hapus Peminjaman", {
          //   type: "error",
          //   position: "top-right",
          //   duration: 3000,
          //   dismissible: true,
          // });

          // Update Data keranjang
          axios
            .get("http://localhost:3000/keranjangs")
            .then((response) => this.setKeranjangs(response.data))
            .catch((error) => console.log(error));
        })
        .catch((error) => console.log(error));
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

<style>
</style>