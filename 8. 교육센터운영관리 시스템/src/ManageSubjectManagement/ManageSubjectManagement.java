package ManageSubjectManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sun.org.apache.regexp.internal.recompile;

public class ManageSubjectManagement {
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public ManageSubjectManagement() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();
			System.out.println("디비연결성공");

		} catch (Exception e) {
			System.out.println("db 연결실패e");
		}
	}

	public void regManageSubjectInfo(ManageSubject manageSubject) {

		String employeeName = manageSubject.getEmployeeName();
		String managementSubName = manageSubject.getManagementSubName();
		String managementCenter = manageSubject.getManagementCenter();
		String subjectDescription = manageSubject.getSubjectDescription();
		String goal = manageSubject.getGoal();
		String target = manageSubject.getTarget();
		String benefits = manageSubject.getBenefits();
		String totalDuration = manageSubject.getTotalDuration();
		String hours = manageSubject.getHours();
		String capacity = manageSubject.getCapacity();
		String tuition = manageSubject.getTuition();
		String lectureContents = manageSubject.getLectureContents();
		String openCheck = manageSubject.getOpenCheck();
		
		String query = "insert into educationsentermanagementsystem.managementsubject (employeeName, managementSubName, managementCenter, subjectDescription, goal, target, benefits, totalDuration, hours, capacity, tuition, lectureContents, openCheck) values ('"
				+ employeeName + "', '" + managementSubName + "', '" + managementCenter + "', '" + subjectDescription
				+ "', '" + goal + "', '" + target + "', '" + benefits + "', '" + totalDuration + "', '" + hours + "', '"
				+ capacity + "', '" + tuition + "', '" + lectureContents + "', '" + openCheck + "')";
		try {
			stmt.executeUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ResultSet inqurieManagementSubject() {
		try {
			String query = "select managementSubNumber, managementSubName, managementCenter, openCheck, employeeName from managementsubject";
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rs;
	}

	public void delManagementSubject(String del_index) {
		int managementSubNumber = Integer.parseInt(del_index);
		String qurry = "delete from educationsentermanagementsystem.managementsubject where managementSubNumber='"
				+ managementSubNumber + "'";
		try {
			stmt.executeUpdate(qurry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateManageSubjectInfo(String managementSubNum_str, ManageSubject manageSubject) {
		
		int managementSubNum = Integer.parseInt(managementSubNum_str);
		String employeeName = manageSubject.getEmployeeName();
		String managementSubName = manageSubject.getManagementSubName();
		String managementCenter = manageSubject.getManagementCenter();
		String subjectDescription = manageSubject.getSubjectDescription();
		String goal = manageSubject.getGoal();
		String target = manageSubject.getTarget();
		String benefits = manageSubject.getBenefits();
		String totalDuration = manageSubject.getTotalDuration();
		String hours = manageSubject.getHours();
		String capacity = manageSubject.getCapacity();
		String tuition = manageSubject.getTuition();
		String lectureContents = manageSubject.getLectureContents();
		String openCheck = manageSubject.getOpenCheck();
		try{
		String query = "update educationsentermanagementsystem.managementsubject set employeeName='" + employeeName
				+ "', managementSubName='" + managementSubName + "', managementCenter='" + managementCenter
				+ "', subjectDescription='" + subjectDescription + "', goal='" + goal + "', target='" + target
				+ "', benefits='" + benefits + "', totalDuration='" + totalDuration + "', hours='" + hours
				+ "', capacity='" + capacity + "', tuition='" + tuition + "', lectureContents='" + lectureContents
				+ "', openCheck='" + openCheck + "' where managementSubNumber='" + managementSubNum + "'";
		
			stmt.executeUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
