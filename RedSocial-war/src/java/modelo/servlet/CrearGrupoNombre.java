/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.servlet;

import app.ejb.GrupoFacade;
import app.ejb.UsuarioFacade;
import app.entity.Grupo;
import app.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JoséMaría
 */
@WebServlet(name = "CrearGrupoNombre", urlPatterns = {"/CrearGrupoNombre"})
public class CrearGrupoNombre extends HttpServlet {

    @EJB
    private UsuarioFacade uf;
    @EJB
    private GrupoFacade ufg;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Usuario u = (Usuario) session.getAttribute("usuario");

        String nombre = (String) request.getParameter("nombreG");
        Grupo ultGrup = ufg.seleccionarGrupo();
        BigDecimal id = ultGrup.getId();
        id = id.add(new BigDecimal(1));

        //Debo utilizar otro objeto usuario, porque si utilizo el de session, salta un error de restriccion unica voilada
        Usuario u1 = uf.find(u.getId());

        if (nombre != null) {
            Grupo g = new Grupo(id, nombre);
            ufg.create(g);
            request.setAttribute("grupo", g);
            uf.setUsuario(u1, g);
        }

        RequestDispatcher rd;

        rd = this.getServletContext().getRequestDispatcher("/crearGrupo.jsp");
        rd.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
