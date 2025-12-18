package dao;

import util.KoneksiDB;
import java.sql.*;
import java.util.*;
import model.Jenis;
import model.Produk;

public class ProdukDAO {

    /**
     * Method untuk menyimpan data produk baru ke database
     */
    public void simpan(Produk p) {
        // Pastikan nama kolom 'idjenis' sesuai dengan tabel di PostgreSQL Anda
        String sql = "INSERT INTO produk (kode, nama, harga, stok, idjenis) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection c = KoneksiDB.getConnection(); 
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, p.getKode());
            ps.setString(2, p.getNama());
            ps.setDouble(3, p.getHarga());
            ps.setInt(4, p.getStok());
            ps.setInt(5, p.getIdjenis());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("DEBUG: Data produk berhasil disimpan ke database.");
            }
        } catch (Exception e) {
            System.out.println("DEBUG Gagal simpan: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Method untuk mengambil semua data produk beserta nama jenisnya
     */
    public List<Produk> getAll() {
        List<Produk> list = new ArrayList<>();
        // Query menggunakan LEFT JOIN untuk mendapatkan informasi nama jenis dari tabel jenis
        String sql = "SELECT p.id, p.kode, p.nama, p.harga, p.stok, "
                + "j.id AS idjenis, j.nama AS namajenis "
                + "FROM produk p "
                + "LEFT JOIN jenis j ON p.idjenis = j.id "
                + "ORDER BY p.id DESC";

        try (Connection c = KoneksiDB.getConnection(); 
             Statement s = c.createStatement(); 
             ResultSet r = s.executeQuery(sql)) {

            while (r.next()) {
                Produk p = new Produk();
                p.setId(r.getInt("id"));
                p.setKode(r.getString("kode"));
                p.setNama(r.getString("nama"));
                p.setHarga(r.getDouble("harga"));
                p.setStok(r.getInt("stok"));

                // Cek apakah produk memiliki relasi ke jenis
                if (r.getObject("idjenis") != null) {
                    Jenis j = new Jenis();
                    j.setId(r.getInt("idjenis"));
                    j.setNama(r.getString("namajenis"));
                    p.setJenis(j);
                } else {
                    p.setJenis(null);
                }

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}