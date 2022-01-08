// import connection
import db from "../config/database.js";

// Get All Keranjangs
export const getKeranjangs = (result) => {
    db.query("SELECT * FROM keranjangs", (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}

// Get Single Keranjang
export const getKeranjangById = (id, result) => {
    db.query("SELECT * FROM keranjangs WHERE id = ?", [id], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results[0]);
        }
    });   
}

// Insert Keranjang to Database
export const insertKeranjang = (data, result) => {
    db.query("INSERT INTO keranjangs SET ?", [data], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}

// Update Keranjang to Database
export const updateKeranjangById = (data, id, result) => {
    db.query("UPDATE keranjangs SET status = ? WHERE id = ?", [data.status, id], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}

// Delete Keranjang to Database
export const deleteKeranjangById = (id, result) => {
    db.query("DELETE FROM keranjangs WHERE id = ?", [id], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}
