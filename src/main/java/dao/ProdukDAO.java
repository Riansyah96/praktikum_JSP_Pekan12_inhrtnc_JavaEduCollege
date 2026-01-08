package dao;

import util.KoneksiDB;
import java.sql.*;
import java.util.*;
import model.Jenis;
import model.Produk;

public class ProdukDAO {

    // CREATE: Simpan data baru
    public void simpan(Produk p) {
        String sql = "INSERT INTO produk (kode, nama, harga, stok, idjenis) VALUES (?, ?, ?, ?, ?)";
        try (Connection c = KoneksiDB.getConnection(); 
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, p.getKode());
            ps.setString(2, p.getNama());
            ps.setDouble(3, p.getHarga());
            ps.setInt(4, p.getStok());
            ps.setInt(5, p.getIdjenis());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // READ: Ambil semua data untuk tabel (dengan JOIN agar muncul Nama Jenis)
    public List<Produk> getAll() {
        List<Produk> list = new ArrayList<>();
        String sql = "SELECT p.*, j.nama AS namajenis FROM produk p "
                   + "LEFT JOIN jenis j ON p.idjenis = j.id ORDER BY p.id DESC";
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
                
                Jenis j = new Jenis();
                j.setId(r.getInt("idjenis"));
                j.setNama(r.getString("namajenis"));
                p.setJenis(j);
                list.add(p);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // READ ONE: Ambil 1 data berdasarkan ID (untuk Edit)
    public Produk getById(int id) {
        Produk p = null;
        String sql = "SELECT * FROM produk WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection(); 
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet r = ps.executeQuery();
            if (r.next()) {
                p = new Produk();
                p.setId(r.getInt("id"));
                p.setKode(r.getString("kode"));
                p.setNama(r.getString("nama"));
                p.setHarga(r.getDouble("harga"));
                p.setStok(r.getInt("stok"));
                p.setIdjenis(r.getInt("idjenis"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return p;
    }

    // UPDATE: Update data lama
    public void ubah(Produk p) {
        String sql = "UPDATE produk SET kode=?, nama=?, harga=?, stok=?, idjenis=? WHERE id=?";
        try (Connection c = KoneksiDB.getConnection(); 
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, p.getKode());
            ps.setString(2, p.getNama());
            ps.setDouble(3, p.getHarga());
            ps.setInt(4, p.getStok());
            ps.setInt(5, p.getIdjenis());
            ps.setInt(6, p.getId());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // DELETE: Hapus data
    public void hapus(int id) {
        String sql = "DELETE FROM produk WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection(); 
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}