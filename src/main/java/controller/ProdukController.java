package controller;

import dao.ProdukDAO;
import model.Produk;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProdukController", urlPatterns = {"/ProdukController"})
public class ProdukController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String aksi = request.getParameter("aksi");
        
        if (aksi != null && aksi.equals("tambah")) {
            try {
                // Mengambil input dari form tambah_produk.jsp
                String kode = request.getParameter("kode");
                String nama = request.getParameter("nama");
                double harga = Double.parseDouble(request.getParameter("harga"));
                int stok = Integer.parseInt(request.getParameter("stok"));
                int idjenis = Integer.parseInt(request.getParameter("idjenis"));

                Produk p = new Produk();
                p.setKode(kode);
                p.setNama(nama);
                p.setHarga(harga);
                p.setStok(stok);
                p.setIdjenis(idjenis);

                ProdukDAO dao = new ProdukDAO();
                dao.simpan(p);

                // Setelah berhasil, arahkan kembali ke tabel produk
                response.sendRedirect("index.jsp?halaman=produk");
                
            } catch (Exception e) {
                System.out.println("Error di ProdukController: " + e.getMessage());
                response.sendRedirect("index.jsp?halaman=produk");
            }
        }
    }
}