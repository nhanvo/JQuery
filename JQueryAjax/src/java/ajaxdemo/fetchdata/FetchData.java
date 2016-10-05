/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ajaxdemo.fetchdata;

/**
 *
 * @author nhanvo
 */

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import ajaxdemo.pojo.Countries;

public class FetchData {
    private static Connection connection = null;
    @SuppressWarnings("CallToPrintStackTrace")
    public static Connection getConnection() {
        if (connection != null)
            return connection;
        else {
            try {
                Properties prop = new Properties();
                InputStream inputStream = FetchData.class.getClassLoader().getResourceAsStream("/db.properties");
                prop.load(inputStream);
                String driver = prop.getProperty("driver");
                String url = prop.getProperty("url");
                String user = prop.getProperty("user");
                String password = prop.getProperty("password");
                Class.forName(driver);
                connection = DriverManager.getConnection(url, user, password);
            } catch (ClassNotFoundException | SQLException | FileNotFoundException e) {
            } catch (IOException e) {
                e.printStackTrace();
            }
            return connection;
        }
    }
    
    @SuppressWarnings("CallToPrintStackTrace")
    public static ArrayList<Countries> getAllCountrieses() {
        connection = FetchData.getConnection();
        ArrayList<Countries> countryList = new ArrayList<Countries>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from country limit 10");
            
            while (rs.next()) {
                Countries country = new Countries();
                country.setCode(rs.getString("code"));
                country.setName(rs.getString("name"));
                country.setContinent(rs.getString("continent"));
                country.setRegion(rs.getString("region"));
                country.setPopulation(rs.getInt("population"));
                country.setCapital(rs.getString("capital"));
                
                countryList.add(country);
            } 
        }catch (SQLException e) {
            e.printStackTrace();
        }
        
        return countryList;
    }
}
