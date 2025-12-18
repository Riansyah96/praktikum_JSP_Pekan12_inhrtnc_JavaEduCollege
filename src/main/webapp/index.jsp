<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="id">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Praktikum JSP - JDBC & DAO</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12"><%@ include file="header.jsp" %></div>
            </div>
            <div class="row">
                <div class="col-md-12"><%@ include file="menu.jsp" %></div>
            </div>
            <br/>
            <div class="row">
                <div class="col-md-8">
                    <%
                        String hal = request.getParameter("halaman");
                        if (hal == null || hal.equals("home")) {
                    %>
                    <jsp:include page="main.jsp" />
                    <%
                    } else if (hal.equals("produk")) {
                    %>
                    <jsp:include page="produk.jsp" />
                    <%
                    } else if (hal.equals("tambah_produk")) { // TAMBAHKAN BLOK INI
                    %>
                    <jsp:include page="tambah_produk.jsp" />
                    <%
                    } else if (hal.equals("jenis")) {
                    %>
                    <jsp:include page="jenis.jsp" />
                    <%
                    } else {
                    %>
                    <jsp:include page="main.jsp" />
                    <%
                        }
                    %>
                </div>
                <div class="col-md-4"><%@ include file="sidebar.jsp" %></div>
            </div>
            <br/>
            <div class="row">
                <div class="col-md-12"><%@ include file="footer.jsp" %></div>
            </div>
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>