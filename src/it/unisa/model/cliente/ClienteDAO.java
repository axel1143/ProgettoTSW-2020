package it.unisa.model.cliente;

import it.unisa.model.DriverManagerConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class ClienteDAO {

    public static ClienteBean getCostumerByCF(String cf) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        ClienteBean bean = new ClienteBean();
        String statement = "select * from Cliente where codice_fiscale = ?";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);

            preparedStatement.setString(1,cf);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                bean.setCodicefiscale(resultSet.getString("codice_fiscale"));
                bean.setNome(resultSet.getString("nome"));
                bean.setCognome(resultSet.getString("cognome"));
                bean.setDatanascita(resultSet.getString("data_di_nascita"));

            }

            preparedStatement.close();
            return bean;
        } catch (SQLException sql) {
            sql.printStackTrace();
        } finally {
            try {
                DriverManagerConnectionPool.releaseConnection(connection);
            } catch (SQLException sqlException) {
                sqlException.printStackTrace();
            }
        }
        return null;
    }

    //Ritorna una lista di tutti i clienti
    public static Collection<ClienteBean> allCustomer() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        ArrayList<ClienteBean> costumers = new ArrayList<ClienteBean>();
        String statement = "select * from Cliente";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ClienteBean bean = new ClienteBean();
                bean.setCodicefiscale(resultSet.getString("codice_fiscale"));
                bean.setNome(resultSet.getString("nome"));
                bean.setCognome(resultSet.getString("cognome"));
                bean.setDatanascita(resultSet.getString("data_di_nascita"));

                costumers.add(bean);
            }
            DriverManagerConnectionPool.releaseConnection(connection);
            preparedStatement.close();
            return costumers;
        } catch (SQLException sql) {
            sql.printStackTrace();
        } finally {
            try {
                DriverManagerConnectionPool.releaseConnection(connection);
            } catch (SQLException sqlException) {
                sqlException.printStackTrace();
            }
        }
        return null;
    }

    public static boolean removeCustomer(String codice_fiscale){
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String statement = "DELETE from Cliente where codice_fiscale= ?";
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


    //Controlla se un dato codice_fiscale corrisponde ad un cliente
    public static boolean isCustomer(String codice_fiscale) throws SQLException{
        ArrayList<ClienteBean> customers = (ArrayList<ClienteBean>) ClienteDAO.allCustomer();
        for(ClienteBean bean : customers){
            if(bean.getCodicefiscale().equals(codice_fiscale)) return true;
        }
        return false;
    }


    //Aggiunge un cliente al database -- NECESSARIA UNA PRENOTAZIONE ->PrenoatzioneDAO
    public static void addCostumer(ClienteBean bean) throws SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String statement = "INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES(?,?,?,?);" ;
        try{
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1,bean.getCodicefiscale());
            preparedStatement.setString(2,bean.getNome());
            preparedStatement.setString(3,bean.getCognome());
            preparedStatement.setString(4,bean.getDatanascita());
            preparedStatement.executeUpdate();
            connection.commit();

        } finally {
            try{
                if(preparedStatement != null) preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
                }
            }
        }

    }
