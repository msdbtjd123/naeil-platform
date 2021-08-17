package Learning;
import java.sql.*;
import java.util.ArrayList;

public class quiz {
	public String getQuiz(String id) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		String driver = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/capstone_db";
		String uid = "capstone_admin";
		String upw = "Capstone!2#";
		String file_path = "";

		String query = "select * from video_info where video_id='"+id+"'";
		try{
			Class.forName(driver);
			connection = DriverManager.getConnection(url, uid, upw);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);

			while(resultSet.next()){
				file_path = resultSet.getString("file_path");
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
		return file_path;
	}
}
