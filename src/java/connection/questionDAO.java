
package connection;

import static connection.ConnectProvider.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafiles.Questions;

public class questionDAO {
    
        public ArrayList<Questions> getQuestion(String sub_id)
        {
            String sql = "select * from questions where sub_id = ? and status = 1";
            ArrayList<Questions> questionList = new ArrayList<Questions>();
            
            try {
                
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, sub_id);
                ResultSet rs = st.executeQuery();
            
                while(rs.next())
                {
    
                    Questions mcq = new Questions();
                
                    mcq.setQuestion(rs.getString(4)); 
                    mcq.setOption01(rs.getString(5)); 
                    mcq.setOption02(rs.getString(6)); 
                    mcq.setOption03(rs.getString(7)); 
                    mcq.setOption04(rs.getString(8)); 
                    mcq.setCorrect_ans(rs.getString(9)); 
            
                    questionList.add(mcq);
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(questionDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            return questionList;
        
        }

}
