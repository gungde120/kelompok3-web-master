<template>
  <div class="row">
    <Sidebar />
    <div class="col ">
      <div class="container">
        <header class="jumbotron bg-dark text-light ">
          <img src="" alt="">
          <h3>
            <strong>{{currentUser.username}}</strong> Profile
          </h3>
          <p>
          <strong>Email:</strong>
          {{currentUser.email}}
        </p>
        <strong>Authorities:</strong>
        <ul>
          <li v-for="role in currentUser.roles" :key="role">{{role}}</li>
        </ul>
        </header>
        <!-- <p>
          <strong>Token:</strong>
          {{currentUser.accessToken.substring(0, 20)}} ... {{currentUser.accessToken.substr(currentUser.accessToken.length - 20)}}
        </p> -->
        <!-- <p>
          <strong>Id:</strong>
          {{currentUser.id}}
        </p> -->
        
      </div>
    </div>
  </div>

  
</template>

<script>
  import Sidebar from "@/components/Sidebar.vue";

export default {
  name: 'Profile',
  components: {
        Sidebar,
    },
  computed: {
    currentUser() {
      return this.$store.state.auth.user;
    }
  },
  mounted() {
    if (!this.currentUser) {
      this.$router.push('/login');
    }
  }
};
</script>