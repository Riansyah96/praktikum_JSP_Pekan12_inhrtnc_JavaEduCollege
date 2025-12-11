<%@ page import="java.util.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String nim = request.getParameter("nim");
    String nama = request.getParameter("nama");
    String prodi = request.getParameter("prodi");
    String matkul = request.getParameter("matkul");
    int nilai = Integer.parseInt(request.getParameter("nilai"));

    // Ternary untuk Lulus/Gagal
    String status = (nilai >= 60) ? "Lulus" : "Gagal";

    // IF ELSE IF Grade
    String grade;
    if (nilai >= 85 && nilai <= 100) grade = "A";
    else if (nilai >= 75) grade = "B";
    else if (nilai >= 60) grade = "C";
    else if (nilai >= 30) grade = "D";
    else if (nilai >= 0) grade = "E";
    else grade = "-";

    // Switch Predikat
    String predikat;
    switch (grade) {
        case "A": predikat = "Istimewa"; break;
        case "B": predikat = "Baik"; break;
        case "C": predikat = "Cukup"; break;
        case "D": predikat = "Kurang"; break;
        default: predikat = "Buruk"; break;
    }

%>

<html>
<head>
    <title>Hasil Input Nilai</title>
</head>
<body>
    <h2>Data Nilai Mahasiswa</h2>

    <table border="1" cellpadding="10" cellspacing="0">
        <tr bgcolor="beige">
            <th>NIM</th>
            <th>Nama</th>
            <th>Prodi</th>
            <th>Mata Kuliah</th>
            <th>Nilai</th>
            <th>Status</th>
            <th>Grade</th>
            <th>Predikat</th>
        </tr>

        <tr bgcolor="khaki">
            <td><%= nim %></td>
            <td><%= nama %></td>
            <td><%= prodi %></td>
            <td><%= matkul %></td>
            <td><%= nilai %></td>
            <td><%= status %></td>
            <td><%= grade %></td>
            <td><%= predikat %></td>
        </tr>
    </table>

    <br>
    <a href="latihan_form.jsp">Kembali ke Form</a>

</body>
</html>
