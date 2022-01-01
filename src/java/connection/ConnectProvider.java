
package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public final class ConnectProvider {
    
    static Connection con;
    
    private ConnectProvider()
    {
    }
    
    public synchronized static Connection getCon()
    {
        if(con==null)
        {
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/qms?autoReconnect=true&useSSL=false","root","pass");
                
                return con;
                
            } catch (Exception ex) {
                
            }
        }
        else
        {
            return con;
        }
        
        return con;
        
    }

}
