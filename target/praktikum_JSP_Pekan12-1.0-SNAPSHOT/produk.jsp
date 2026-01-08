<%@page import="model.Produk, dao.ProdukDAO, java.util.List"%>
<div class="card">
    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Data Produk</h5>
        <a href="index.jsp?halaman=form_produk" class="btn btn-light btn-sm fw-bold">+ Tambah Produk</a>
    </div>
    <div class="card-body">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Kode</th><th>Nama</th><th>Jenis</th><th>Harga</th><th>Stok</th><th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Produk> list = new ProdukDAO().getAll();
                    for (Produk p : list) {
                %>
                <tr>
                    <td><span class="badge bg-secondary"><%= p.getKode() %></span></td>
                    <td><%= p.getNama() %></td>
                    <td><%= (p.getJenis() != null) ? p.getJenis().getNama() : "-" %></td>
                    <td>Rp <%= String.format("%,.0f", p.getHarga()) %></td>
                    <td><%= p.getStok() %></td>
                    <td>
                        <a href="index.jsp?halaman=form_produk&id=<%= p.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="ProdukController?aksi=hapus&id=<%= p.getId() %>" 
                           class="btn btn-danger btn-sm" onclick="return confirm('Yakin hapus data ini?')">Hapus</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>