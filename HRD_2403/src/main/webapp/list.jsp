<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='style.css'>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
<h2><b>회원목록조회/수정</b></h2>
<form>
<table border ='1'>
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>전화번호</td>
		<td>주소</td>
		<td>가입일자</td>
		<td>고객등급</td>
		<td>거주지역</td>
	</tr>
<%
String grade ="";
try {
	Class.forName("oracle.jdbc.OracleDriver"); //오라클 데이터베이스 드라이버 불러오기
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234"); //시스템 계정 연결
	Statement stmt = con.createStatement(); //SQL실행을 위한 stmt를 준비!!
	ResultSet rs = stmt.executeQuery("select * from member_tbl_02");
	while(rs.next()) {
		grade = rs.getString("grade");
		switch(grade) {
		case "A":
			grade = "VIP";
			break;
		case "B":
			grade = "일반";
			break;
		case "C":
			grade = "직원";
			break;
		}
%>
		<tr>
		<td><a href = "modify.jsp?custno"><%=rs.getString("custno") %></a></td>
		<td><%=rs.getString("custname") %></td>
		<td><%=rs.getString("phone") %></td>
		<td><%=rs.getString("address") %></td>
		<td><%=rs.getString("joindate") %></td>
		<td><%=grade%></td>
		<td><%=rs.getString("city") %></td>
	</tr>
<%
	}
	
} catch(Exception e) { //실패했을때 exception 예외처리 해줘야함.
	e.printStackTrace();
}


%>
	

</table>
</form>
</section>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>