package it.unisa.model.prenotazione;

import it.unisa.model.DriverManagerConnectionPool;

import java.io.Serializable;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class PrenotazioneModelDM{

    public static Collection<PrenotazioneBean> doRetriveByName(String nome, String cognome) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        PrenotazioneBean bean = new PrenotazioneBean();
        ArrayList<PrenotazioneBean> prenotazioneBeans = new ArrayList<PrenotazioneBean>();
        String statement = "SELECT prenotazione.* FROM prenotazione, cliente WHERE cliente.nome = ? and cliente.cognome = ? and cliente.codice_fiscale = prenotazione.codice_fiscale;";

        try{
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, nome);
            preparedStatement.setString(2, cognome);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                bean.setCodice_fiscale(resultSet.getString("codice_fiscale"));
                bean.setNumero(resultSet.getInt("numero"));
                bean.setCheck_in(resultSet.getTimestamp("check_in"));
                bean.setCheck_out(resultSet.getTimestamp("check_out"));

                prenotazioneBeans.add(bean);
            }

        } finally {
            try{
                if(preparedStatement != null) preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return prenotazioneBeans;
    }


    public static boolean validate(String check_in, String check_out, String tipo) throws SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        ArrayList<PrenotazioneBean> prenotazioneBeans = new ArrayList<PrenotazioneBean>();
        PrenotazioneBean prenotazioneBean = new PrenotazioneBean();
        //String statement = "SELECT prenotazione.* from prenotazione,camera WHERE (check_in between ? and ?) and (check_out between ? and ?) and (prenotazione.numero = camera.numero) and camera.tipo = ?";
        String statement = "SELECT prenotazione.* from prenotazione,camera where camera.numero = prenotazione.numero and camera.tipo = ?;";
        try{
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, tipo);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                prenotazioneBean.setNumero(resultSet.getInt("numero"));
                prenotazioneBean.setCodice_fiscale(resultSet.getString("codice_fiscale"));
                prenotazioneBean.setCheck_out(resultSet.getTimestamp("check_out"));
                prenotazioneBean.setCheck_in(resultSet.getTimestamp("check_in"));

                prenotazioneBeans.add(prenotazioneBean);
            }
            if (prenotazioneBeans.size() <2 && tipo.equals("suite")) return true;
            else if(prenotazioneBeans.size() <5 && tipo.equals("superior")) return true;
            else if(prenotazioneBeans.size() <10 && tipo.equals("standard")) return true;

            for(PrenotazioneBean bean : prenotazioneBeans){
                Timestamp bcheckin = bean.getCheck_in();
                Timestamp bcheckout = bean.getCheck_out();

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                Date parsedDate1 = dateFormat.parse(check_in);
                Timestamp timestampCheckin = new Timestamp(parsedDate1.getTime());

                Date parsedDate2 = dateFormat.parse(check_out);
                Timestamp timestampCheckout = new Timestamp(parsedDate2.getTime());

                if((timestampCheckout.after(bcheckin) && timestampCheckout.before(bcheckout)) || (timestampCheckin.after(bcheckin) && timestampCheckin.before(bcheckout))) return false;
                if(timestampCheckin.before(bcheckin) && timestampCheckout.after(bcheckout)) return false;

            }
             return true;
        }catch (ParseException e){
            e.printStackTrace();
        }
        finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return false;
    }
    public static int getFirstFreeByType(String tipo) throws SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selStatement = "select camera.numero from camera where camera.tipo = ? and not exists ( select prenotazione.* from prenotazione where camera.numero = prenotazione.numero);";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selStatement);
            preparedStatement.setString(1,tipo);
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()){
                return res.getInt("numero");
            }

            return -1;
        }finally {
            try{
                if(preparedStatement != null) preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }
    public static boolean addReservation(String codice_fiscale,String check_in, String check_out, String tipo) throws SQLException{
        if(!PrenotazioneModelDM.validate(check_in,check_out,tipo)) return false;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        PreparedStatement preparedStatement1 = null;
        String statement = "INSERT INTO prenotazione(codice_fiscale, numero, check_in, check_out) VALUES (?,?,?,?);";

        try{
            connection = DriverManagerConnectionPool.getConnection();

            preparedStatement = connection.prepareStatement(statement);
            int numRoom = PrenotazioneModelDM.getFirstFreeByType(tipo);
            System.out.println(numRoom);
            preparedStatement.setString(1,codice_fiscale);
            preparedStatement.setInt(2,numRoom);
            preparedStatement.setString(3,check_in);
            preparedStatement.setString(4,check_out);

            preparedStatement.executeUpdate();
            connection.commit();
            preparedStatement.close();
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
