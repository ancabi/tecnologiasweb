package modelo.servlet;

import app.ejb.UsuarioFacade;
import app.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @EJB
    private UsuarioFacade uf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();

            String usuario = request.getParameter("usuarioL");
            String pass = request.getParameter("passL");

            boolean registrado = uf.usuarioRegistrado(usuario, pass);
            if (registrado) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Prueba</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>" + usuario + ": " + pass + "</h1>");
                out.println("</body>");
                out.println("</html>");
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Prueba</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Usuario no encontrado" + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }

//            Usuario user = (Usuario) session.getAttribute("usuario");
//            List<Usuario> amigos = user.getUsuarioList();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
