
import connection.addQuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javafiles.Questions;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class addQuestion extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Questions question = new Questions();
            addQuestionDAO dao = new addQuestionDAO();
            
            question.setSub_id(request.getParameter("sub_id")); 
            question.setQuestion(request.getParameter("question"));
            question.setOption01(request.getParameter("option01"));
            question.setOption02(request.getParameter("option02"));
            question.setOption03(request.getParameter("option03"));
            question.setOption04(request.getParameter("option04"));
            question.setCorrect_ans(request.getParameter("correct_ans"));
            
            boolean status = dao.add(question);
            
            if(status)
            {
                out.println("<script> alert('Question Added Successful')</script>");
                out.print("<a href=\"dashboard.jsp\"> Dashboard </a>");
            }
            else
            {
                out.println("<script> alert('Question Not Added')</script> ");
                out.print("<a href=\"dashboard.jsp\"> Dashboard </a>");
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
