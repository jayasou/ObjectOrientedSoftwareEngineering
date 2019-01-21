package Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginManagement {
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	public LoginManagement() {
		 try {
			 System.out.println("0");
	         Class.forName("com.mysql.jdbc.Driver");
	         System.out.println("1");
	         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root","1492");
	         System.out.println("2");
	         stmt = con.createStatement();
	         System.out.println("3");
	         System.out.println("디비연결성공");
	   
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	}

	public boolean login(Login login) {
		boolean student_qurry = false;
		boolean employee_qurry = false;

		String id = login.getId();
		String password = login.getPassword();

		try {
			String s_qurry = "select * from student where id='" + id + "' and password='" + password + "'";

			rs = stmt.executeQuery(s_qurry);
			if (rs.next()) {
				student_qurry = true;
			}

			String e_qurry = "select * from employee where id='" + id + "' and password='" + password + "'";

			rs = stmt.executeQuery(e_qurry);
			if (rs.next()) {
				employee_qurry = true;
			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		if (student_qurry == true || employee_qurry == true)
			return true;
		return false;
	}

	public String whoMember(Login login) {
		boolean student_qurry = false;
		String id = login.getId();
		String password = login.getPassword();

		try {
			String s_qurry = "select * from student where id='" + id + "' and password='" + password + "'";

			rs = stmt.executeQuery(s_qurry);
			if (rs.next()) {
				student_qurry = true;
			}
			
			else
				student_qurry = false;
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		if (student_qurry == true)
			return "STUDENT";

		return "EMPLOYEE";
	}
	
	public void test()
	{
		System.out.println("테스트");
	}
}
