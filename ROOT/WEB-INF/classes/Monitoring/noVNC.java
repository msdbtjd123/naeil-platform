package Monitoring;
import java.sql.*;
import java.util.ArrayList;

public class noVNC {
	public String[] getUserList(String admin_code, String id) {

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		String driver = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/capstone_db";
		String uid = "capstone_admin";
		String upw = "Capstone!2#";
		ArrayList<String> temp = new ArrayList<>();

		String query = "select id from user_info where id <> '"+id+"' AND admin_code='"+admin_code+"'";
		try{
			Class.forName(driver);
			connection = DriverManager.getConnection(url, uid, upw);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);

			int i = 0;
			while(resultSet.next()){
				temp.add(resultSet.getString("id"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		//return temp;
		String[] id_list = new String[temp.size()];
		String[] id_list2 = new String[temp.size()];
		int size=0;
		for(String j : temp){
		  id_list[size++] = j;
		}
		return id_list;
	}
}
