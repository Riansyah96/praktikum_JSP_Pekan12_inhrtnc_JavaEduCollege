<%@ page contentType="text/html" %>
<html>
<head>
    <title>Input Nilai Mahasiswa</title>
</head>
<body>
    <h2>Form Input Nilai Mahasiswa</h2>
    <form action="hasil_inputan_form.jsp" method="post">
        NIM : <input type="text" name="nim" /><br><br>
        Nama : <input type="text" name="nama" /><br><br>

        Prodi :
        <input type="radio" name="prodi" value="Informatika" checked> Teknik Informatika
        <input type="radio" name="prodi" value="Sistem Informasi"> Sistem Informasi
        <br><br>

        Mata Kuliah :
        <select name="matkul">
            <option value="Pemrograman Web">Pemrograman Web</option>
            <option value="Basis Data">Basis Data</option>
            <option value="PBO">PBO</option>
        </select><br><br>

        Nilai : <input type="number" name="nilai" /><br><br>

        <button type="submit">Simpan</button>
    </form>
</body>
</html>
