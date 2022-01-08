<template>
  <div class="room-detail">

      <div class="container">
          <div class="row mt-4">
            <div class="col-md-4">
              <img :src=" '/images/' + product.gambar" class="img-fluid" style="max-width:300px" alt="">
              <hr>
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
            </div>
            <div class="col-md-6">

          <form v-on:submit.prevent>
            <h3>
              <strong>
                Form Peminjaman
              </strong>
              </h3>
            <!-- TANGGAL -->
            <div class="form-group">
              <label for="tgl_pinjam">Tanggal Pinjam (Lihat jadwal kosong pada tabel jadwal dibawah)</label>
                <br>
                <input class="mb-3" type="date" id="date" v-model="pesan.tgl_pinjam">
                
              <p>Tanggal : {{ pesan.tgl_pinjam }}</p>
            </div>

            <!-- JAM -->
            <div class="form-group">
              <label for="jam_start">Waktu Awal</label>
              <br>
                <input type="time" id="time" v-model="pesan.jam_start">
            </div>

            <div class="form-group">
              <label for="jam_end">Waktu Akhir</label>
              <br>
                <input type="time" id="time" v-model="pesan.jam_end">
            </div>

            <div class="form-group">
              <label for="keterangan">Keperluan (Harus jelas)</label>
              <textarea
                v-model="pesan.keterangan"
                class="form-control"
                placeholder="Contoh : Nama Ormawa, Nama anggota peminjam ..">
              </textarea>
            </div>

            <button type="submit" class="btn btn-success" @click="pemesanan">
              Pinjam
            </button>
          </form>
        </div>
      </div>
    </div>

      <div class="container">
        <hr>
        <!-- tabel peminjaman universal-->
        <Pesanan />
      </div>
      
    </div>
</template>

<script>
import Pesanan from "@/components/Pesanan.vue";
import axios from "axios";

export default {
  name: "RoomDetail",
  components: {
    Pesanan,
  },
  data() {
    return {
      product: {},
      pesan: {},
    };
  },
  methods: {
    setProduct(data) {
      this.product = data;
    }, 

    // async getProducts() {
    //   try {
    //     const response = await axios.get("http://localhost:3000/products/:id");
    //     this.products = response.data;
    //   } catch (err) {
    //     console.log(err);
    //   }
    // },

    pemesanan() {
        // this.atas_nama = this.email;
        // this.atas_nama = currentUser.username;
        this.pesan.status = "Diproses";
        this.pesan.products = this.product;
        axios
          .post("http://localhost:3000/keranjangs", this.pesan)
          .then(() => {
            this.$router.push({ path: "/user/riwayat"})
            // this.$toast.success("Sukses Masuk Pemesanan", {
            //   type: "success",
            //   position: "top-right",
            //   duration: 3000,
            //   dismissible: true,
            // });
          })
          .catch((err) => console.log(err));
    },
  },
  mounted() {
    axios
      .get("http://localhost:3000/products/" + this.$route.params.id)
      .then((response) => this.setProduct(response.data))
      .catch((error) => console.log(error));
  },
  // computed: {
  //   currentUser() {
  //     return this.$store.state.auth.user;
  //   }
  // },
};
</script>

<style>
</style>