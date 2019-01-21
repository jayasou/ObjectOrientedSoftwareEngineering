package EstablishmentLectureManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EstablishmentLecture {

	private int lectureNumber; // 강의번호
	private int managementSubNumber; // 운영과목번호
	private String subjectName; // 개설과목명
	private String lecturerName; // 강사이름 !!!
	private String lectureName; // 강의명 !!!
	private String classRoom; // 강의실 !!!

	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public EstablishmentLecture() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패e");
		}
	}

	/*
	 * //운영과목 public Subject getSubject() { return subject; } public void
	 * setSubject(Subject subject) { this.subject = subject; }
	 */
	// 강의번호 => 이건 입력받는건 아니지만 일단 get,set만듬 . 시스템 내부에서 정해줘야 할듭 , 아니면 삭제하거나
	public int getLectureNumber() {
		return lectureNumber;
	}

	public int getManagementSubNumber() {
		return managementSubNumber;
	}

	public void setManagementSubNumber(int managementSubNumber) {
		this.managementSubNumber = managementSubNumber;
	}

	public void setLectureNumber(int lectureNumber) {
		this.lectureNumber = lectureNumber;
	}

	// 개설과목명
	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	// 강사이름
	public String getLecturerName() {
		return lecturerName;
	}

	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}

	// 강의명
	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	// 강의실
	public String getClassRoom() {
		return classRoom;
	}

	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}

	public int subNameOfNumber(String sub_name) {
		int sub_num = 0;
		try {
			String query = "select managementSubNumber from managementsubject where managementSubName='" + sub_name + "'";
			rs = stmt.executeQuery(query);
		 
			while (rs.next())
			{
				sub_num = rs.getInt("managementSubNumber");
			}
		}
		catch (SQLException e) {e.printStackTrace(); }
		System.out.print("속에서 번호 : " + sub_num );

		
		return sub_num;
	}
	
	public void setEstablishmentLecture(int establish_lecture_num)
	{
		int managementSubNumber;
		String subjectName = "";
		String lecturerName = "";
		String lectureName = "";
		String classRoom = "";
		
		String query = "select * from lecture where lectureNumber ='" + establish_lecture_num + "'";
		try {
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				setLectureNumber(establish_lecture_num);
				
				managementSubNumber = rs.getInt("managementSubNumber");
				setManagementSubNumber(managementSubNumber);
				
				subjectName = rs.getString("subjectName");
				setSubjectName(subjectName);
				
				lecturerName = rs.getString("lecturerName");
				setLecturerName(lecturerName);
				
				lectureName = rs.getString("lectureName");
				setLectureName(lectureName);
				
				classRoom = rs.getString("classRoom");
				setClassRoom(classRoom);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
