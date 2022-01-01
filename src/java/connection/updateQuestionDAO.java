
package connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javafiles.Questions;


public class updateQuestionDAO {
    
    public boolean update(String q_no, Questions question)
    {
        String sql = "UPDATE questions SET  sub_id = ?, question = ?, option_1 = ?, option_2 = ?, option_3 = ?, option_4 = ?, correct_ans = ? WHERE q_no = ? ";
        
        Connection con = ConnectProvider.getCon();
        
        try {
            PreparedStatement st = con.prepareStatement(sql);
        
            st.setString(1, question.getSub_id());
            st.setString(2, question.getQuestion());
            st.setString(3, question.getOption01());
            st.setString(4, question.getOption02());
            st.setString(5, question.getOption03());
            st.setString(6, question.getOption04());
            st.setString(7, question.getCorrect_ans());
            st.setString(8, q_no);
            
            st.executeUpdate();
            
        } catch (SQLException ex) {
            return false;
        }
        return true;
    
    }

}
