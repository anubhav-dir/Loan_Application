
package connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javafiles.UserData;

public class registerDAO {
    
    public void register(UserData user) throws SQLException
    {
    
        String sql = "INSERT INTO users (email_id,first_name,middle_name,last_name,cource,city,pin_code,password) values (?,?,?,?,?,?,?,?)";
            
        Connection con = ConnectProvider.getCon();
    
        PreparedStatement st = con.prepareStatement(sql);

        st.setString(1, user.getEmail_id());            
        st.setString(2, user.getF_Name());
        st.setString(3, user.getM_Name());
        st.setString(4, user.getL_Name());
        st.setString(5, user.getCource());
        st.setString(6, user.getCity());
        st.setString(7, user.getPin_code());
        st.setString(8, user.getPassword());
            
        st.executeUpdate();
        
        
        
    }
    
}
