<%@page import="model.Jenis, dao.JenisDAO, model.Produk, dao.ProdukDAO"%>
<%
    // Cek apakah ada parameter ID (jika ada berarti sedang EDIT)
    String id = request.getParameter("id");
    Produk p = null;
    String judul = "Tambah";
    String aksi = "tambah";
    
    if (id != null) {
        p = new ProdukDAO().getById(Integer.parseInt(id));
        judul = "Edit";
        aksi = "ubah";
    }
%>

<div class="card">
    <div class="card-header bg-success text-white">
        <h5><%= judul %> Produk</h5>
    </div>
    <div class="card-body">
        <form action="ProdukController" method="POST">
            <input type="hidden" name="aksi" value="<%= aksi %>">
            <% if(p != null) { %> <input type="hidden" name="id" value="<%= p.getId() %>"> <% } %>
            
            <div class="mb-3">
                <label class="form-label">Kode Produk</label>
                <input type="text" name="kode" class="form-control" value="<%= (p!=null)?p.getKode():"" %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Nama Produk</label>
                <input type="text" name="nama" class="form-control" value="<%= (p!=null)?p.getNama():"" %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Harga</label>
                <input type="number" name="harga" class="form-control" value="<%= (p!=null)?(int)p.getHarga():"" %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Stok</label>
                <input type="number" name="stok" class="form-control" value="<%= (p!=null)?p.getStok():"" %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Kategori/Jenis</label>
                <select name="idjenis" class="form-select">
                    <%
                        for(Jenis j : new JenisDAO().getAll()){
                            String select = (p!=null && p.getIdjenis() == j.getId()) ? "selected" : "";
                            out.print("<option value='"+j.getId()+"' "+select+">"+j.getNama()+"</option>");
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
            <a href="index.jsp?halaman=produk" class="btn btn-secondary">Batal</a>
        </form>
    </div>
</div>