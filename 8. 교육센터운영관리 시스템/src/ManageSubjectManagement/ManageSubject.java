package ManageSubjectManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ManageSubject {
	private String employeeName;
	private String managementSubName;
	private String managementCenter;
	private String subjectDescription;
	private String goal;
	private String target;
	private String benefits;
	private String totalDuration;
	private String hours;
	private String capacity;
	private String tuition;
	private String lectureContents;
	private String openCheck;
	
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	public ManageSubject() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();
		} catch (Exception e) {
			System.out.println("db연결실패e");
		}
	}
	
	//getter
	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	
	public String getManagementSubName() {
		return managementSubName;
	}
	
	public String getManagementCenter() {
		return managementCenter;
	}
	
	public String getSubjectDescription() {
		return subjectDescription;
	}
	
	public String getGoal() {
		return goal;
	}
	
	public String getTarget() {
		return target;
	}
	
	public String getBenefits() {
		return benefits;
	}
	
	public String getTotalDuration() {
		return totalDuration;
	}
	
	public String getHours() {
		return hours;
	}
	
	public String getCapacity() {
		return capacity;
	}
	
	public String getTuition() {
		return tuition;
	}
	
	public String getLectureContents() {
		return lectureContents;
	}
	
	//setter
	public void setManagementSubName(String managementSubName) {
		this.managementSubName = managementSubName;
	}
	
	public void setManagementCenter(String managementCenter) {
		this.managementCenter = managementCenter;
	}
	
	public void setSubjectDescription(String subjectDescription) {
		this.subjectDescription=subjectDescription;
	}
	
	public void setGoal(String goal) {
		this.goal = goal;
	}
	
	public void setTarget(String target) {
		this.target = target;
	}
	
	public void setBenefits(String benefits) {
		this.benefits = benefits;
	}
	
	public void setTotalDuration(String totalDuration) {
		this.totalDuration = totalDuration;
	}
	
	public void setHours(String hours) {
		this.hours = hours;
	}
	
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	
	public void setTuition(String tuition) {
		this.tuition = tuition;
	}
	
	public void setLectureContents(String lectureContents) {
		this.lectureContents = lectureContents;
	}
	
	public String getOpenCheck() {
		return openCheck;
	}

	public void setOpenCheck(String openCheck) {
		this.openCheck = openCheck;
	}

	public void setManageSubject(int managementSubNum) {
		String employeeName;
		String managementSubName = "";
		String managementCenter = "";
		String subjectDescription = "";
		String goal = "";
		String target = "";
		String benefits = "";
		String totalDuration = "";
		String hours = "";
		String capacity = "";
		String tuition = "";
		String lectureContents = "";
		String openCheck = "";
		
		String query = "select * from managementsubject where managementSubNumber ='" + managementSubNum + "'";
		try {
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				employeeName = rs.getString("employeeName");
				setEmployeeName(employeeName);
				
				managementSubName = rs.getString("managementSubName");
				setManagementSubName(managementSubName);
				
				managementCenter = rs.getString("managementCenter");
				setManagementCenter(managementCenter);
				
				subjectDescription = rs.getString("subjectDescription");
				setSubjectDescription(subjectDescription);
				
				goal = rs.getString("goal");
				setGoal(goal);
				
				target = rs.getString("target");
				setTarget(target);
				
				benefits = rs.getString("benefits");
				setBenefits(benefits);
				
				totalDuration = rs.getString("totalDuration");
				setTotalDuration(totalDuration);
				
				hours = rs.getString("hours");
				setHours(hours);
				
				capacity = rs.getString("capacity");
				setCapacity(capacity);
				
				tuition = rs.getString("tuition");
				setTuition(tuition);
				
				lectureContents = rs.getString("lectureContents");
				setLectureContents(lectureContents);
				
				openCheck = rs.getString("openCheck");
				setOpenCheck(openCheck);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
