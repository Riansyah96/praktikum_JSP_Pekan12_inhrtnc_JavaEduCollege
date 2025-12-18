<%@page import="dao.ProdukDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Produk"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Memanggil DAO untuk mengambil data dari database
    ProdukDAO dao = new ProdukDAO();
    List<Produk> daftarProduk = dao.getAll();
%>

<div class="card">
    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Data Produk</h5>
        <a href="index.jsp?halaman=tambah_produk" class="btn btn-light btn-sm fw-bold">
            + Tambah Produk
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th width="50">No</th>
                        <th>Kode</th>
                        <th>Nama Produk</th>
                        <th>Jenis Produk</th>
                        <th>Harga</th>
                        <th>Stok</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int no = 1;
                        if (daftarProduk != null && !daftarProduk.isEmpty()) {
                            for (Produk p : daftarProduk) {
                    %>
                    <tr>
                        <td><%= no++ %></td>
                        <td><span class="badge bg-secondary"><%= p.getKode() %></span></td>
                        <td><%= p.getNama() %></td>
                        <td>
                            <%= (p.getJenis() != null) ? p.getJenis().getNama() : "<i class='text-muted'>Tanpa Kategori</i>" %>
                        </td>
                        <td>Rp <%= String.format("%,.0f", p.getHarga()) %></td>
                        <td><%= p.getStok() %> unit</td>
                    </tr>
                    <% 
                            }
                        } else { 
                    %>
                    <tr>
                        <td colspan="6" class="text-center text-danger">
                            Data tidak ditemukan atau koneksi database bermasalah.
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>