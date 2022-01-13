<template>
  <div class="room-detail">

      <div class="container">
          <div class="row mt-4">
            <div class="col-md-4">
              <img :src=" '/images/' + product.gambar" class="img-fluid" style="max-width:350px" alt="">
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

            <div class="col">

          <form v-on:submit.prevent>
            <h3>
              <strong>
                Form Peminjaman
              </strong>
            </h3>

            <div class="form-group">
              <label for="jam_start">Nama Lengkap</label>
              <br>
              <input class="w-100 p-2" type="text" aria-label="Nama Lengkap" placeholder="Nama lengkap" v-model="pesan.nama_lengkap">
            </div>

            <div class="form-group">
              <label for="jam_start">Instansi</label>
              <br>
              <input class="w-100 p-2" type="text" aria-label="Nama Instansi" placeholder="Nama Instansi" v-model="pesan.instansi">
            </div>
            
            <!-- TANGGAL -->
            <div class="form-group">
              <label for="tgl_pinjam">Tanggal Pinjam (Lihat jadwal kosong pada tabel jadwal dibawah)</label>
                <br>
                <input class="p-2" type="date" id="date" v-model="pesan.tgl_pinjam">
              <!-- <p>Tanggal : {{ pesan.tgl_pinjam }}</p> -->
            </div>

            <!-- JAM -->
            <div class="form-group">
              <label for="jam_start">Jam In</label>
              <br>
                <input class="p-2" type="time" id="time" v-model="pesan.jam_start">
            </div>

            <div class="form-group">
              <label for="jam_end">Jam Out</label>
              <br>
                <input class="p-2" type="time" id="time" v-model="pesan.jam_end">
            </div>

            <div class="form-group">
              <label for="keterangan">Keperluan (Harus jelas)</label>
              <textarea
                v-model="pesan.keterangan"
                class="form-control" rows="5"
                placeholder="Contoh : Rapat UKM ...">
              </textarea>
            </div>
            <div class="mt-4 mb-3">
                Cek kembali form anda sebelum submit!
            </div>
            <button type="submit" class="btn btn-success" @click="pemesanan">
              Pinjam
            </button>

            <router-link to="/user/ruangan">
              <button type="submit" class="btn btn-danger ml-3">
              Cancel
              </button>
            </router-link>
          </form>
        </div>
      </div>
    </div>

      <div class="mr-5 ml-5">
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
    
    async pemesanan() {
      try {
        await axios.post("http://localhost:3000/keranjangs", {
          nama_lengkap: this.pesan.nama_lengkap,
          email: this.currentUser.email,
          instansi: this.pesan.instansi,
          kodeProduct: this.product.kode,
          tgl_pinjam: this.pesan.tgl_pinjam,
          jam_start: this.pesan.jam_start,
          jam_end: this.pesan.jam_end,
          keterangan: this.pesan.keterangan,
          status: "Diproses",
        });
        this.pesan.email = this.currentUser.email;
        this.$router.push("/user/riwayat");
      } catch (err) {
        console.log(err);
      }
    },

    // DB JSON
    // pemesanan() {
    //     // this.atas_nama = this.email;
    //     this.pesan.email = this.currentUser.email;
    //     this.pesan.status = "Diproses";
    //     this.pesan.products = this.product;
    //     axios
    //       .post("http://localhost:3000/keranjangs", this.pesan)
    //       .then(() => {
    //         this.$router.push({ path: "/user/riwayat"})
    //         // this.$toast.success("Sukses Masuk Pemesanan", {
    //         //   type: "success",
    //         //   position: "top-right",
    //         //   duration: 3000,
    //         //   dismissible: true,
    //         // });
    //       })
    //       .catch((err) => console.log(err));
    // },
  },
  mounted() {
    axios
      .get("http://localhost:3000/products/" + this.$route.params.id)
      .then((response) => this.setProduct(response.data))
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