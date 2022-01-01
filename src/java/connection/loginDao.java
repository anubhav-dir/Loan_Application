
package connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class loginDao {
    
    public String check(String uname,String pass) throws ClassNotFoundException, SQLException
    {

        Connection con = ConnectProvider.getCon();
           
        String sql = "select * from users where user_id=? and password=?";
        
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, uname);
        st.setString(2, pass);
        ResultSet rs = st.executeQuery();
        if(rs.next())
        {
           return rs.getString(3);
        }
            
        return null;
              

    }
    

    
}
