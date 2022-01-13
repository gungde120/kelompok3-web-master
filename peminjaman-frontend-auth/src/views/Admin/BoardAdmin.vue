<template>
  <div class="row">
    <Sidebar />

    <div class="container">
      <div class="row">

        <!-- <div class="col mt-4">
          <div class="card col" style="width: 18rem; height: 18rem;">
            <div class="mt-3" style="text-align: center; font-size: 5rem; font-weight: bold;"> 
              {{ jumlahUser }}
            </div>
            <div class="card-body">
              <h5 class="card-title">Jumlah User</h5>
              <router-link class="btn btn-success" to="">Detail</router-link>
            </div>
          </div>
        </div> -->
      
        <div class="col mt-4">
          <div class="card col" style="width: 18rem; height: 18rem; text-align: center;">
            <div class="mt-3" style="text-align: center; font-size: 5rem; font-weight: bold;">{{ jumlahRuangan }}</div>
            <div class="card-body">
              <h5 class="card-title">Jumlah Ruangan</h5>
              <router-link class="btn btn-success mt-3 px-5" to="/admin/ruangan">Detail</router-link>
            </div>
          </div>
        </div>

        <div class="col mt-4">
          <div class="card col" style="width: 18rem; height: 18rem; text-align: center;">
            <div class="mt-3" style="text-align: center; font-size: 5rem; font-weight: bold;">
              {{ jumlahPeminjaman }}</div>
              <div class="card-body">
                <h5 class="card-title">Jumlah Peminjaman</h5>
                <router-link class="btn btn-success mt-3 px-5" to="/admin/peminjaman">Detail</router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
    

  </div>
</template>

<script>
  import Sidebar from "@/components/Sidebar.vue";
  import axios from "axios";

export default {
  name: "Admin",
  components: {
    Sidebar,
  },
  data() {
    return {
      content: "",
      jumlahUser: '',
      jumlahRuangan: '',
      jumlahPeminjaman: '',
    };
  },
  methods: {
      
      setUsers(data) {
      this.jumlahUser = data.length;
      },
      setProducts(data) {
      this.jumlahRuangan = data.length;
      },
      setKeranjangs(data) {
      this.jumlahPeminjaman = data.length;
      },
    },
  mounted() {
    axios
      .get("http://localhost:8080/api/test/user")
      .then((response) => this.setUsers(response.data))
      .catch((error) => console.log(error));
    axios
      .get("http://localhost:3000/products")
      .then((response) => this.setProducts(response.data))
      .catch((error) => console.log(error));
    axios
      .get("http://localhost:3000/keranjangs")
      .then((response) => this.setKeranjangs(response.data))
      .catch((error) => console.log(error));
  },
  computed: {
    currentUser() {
      return this.$store.state.auth.user;
    }
  }
};
</script>
