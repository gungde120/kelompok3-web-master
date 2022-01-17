import { createWebHistory, createRouter } from "vue-router";
import Home from "./views/Home.vue";
import Login from "./views/Login.vue";
import Register from "./views/Register.vue";
import Rooms from "./views/User/Rooms.vue";
import RoomDetail from './views/User/RoomDetail.vue';
import Keranjang from './views/User/Riwayat.vue';
import Jadwal from './views/Jadwal.vue';
import EditProfile from './views/EditProfile.vue';

//ADMIN
import EditRuangan from './views/Admin/EditRuangan.vue';
import ListRuangan from './views/Admin/ListRuangan.vue';
import ListPeminjaman from './views/Admin/ListPinjam.vue';

//MODERATOR
import ModEditRuangan from './views/Moderator/ModEditRuangan.vue';
import ModListRuangan from './views/Moderator/ModListRuangan.vue';
import ModAddRuangan from './views/Moderator/ModAddRuangan.vue';

// lazy-loaded
const Profile = () => import("./views/Profile.vue")
const BoardAdmin = () => import("./views/Admin/BoardAdmin.vue")
const BoardModerator = () => import("./views/Moderator/BoardModerator.vue")
const BoardUser = () => import("./views/User/BoardUser.vue")

const routes = [
  {
    path: "/",
    name: "home",
    component: Home,
  },
  {
    path: "/home",
    component: Home,
  },
  {
    path: "/login",
    component: Login,
  },
  {
    path: "/register",
    component: Register,
  },
  {
    path: "/profile",
    name: "profile",
    // lazy-loaded
    component: Profile,
  },
  {
    path: "/profile/edit",
    component: EditProfile,
  },
  {
    path: "/admin",
    name: "admin",
    // lazy-loaded
    component: BoardAdmin,
  },
  {
    path: '/admin/ruangan',
    name: 'ListRuangan',
    component: ListRuangan
  },
  {
    path: '/admin/ruangan/editruangan/:id',
    name: 'EditRuangan',
    component: EditRuangan
  },
  {
    path: '/admin/peminjaman',
    name: 'ListPeminjaman',
    component: ListPeminjaman
  },

  // MOD
  {
    path: "/moderator",
    name: "moderator",
    // lazy-loaded
    component: BoardModerator,
  },
  {
    path: '/moderator/ruangan',
    name: 'ListRuangan',
    component: ModListRuangan
  },
  {
    path: '/moderator/ruangan/addruangan',
    name: 'ModAddRuangan',
    component: ModAddRuangan
  },
  {
    path: '/moderator/ruangan/editruangan/:id',
    name: 'EditRuangan',
    component: ModEditRuangan
  },

  //USER
  {
    path: "/user",
    name: "user",
    // lazy-loaded
    component: BoardUser,
  },
  {
    path: "/jadwalpeminjaman",
    component: Jadwal,
  },
  {
    path: "/user/ruangan",
    component: Rooms,
  },
  {
    path: '/user/ruangan/:id',
    name: 'RoomDetail',
    component: RoomDetail
  },
  {
    path: '/user/riwayat',
    name: 'Keranjang',
    component: Keranjang
  },
  
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  const publicPages = ['/login', '/register', '/home'];
  const authRequired = !publicPages.includes(to.path);
  const loggedIn = localStorage.getItem('user');

  // trying to access a restricted page + not logged in
  // redirect to login page
  // or redirect to landing page
  if (authRequired && !loggedIn) {
    next('/home');
  } else {
    next();
  }
});

export default router;