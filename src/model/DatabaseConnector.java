package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnector {

	private static String DATABASE_NAME = "placement_cell_db";		//change the database name when database is changed 
	private static String DATABASE_USERNAME = "root";	//change the username when database is changed
	private static String DATABASE_PASSWORD = "9999";	//change the password when database is changed
	private static String DATABASE_URL = "jdbc:mysql://localhost/"+DATABASE_NAME;
	private static String DATABASE_CLASS = "com.mysql.jdbc.Driver";

	private static Connection mConnection = null;
	private static Object mResultSet = null;
	private static Statement mStatement = null;


	/*set the connection with database
	 * @return mConnection*/
	public static Connection getDatabaseConnection(){
		System.out.println("getDatabaseConnection Class");
		try{
			Class.forName(DATABASE_CLASS).newInstance();
			mConnection = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
		} catch(Exception e){
			e.printStackTrace();
		}
		return mConnection;
	}


	/*to send the query and get the resultSet
	 * @parameter String Query
	 * @parameter int option (insert or upload)
	 * @return ResultSet  */
	public static Object getResultSet(String query, int option){
		System.out.println("getDatabaseConnection Class");
		try{
			Class.forName(DATABASE_CLASS).newInstance();
			mConnection = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
			mStatement = mConnection.createStatement();
			if (option == 1)
				mResultSet = mStatement.executeQuery(query);
			else if (option == 0)
				mResultSet = mStatement.executeUpdate(query);
		}catch (Exception e ){
			e.printStackTrace();
		}
		return mResultSet;
	}

	//right after every connection with the database close the database
	public static void closeConnection() throws SQLException{
		if(!mConnection.isClosed()){
			mConnection.close();
		}
	}
}