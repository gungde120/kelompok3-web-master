<template>
  <div class="ml-5 mr-3">
    <Pesanan />
  </div>
  <!-- <div class="keranjang">
    <div class="container-fluid">

      <div class="row mt-3 ml-1">
        <div class="col">
          <h2>
            Riwayat
            <strong>Peminjaman {{currentUser.username}}</strong>
          </h2>
          <div class="table-responsive mt-3">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">No.</th>
                  <th scope="col">Tanggal</th>
                  <th scope="col">Nama</th>
                  <th scope="col">Ruang</th>
                  <th scope="col">Jam</th>
                  <th scope="col">Keperluan</th>
                  <th scope="col">Status</th>
                  <th scope="col">Opsi</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(keranjang, index) in keranjangs" :key="keranjang.id">
                  <th>{{index+1}}</th>
                  <td>
                    <img
                      :src=" '../images/' + keranjang.products.gambar "
                      class="img-fluid shadow"
                      width="200"
                    />
                  </td> 

                  <td >{{ keranjang.tgl_pinjam }}</td>

                  <td >{{ keranjang.username }}</td>

                  <td> <strong>{{ keranjang.products.kode }}</strong> </td>

                  <td >{{ keranjang.jam_start }} - {{ keranjang.jam_end }} </td>

                  <td >{{ keranjang.keterangan ? keranjang.keterangan : "-" }}</td>

                  <td class="h6"><strong>{{ keranjang.status }}</strong></td>

                  <td>
                      <button type="button" class="btn btn-danger" @click="hapusKeranjang(keranjang.id)">
                        <i class="fas fa-trash-alt"></i> Cancel
                      </button>
                  </td>
                </tr>

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div> -->
</template>

<script>
import axios from "axios";
import Pesanan from "@/components/Pesanan.vue";

export default {
  name: "Keranjang",
  components: {
    Pesanan,
  },
  data() {
    return {
      keranjangs: [],
      pesan: {},
    };
  },
  created() {
    this.getKeranjangs();
  },
  methods: {
    setKeranjangs(data) {
      this.keranjangs = data;
    },

    async getKeranjangs() {
      try {
        const response = await axios.get("http://localhost:3000/keranjangs");
        this.keranjangs = response.data;
      } catch (err) {
        console.log(err);
      }
    },
    // hapusKeranjang(id) {
    //   axios
    //     .delete("http://localhost:3000/keranjangs/" + id)
    //     .then(() => {
    //       this.$router.push({ path: "/user/riwayat"});
    //       // this.$toast.error("Sukses Hapus Peminjaman", {
    //       //   type: "error",
    //       //   position: "top-right",
    //       //   duration: 3000,
    //       //   dismissible: true,
    //       // });

    //       // Update Data keranjang
    //       axios
    //         .get("http://localhost:3000/keranjangs")
    //         .then((response) => this.setKeranjangs(response.data))
    //         .catch((error) => console.log(error));
    //     })
    //     .catch((error) => console.log(error));
    // },
  },
  // mounted() {
  //     axios
  //       .get("http://localhost:3000/keranjangs")
  //       .then((response) => this.setKeranjangs(response.data))
  //       .catch((error) => console.log(error));
  // },
  computed: {
    currentUser() {
      return this.$store.state.auth.user;
    }
  },
};
</script>

<style>
</style>