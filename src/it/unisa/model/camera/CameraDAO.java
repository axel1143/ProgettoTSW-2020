package it.unisa.model.camera;

import it.unisa.model.DriverManagerConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CameraDAO {
    public static ArrayList<Integer> getAllRoomsNumbersByType(String tipo) { //Recupera i numeri di tutte le camere (Implementabile anche da parte)
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selStatement = "select * from Camera where Camera.tipo = ?";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selStatement);
            preparedStatement.setString(1, tipo);
            ResultSet res = preparedStatement.executeQuery();
            ArrayList<Integer> numbers = new ArrayList<Integer>();
            while (res.next()) {
                numbers.add(res.getInt("numero"));
            }
            return numbers;
        }
        catch (SQLException sqlException){
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
        return null;
    }
    public static ArrayList<CameraBean> getAllRoomsByType(String tipo) { //Recupera i numeri di tutte le camere (Implementabile anche da parte)
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selStatement = "select * from Camera where Camera.tipo = ?";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selStatement);
            preparedStatement.setString(1, tipo);
            ResultSet res = preparedStatement.executeQuery();
            ArrayList<CameraBean> rooms = new ArrayList<CameraBean>();
            while (res.next()) {
                CameraBean bean = new CameraBean();
                bean.setNumero(res.getInt("numero"));
                bean.setNumero_letti(res.getInt("numero_letti"));
                bean.setTipo_camera(res.getString("tipo"));
                rooms.add(bean);
            }
            return rooms;
        }
        catch (SQLException sqlException){
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
        return null;
    }

    public static CameraBean getRoomByNumber(int numbers) { //Recupera i numeri di tutte le camere (Implementabile anche da parte
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selStatement = "select * from Camera where Camera.numero = ?";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selStatement);
            preparedStatement.setInt(1, numbers);
            ResultSet res = preparedStatement.executeQuery();
            CameraBean bean = new CameraBean();
            while (res.next())
            {
                bean.setNumero(res.getInt("numero"));
                bean.setNumero_letti(res.getInt("numero_letti"));
                bean.setTipo_camera(res.getString("tipo"));
            }
            return bean;
        }
        catch (SQLException sqlException){
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
        return null;
    }
}
