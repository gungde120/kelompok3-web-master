<template>
  <div class="row">
    <Sidebar />

    <div class="col">

      <div class="container">
        <header class="jumbotron">
          <h3>{{ content }}</h3>
        </header>
      </div>

    </div>
  </div>

</template>

<script>
  import UserService from "../../services/user.service";
  import Sidebar from "@/components/Sidebar.vue";

export default {
  name: "Admin",
  components: {
    Sidebar,
  },
  data() {
    return {
      content: "",
    };
  },
  mounted() {
    UserService.getAdminBoard().then(
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
