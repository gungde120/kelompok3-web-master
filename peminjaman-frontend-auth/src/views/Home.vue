<template>
  <div class="banner w-100 vh-100 d-flex justify-content-center align-items-center">
          <div class="container col-md-9 text-left ">
              <h2 class="display-3 font-weight-bold">Selamat Datang</h2>
              <h2 class="display-5 font-weight-bold">Sistem Informasi Peminjaman Ruangan
                <br>
              STMIK PRIMAKARA
              </h2>
              <br>
              <a href="/login">
                  <button class="btn btn-primary btn-lg" type="button">Pinjam</button>
              </a>
          </div>
    </div>
  <!-- <div class="container">
    <header class="jumbotron">

      <h3>{{ content }}</h3>
    </header>
  </div> -->
</template>

<script>
import UserService from "../services/user.service";

export default {
  name: "Home",
  data() {
    return {
      content: "",
    };
  },
  mounted() {
    UserService.getPublicContent().then(
      (response) => {
        this.content = response.data;
      },
      (error) => {
        this.content =
          (error.response &&
            error.response.data &&
            error.response.data.message) ||
          error.message ||
          error.toString();
      }
    );
  },
};
</script>
