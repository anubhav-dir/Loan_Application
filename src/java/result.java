
import connection.ConnectProvider;
import connection.questionDAO;
import connection.resultDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafiles.Questions;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class result extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            
            Connection con = ConnectProvider.getCon();
            String sub_id = request.getParameter("sub_id");
            questionDAO dao = new questionDAO();
            ArrayList<Questions> questions = dao.getQuestion(sub_id);
            resultDAO Rdao = new resultDAO();
            
            out.print("<br><a href='home.jsp'> Home </a> <br>");
            
            out.print(sub_id+ "<br>");
            int Q = 0;
            int  correct_ans = 0;
            int wrong_ans = 0;
            String status;
            String user = session.getAttribute("username").toString();
            for(Questions q:questions)
            {
                Q++;
                if(request.getParameter(String.valueOf(Q)).equals(q.getCorrect_ans()))
                {
                    correct_ans++;
                }
                else
                {
                    wrong_ans++;
                }
            }
            
            if(correct_ans > wrong_ans)
            {
                status = "P";
            }
            else
            {
                status = "F";
            }
            
            boolean result = Rdao.result(user ,sub_id, correct_ans, wrong_ans, status);
            if(result)
            {
                out.print("Total Questions " + Q + "<br>" );
                out.print("Correct Questions " + correct_ans + "<br>");
                out.print("Wrong Questions " + wrong_ans + "<br>");
                out.print("Status " + status + "<br>");
            }
            else
            {
                out.print("Error");
            }
                    
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(result.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(result.class.getName()).log(Level.SEVERE, null, ex);
        }
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
