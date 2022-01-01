
package connection;

import static connection.ConnectProvider.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafiles.UserData;


public class profileDAO {
    
    public UserData info(String user_id)
    {
        UserData user = new UserData();
        
        try {
            
            PreparedStatement st = con.prepareStatement("select * from users where user_id = ? ");
            st.setString(1, user_id);
            ResultSet rs = st.executeQuery();
            rs.next();
            
            user.setF_Name(rs.getString(3));
            user.setM_Name(rs.getString(4));
            user.setL_Name(rs.getString(5));
            user.setEmail_id(rs.getString(2));
            user.setCource(rs.getString(6));
            user.setCity(rs.getString(7));
            user.setPin_code(rs.getString(8));
            
            
        } catch (SQLException ex) {
            Logger.getLogger(profileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return user;
    
    }

}
