<template>
  <div class="ml-5 mr-3">
    <Pesanan />
  </div>
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