<template>
  <div class="row">
    <Sidebar />
    <div class="col ">
      <div class="container">
        <header class="jumbotron bg-dark text-light ">
        <div class="row px-5">
          <!-- <img class="img rounded-circle ml-5 mr-5" style="width: 50px: height: 50px" src="/images/avatar.jpg" alt="..."> -->
          <div class="col">
          <h3>
            <strong>{{currentUser.username}}</strong>
          </h3>
          <br>
          <p>
          <strong>Email :</strong>
          {{currentUser.email}}
        </p>
        <strong>Authorities :</strong>
        <ul>
          <li v-for="role in currentUser.roles" :key="role">{{role}}</li>
        </ul>
        <router-link to="/profile/edit">
            <button type="submit" class="btn btn-primary mt-3">
              Edit
            </button>
        </router-link>
        
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
        
        </header>
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