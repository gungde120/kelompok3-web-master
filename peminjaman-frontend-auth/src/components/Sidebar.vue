<template>
    <div class="d-flex flex-column flex-shrink-0 bg-dark vh-100% p-2 ml-3" style="max-width: 145px;min-height: 900px">
        <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
            <li class="nav-item">
                <router-link to="/home" class="nav-link text-white">
                <font-awesome-icon icon="home"/> Home
            </router-link>
            </li>
            <br>
            <li v-if="showAdminBoard" class="nav-item">
                <router-link to="/admin" class="nav-link text-white">Dashboard</router-link>
            </li>
            <br>
            <li v-if="showAdminBoard" class="nav-item">
                <router-link to="/admin/peminjaman" class="nav-link text-white">Peminjaman</router-link>
            </li>
            <br>
            <li v-if="showAdminBoard" class="nav-item">
                <router-link to="/admin/ruangan" class="nav-link text-white">Edit Ruangan</router-link>
            </li>
            <hr>
        </ul>
    </div>
</template>

<script>
export default {
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