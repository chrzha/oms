package com.hotel.backend.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.mysql.jdbc.PreparedStatement;

public class JDBCTest {

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} 
	public static void main(String[] args) throws SQLException {

		java.sql.PreparedStatement preparedStatement = null;
		Connection connection = null;
		String schema = "ccr_140_dev_qa12533";
		String sql = "CREATE DATABASE  IF NOT EXISTS ?";
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ccr_140_dev_qa1" , "root", "root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.getMessage();
		}
		sql = sql.replace("?", schema);
		preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.execute();
        preparedStatement.close();
        connection.close();
        
	}

}
