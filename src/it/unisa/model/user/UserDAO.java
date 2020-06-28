package it.unisa.model.user;

import it.unisa.model.DriverManagerConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class UserDAO {

    //Aggiunge un utente con privilegi standard
    public static boolean addStandardUser(UserBean bean) throws SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String statement = "insert into Utente(email,password,codice_fiscale,is_admin) VALUES (?,?,?,?)";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1,bean.getEmail());
            preparedStatement.setString(2,bean.getPassword());
            preparedStatement.setString(3,bean.getCodicefiscale());
            preparedStatement.setBoolean(4,bean.isAdmin());

            preparedStatement.executeUpdate();
            connection.commit();

            return true;
        }finally {
            try{
                if(preparedStatement != null) preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }
    public static boolean removeUser(String codice_fiscale){
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String statement = "DELETE from Utente where codice_fiscale = ?";
        try{
            connection = DriverManagerConnectionPool.getConnection();

            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1,codice_fiscale);
            preparedStatement.executeUpdate();
            connection.commit();
            preparedStatement.close();
            return true;
        }catch (SQLException sqlException){
            sqlException.printStackTrace();
        }
        finally {
            try{
                if(preparedStatement != null) preparedStatement.close();
                DriverManagerConnectionPool.releaseConnection(connection);
            }catch (SQLException sqlException){
                sqlException.printStackTrace();
            }
        }
        return false;
    }

    // Controlla se il cliente con il parametro specificato è registrato
    public static boolean isAlreadyUserEmail(String email){
        UserBean userBean = getUserByMail(email);
        if(userBean == null) return false;
        else return true;
    }
    public static boolean isAlreadyUserCF(String codice_fiscale){
        UserBean userBean = getUserByCF(codice_fiscale);
        if(userBean == null) return false;
        else return true;
    }

    public static UserBean getUserByMail(String email){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        UserBean user = null;

        String statement = "SELECT * from Utente WHERE email = ?;";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1,email);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                user = new UserBean();
                user.setCodicefiscale(resultSet.getString("codice_fiscale"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setAdmin(resultSet.getBoolean("is_admin"));
            }

            return  user;
        } catch (SQLException sqlException){
            sqlException.printStackTrace();
        }
        finally{
            try{
                if(preparedStatement != null) preparedStatement.close();
                DriverManagerConnectionPool.releaseConnection(connection);
            } catch (SQLException sqlException){
                sqlException.printStackTrace();
            }
        }
        return null;
    }

    public static UserBean getUserByCF(String cf){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        UserBean user = null;

        String statement = "SELECT * from Utente WHERE codice_fiscale = ?;";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1,cf);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                user = new UserBean();
                user.setCodicefiscale(resultSet.getString("codice_fiscale"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setAdmin(resultSet.getBoolean("is_admin"));
            }

            return  user;
        } catch (SQLException sqlException){
            sqlException.printStackTrace();
        }
        finally{
            try{
                if(preparedStatement != null) preparedStatement.close();
                DriverManagerConnectionPool.releaseConnection(connection);
            } catch (SQLException sqlException){
                sqlException.printStackTrace();
            }
        }
        return null;
    }
    //Ritorna la lista di tutti gli utenti
    public static Collection<UserBean> allUsers() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ArrayList<UserBean> usersList = new ArrayList<UserBean>();

        String statement = "SELECT * from Utente ;";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                UserBean user = new UserBean();
                user.setCodicefiscale(resultSet.getString("codice_fiscale"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setAdmin(resultSet.getBoolean("is_admin"));

                usersList.add(user);
            }

            return  usersList;

        }catch (SQLException sqlException){
            sqlException.printStackTrace();
        }
        finally {
            try{
                if(preparedStatement != null) preparedStatement.close();
                DriverManagerConnectionPool.releaseConnection(connection);
            }
            catch (SQLException sqlException){
                sqlException.printStackTrace();
            }
        }
        return null;
    }
}
