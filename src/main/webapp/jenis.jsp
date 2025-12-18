<%@page import="java.sql.Connection"%>
<%@page import="dao.JenisDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Jenis"%>
<%
try {
    Class.forName("org.postgresql.Driver");
    //out.println("<b>Driver PostgreSQL TERLOAD</b><br>");
} catch (Exception e) {
    out.println("<b>Driver PostgreSQL TIDAK TERLOAD</b><br>");
}

    JenisDAO dao = new JenisDAO();
    List<Jenis> daftarJenis = dao.getAll();
%>

<h3>Data Produk</h3>
<table class="table table-striped">
<thead>
<tr>
    <th>No</th>
    <th>Nama</th>
</tr>
</thead>
<tbody>
<%
    int no = 1;
    for (Jenis j : daftarJenis) {
%>
<tr>
    <td><%= no++ %></td>
    <td><%= j.getNama() %></td>
</tr>
<%
    }
%>
</tbody>
</table>

