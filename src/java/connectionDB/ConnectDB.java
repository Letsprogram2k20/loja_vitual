
package connectionDB;

import configuracoes.Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * Autor: João Paulo Zinga
 * Data: 01-01-2018
 * Objectivo: Neste classe encontram-se as funções para ligação e manipulação ma
 *              base de dados através do JDBC.
 * 
 */

public final class ConnectDB
{
    private String driverjdbc;
    private String local;
    private String porta;
    private String databaseName;
    private String user;
    private String password;
    
    private Connection connection;
    private Statement statment;
    PreparedStatement prepareStatement;
    private String strConnection;
     
    
    public ConnectDB() throws ClassNotFoundException, SQLException{
        this.driverjdbc = Config.DRIVER ;
        this.local = Config.HOST;
        this.porta = Config.PORT;
        this.databaseName = Config.DATABASE;
        this.user = Config.USER;
        this.password = Config.PASSWORD;
        this.conectar();
    }
    
    public ConnectDB(String driverjdbc, String local, String porta, String databaseName, String user, String password ) throws ClassNotFoundException, SQLException{
        this.driverjdbc = driverjdbc;
        this.local = local;
        this.porta = porta;
        this.databaseName = databaseName;
        this.user = user;
        this.password = password;
        this.conectar();
    }
    
    //Conexão com o Banco de Dados
    public void conectar() throws ClassNotFoundException, SQLException
    {
        try 
        {
            Class.forName("org.postgresql.Driver");
            this.connection = DriverManager.getConnection(driverjdbc + "://" + local + ":" + porta + "/" + databaseName, user, password);
            this.statment = (Statement) connection.createStatement();
            System.err.println("Sucesso na Conexão com a Base de Dados");
                    
        }catch (SQLException e) {
           System.err.println(e);
        } 
    }
 
    public void disconect()
    {
        try 
        {
            this.connection.close();
        }catch (SQLException ex) 
        {}
    }

    public int inserir() throws SQLException{
        return prepareStatement.executeUpdate();
    }
    
    public ResultSet consultar() throws SQLException{
        return prepareStatement.executeQuery();
    }
    
    public String getDriverjdbc() {
        return driverjdbc;
    }

    public void setDriverjdbc(String driverjdbc) {
        this.driverjdbc = driverjdbc;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public Statement getStatment() {
        return statment;
    }

    public void setStatment(Statement statment) {
        this.statment = statment;
    }

    public PreparedStatement getPrepareStatement() {
        return prepareStatement;
    }

    public void setPrepareStatement(String query) throws SQLException {
        this.prepareStatement = this.getConnection().prepareStatement(query);
    }

    public String getStrConnection() {
        return strConnection;
    }

    public void setStrConnection(String strConnection) {
        this.strConnection = strConnection;
    }

    public Object getPrepareStatemet() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getPorta()
    {
        return porta;
    }

    public void setPorta(String porta)
    {
        this.porta = porta;
    }

    public String getDatabaseName()
    {
        return databaseName;
    }

    public void setDatabaseName(String databaseName)
    {
        this.databaseName = databaseName;
    }
}
