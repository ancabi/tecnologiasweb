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
       // response.setContentType("text/html;charset=UTF-8");
       // try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
              //get session of the request
        HttpSession session = request.getSession();
        
        List <Usuario> ul=uf.findAll();

        Usuario u=ul.get(3);
        
        session.setAttribute("usuario", u);

        String nombre = (String) request.getAttribute("nombreG");
        Grupo ultGrup = ufg.seleccionarGrupo();
        BigDecimal id = ultGrup.getId();
        id = id.add(new BigDecimal (1));

        
         if (nombre != null){
               Grupo g = new Grupo( id, nombre);
               ufg.create(g);
               request.setAttribute("grupo", g);
               ufg.setUsuario(u, g);
            }

        

        RequestDispatcher rd;

        rd = this.getServletContext().getRequestDispatcher("/CrearGrupoIntegrantes.jsp");
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
