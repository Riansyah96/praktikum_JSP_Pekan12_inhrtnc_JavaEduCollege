<%-- 
    Document   : tambah_produk.jsp
    Created on : 18 Des 2025, 15.05.22
    Author     : apriansyah
--%>


<%@page import="dao.JenisDAO, model.Jenis, java.util.List"%>
<div class="card">
    <div class="card-header bg-success text-white">
        <h5>Tambah Produk Baru</h5>
    </div>
    <div class="card-body">
        <form action="ProdukController" method="POST">
            <input type="hidden" name="aksi" value="tambah">
            <div class="mb-3">
                <label class="form-label">Kode Produk</label>
                <input type="text" name="kode" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Nama Produk</label>
                <input type="text" name="nama" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Harga</label>
                <input type="number" name="harga" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Stok</label>
                <input type="number" name="stok" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Kategori</label>
                <select name="idjenis" class="form-select">
                    <%
                        JenisDAO jdao = new JenisDAO();
                        for(Jenis j : jdao.getAll()){
                            out.print("<option value='"+j.getId()+"'>"+j.getNama()+"</option>");
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Simpan</button>
            <a href="index.jsp?halaman=produk" class="btn btn-secondary">Batal</a>
        </form>
    </div>
</div>
