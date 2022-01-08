// import express
import express from "express";

// import function from controller
import { showProducts, showProductById, createProduct, updateProduct, deleteProduct } from "../controllers/product.js";
import { showKeranjangs, showKeranjangById, createKeranjang, updateKeranjang, deleteKeranjang } from "../controllers/keranjang.js";

// init express router
const router = express.Router();

// Get All product
router.get('/products', showProducts);
// Get Single Product
router.get('/products/:id', showProductById);
// Create New Product
router.post('/products', createProduct);
// Update Product
router.put('/products/:id', updateProduct);
// Delete Product
router.delete('/products/:id', deleteProduct);

// Get All Keranjang
router.get('/keranjangs', showKeranjangs);
// Get Single Keranjang
router.get('/keranjangs/:id', showKeranjangById);
// Create New Keranjang
router.post('/keranjangs', createKeranjang);
// Update Keranjang
router.put('/keranjangs/:id', updateKeranjang);
// Delete Keranjang
router.delete('/keranjangs/:id', deleteKeranjang);

// export default router
export default router;