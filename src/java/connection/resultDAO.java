
package connection;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class resultDAO {

    public boolean result(String user_id, String sub_id, int correct_ans, int wrong_ans, String status ) throws SQLException
    {
        Connection con = ConnectProvider.getCon();
        String sql = "insert into results (user_id, sub_id, correct_ans,wrong_ans,status) values (?,?,?,?,?)";
        
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user_id);
            st.setString(2, sub_id);
            st.setInt(3, correct_ans);
            st.setInt(4, wrong_ans);
            st.setString(5, status);
            out.print("<br><a href='home.jsp'> Home </a> <br>");
       
            st.executeUpdate();
    
        return true;
    
    }
    
}
