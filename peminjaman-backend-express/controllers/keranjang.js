// Import function from Keranjang Model
import { getKeranjangs, getKeranjangById, insertKeranjang, updateKeranjangById, deleteKeranjangById } from "../models/keranjangModel.js";

// Get All Keranjangs
export const showKeranjangs = (req, res) => {
    getKeranjangs((err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}

// Get Single Keranjang 
export const showKeranjangById = (req, res) => {
    getKeranjangById(req.params.id, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}

// Create New Keranjang
export const pemesanan = (req, res) => {
    const data = req.body;
    insertKeranjang(data, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}

// Update Keranjang
export const updateKeranjang = (req, res) => {
    const data  = req.body;
    const id    = req.params.id;
    updateKeranjangById(data, id, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}

// Delete Keranjang
export const deleteKeranjang = (req, res) => {
    const id = req.params.id;
    deleteKeranjangById(id, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}