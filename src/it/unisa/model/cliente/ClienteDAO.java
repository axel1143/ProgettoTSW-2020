package it.unisa.model.cliente;

import it.unisa.model.DriverManagerConnectionPool;
import it.unisa.model.prenotazione.PrenotazioneBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class ClienteDAO {

    //Ritorna una lista di tutti i clienti
    public static Collection<ClienteBean> allCustomer() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        ArrayList<ClienteBean> costumers = new ArrayList<ClienteBean>();
        String statement = "select * from Cliente";
        try{
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                ClienteBean bean = new ClienteBean();
                bean.setCodicefiscale(resultSet.getString("codice_fiscale"));
                bean.setNome(resultSet.getString("nome"));
                bean.setCognome(resultSet.getString("cognome"));
                bean.setDatanascita(resultSet.getString("data_di_nascita"));

                costumers.add(bean);
            }
            return costumers;

        } finally {
            try{
                if(preparedStatement != null) preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
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
    public static boolean addCostumer(String codice_fiscale, String nome, String cognome, String data_di_nascita) throws SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String statement = "INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES(?,?,?,?);" ;
        try{
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1,codice_fiscale);
            preparedStatement.setString(2,nome);
            preparedStatement.setString(3,cognome);
            preparedStatement.setString(4,data_di_nascita);
            preparedStatement.executeUpdate();
            connection.commit();

            return true;

        } finally {
            try{
                if(preparedStatement != null) preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
                }
            }
        }

    }
