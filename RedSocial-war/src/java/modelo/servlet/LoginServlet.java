package modelo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correoLogin = request.getParameter("correoLogin");
        String contraseñaLogin = request.getParameter("contraseñaLogin");
//        String noCerrarSesion = request.getParameter("sesion");

        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String correoRegistro = request.getParameter("correoRegistro");
        String contraseñaRegistro = request.getParameter("contraseñaRegistro");
        String dia = request.getParameter("dia");
        String mes = request.getParameter("mes");
        String año = request.getParameter("año");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");

            if (correoLogin != null && contraseñaLogin != null) {
                out.println("<h1>" + correoLogin + "</h1>");
                out.println("<h1>" + contraseñaLogin + "</h1>");
            } else if (nombre != null && apellidos != null && correoRegistro != null && contraseñaRegistro != null && dia != null && mes != null && año != null) {
                out.println("<h1>" + nombre + "</h1>");
                out.println("<h1>" + apellidos + "</h1>");
                out.println("<h1>" + correoRegistro + "</h1>");
                out.println("<h1>" + contraseñaRegistro + "</h1>");
                out.println("<h1>" + dia + "</h1>");
                out.println("<h1>" + mes + "</h1>");
                out.println("<h1>" + año + "</h1>");
            }

            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
