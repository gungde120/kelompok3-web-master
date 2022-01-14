<template>
  <div id="app">
    <nav class="navbar navbar-expand navbar-light bg-light">
      <div class="">
        <a href="/" class="navbar-brand p-2">
          <img
        id="profile-img"
        src="/images/bigprimakara.png"
        style="width: 120px;"
      />
        </a>
      </div>

    <!-- NAVBAR USER -->
    <ul class="nav nav-pills nav-flush flex-column text-center">
        <li class="nav-item">
            <router-link v-if="currentUser" to="/user/ruangan" class="nav-link text-dark">Ruangan</router-link>
        </li>
    </ul>

    <ul class="nav nav-pills nav-flush flex-column text-center">
        <li class="nav-item">
            <router-link v-if="currentUser" to="/user/riwayat" class="nav-link text-dark">Riwayat</router-link>
        </li>
    </ul>
    <!-- NAVBAR USER -->

      <div v-if="!currentUser" class="navbar-nav ml-auto">
        <li class="nav-item">
          <router-link to="/register" class="nav-link">
            <font-awesome-icon icon="user-plus" /> Sign Up
          </router-link>
        </li>
        <li class="nav-item">
          <router-link to="/login" class="nav-link">
            <font-awesome-icon icon="sign-in-alt" /> Login
          </router-link>
        </li>
      </div>

      <div v-if="currentUser" class="navbar-nav ml-auto">
        <li class="nav-item">
          <router-link to="/profile" class="nav-link text-dark">
            <font-awesome-icon icon="user" />
            {{ currentUser.username }}
          </router-link>
        </li>
        <li class="nav-item">
          <a class="nav-link text-dark" @click.prevent="logOut">
            <font-awesome-icon icon="sign-out-alt" /> LogOut
          </a>
        </li>
      </div>
    </nav>

    <!-- SIDEBAR -->
    <div class="row">
      <!-- <Sidebar /> -->


    <div class="col p-0">
      <router-view />
    </div>
    </div>
    
  </div>
      <footer class="navbar navbar-expand bg-light text-dark text-center">
        Peminjaman Ruangan STMIK Primakara. Prototype by Kelompok 3.</footer>
</template>

<script>
  // import Sidebar from "@/components/Sidebar.vue";

  export default {
    components: {
    // Sidebar,
  },
  computed: {
    currentUser() {
      return this.$store.state.auth.user;
    },
    showAdminBoard() {
      if (this.currentUser && this.currentUser['roles']) {
        return this.currentUser['roles'].includes('ROLE_ADMIN');
      }

      return false;
    },
    showModeratorBoard() {
      if (this.currentUser && this.currentUser['roles']) {
        return this.currentUser['roles'].includes('ROLE_MODERATOR');
      }

      return false;
    }
  },
  methods: {
    logOut() {
      this.$store.dispatch('auth/logout');
      this.$router.push('/login');
    }
  }
};
</script>