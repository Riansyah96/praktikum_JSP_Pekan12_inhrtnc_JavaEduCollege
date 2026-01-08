<%
    int id = Integer.parseInt(request.getParameter("id"));
    ProdukDAO dao = new ProdukDAO();
    Produk p = dao.getById(id);
%>
<form action="ProdukController" method="POST">
    <input type="hidden" name="aksi" value="ubah">
    <input type="hidden" name="id" value="<%= p.getId() %>">
    
    <label>Kode Produk</label>
    <input type="text" name="kode" value="<%= p.getKode() %>" class="form-control">
    <button type="submit" class="btn btn-success mt-3">Update Data</button>
</form>