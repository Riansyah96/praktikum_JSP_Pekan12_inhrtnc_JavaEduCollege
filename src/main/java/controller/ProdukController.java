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

    // Menangani Hapus (via URL link)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String aksi = request.getParameter("aksi");
        String id = request.getParameter("id");
        
        if ("hapus".equals(aksi) && id != null) {
            new ProdukDAO().hapus(Integer.parseInt(id));
        }
        // Redirect kembali ke index.jsp?halaman=produk sesuai sistem main.jsp Anda
        response.sendRedirect("index.jsp?halaman=produk");
    }

    // Menangani Simpan dan Update (via Form POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String aksi = request.getParameter("aksi");
        ProdukDAO dao = new ProdukDAO();
        
        try {
            Produk p = new Produk();
            p.setKode(request.getParameter("kode"));
            p.setNama(request.getParameter("nama"));
            p.setHarga(Double.parseDouble(request.getParameter("harga")));
            p.setStok(Integer.parseInt(request.getParameter("stok")));
            p.setIdjenis(Integer.parseInt(request.getParameter("idjenis")));

            if ("tambah".equals(aksi)) {
                dao.simpan(p);
            } else if ("ubah".equals(aksi)) {
                p.setId(Integer.parseInt(request.getParameter("id")));
                dao.ubah(p);
            }
        } catch (Exception e) { e.printStackTrace(); }
        
        response.sendRedirect("index.jsp?halaman=produk");
    }
}