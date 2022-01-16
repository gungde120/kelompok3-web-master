<template>
  <div class="row">
    <Sidebar />

    <div class="container" style="display:flex;">
      <div class="row">
      
        <div class="col mt-4">
          <div class="card col" style="width: 18rem; height: 18rem; text-align: center;">
            <div class="mt-3" style="text-align: center; font-size: 5rem; font-weight: bold;">{{ jumlahRuangan }}</div>
            <div class="card-body">
              <h5 class="card-title">Jumlah Ruangan</h5>
              <router-link class="btn btn-success mt-3 px-5" to="/moderator/ruangan">Detail</router-link>
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
  name: "Moderator",
  components: {
    Sidebar,
  },
  data() {
    return {
      content: "",
      jumlahRuangan: '',
    };
  },
  methods: {

      setProducts(data) {
      this.jumlahRuangan = data.length;
      },

    },
  mounted() {

    axios
      .get("http://localhost:3000/products")
      .then((response) => this.setProducts(response.data))
      .catch((error) => console.log(error));

  },
};
</script>
