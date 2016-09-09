<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>

<link rel="stylesheet" href="../css/bootstrap.min.css">         
<script src="../js/bootstrap.min.js"></script> 

<HEAD>
<TITLE>Student Schedule</TITLE>

<style>
body
{
margin: 25px;
background-color: #F8F1F3;
}
h1 {
    border-bottom: 5px solid #A1CAF1;
    font-family: "Lucida Console", Monospace;
    font-weight: bold;
    
}
.button {
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-family: "Lucida Console" Monospace; 
    font-size: 12px;
    margin: 4px 2px;
    cursor: pointer;
}
.button1{
    background-color: white;
    color: black;
    border: 2px solid #008CBA;
    border-radius: 15px;
    
}

tables{
    border-collapse: collapse;
    width: 100%;

    } 
    

th, td {
    text-align: center;
    vertical-align: center;
    border: 1px solid black;
    padding: 8px;
    border-radius: 5px;
    font-family: "Lucida Console", Monospace;
    
}
tr:nth-child(even){background-color: #ffa6ee;}
tr:hover{background-color:#e2faff;}
th{ background-color: #a6f4ff;}

p
{ 
font-family: "Lucida Console", Monospace;
font-size: 15px;
 background-color: #A1CAF1;
 padding-top: 40px;
 padding-right: 20px;
 padding-bottom: 40px;
 padding-left: 60px;
 border-radius: 10px;
}
</style>

</HEAD>

<BODY>
	<h1> Schedule </h1>
	<FORM action="/SchoolSchedule/Schedule" method="post">
	 <p>
		Subject Name:  <select name="title"><option>SonarQube</option> <option>Jenkins</option> <option>Ansible</option> 
		<option>Docker</option> <option>GIT</option> <option>TomCat</option>   
</select> <br><br>
		Subject Time: Sun<INPUT type="checkbox" name="day" value="sun">
		Mon<INPUT type="checkbox" name="day" value="mon"> Tue<INPUT
			type="checkbox" name="day" value="tue"> Wed<INPUT
			type="checkbox" name="day" value="wed"> Thu<INPUT
			type="checkbox" name="day" value="thu"> Fri<INPUT
			type="checkbox" name="day" value="fri"> Sat<INPUT
			type="checkbox" name="day" value="sat"> <br> <br>
			<SELECT name="starttime">
			<OPTION value="8">8:00am</OPTION>
			<OPTION value="9">9:00am</OPTION>
			<OPTION value="10">10:00am</OPTION>
			<OPTION value="11">11:00am</OPTION>
			<OPTION value="12">12:00pm</OPTION>
			<OPTION value="13">1:00pm</OPTION>
			<OPTION value="14">2:00pm</OPTION>
			<OPTION value="15">3:00pm</OPTION>
			<OPTION value="16">4:00pm</OPTION>
			<OPTION value="17">5:00pm</OPTION>
			<OPTION value="18">6:00pm</OPTION>
			<OPTION value="19">7:00pm</OPTION>
			<OPTION value="20">8:00pm</OPTION>
			<OPTION value="21">9:00pm</OPTION>
		</SELECT> to <SELECT name="endtime">
			<OPTION value="9">9:00am</OPTION>
			<OPTION value="10">10:00am</OPTION>
			<OPTION value="11">11:00am</OPTION>
			<OPTION value="12">12:00pm</OPTION>
			<OPTION value="13">1:00pm</OPTION>
			<OPTION value="14">2:00pm</OPTION>
			<OPTION value="15">3:00pm</OPTION>
			<OPTION value="16">4:00pm</OPTION>
			<OPTION value="17">5:00pm</OPTION>
			<OPTION value="18">6:00pm</OPTION>
			<OPTION value="19">7:00pm</OPTION>
			<OPTION value="20">8:00pm</OPTION>
			<OPTION value="21">9:00pm</OPTION>
			<OPTION value="22">10:00pm</OPTION>
		</SELECT> <BR> <BR> </p>
		<button class="button button1">Add Subject</button>
		 
			<BR><BR>
	</FORM>

	<TABLE id="table1" border="1" cellspacing="0">
		<TBODY>
			<TR>
				<TH></TH>
				<TH>Sunday</TH>
				<TH>Monday</TH>
				<TH>Tuesday</TH>
				<TH>Wednesday</TH>
				<TH>Thursday</TH>
				<TH>Friday</TH>
				<TH>Saturday</TH>
			</TR>
			<c:forEach begin="8" end="21" step="1" var="time">
				<TR>
					<TD align="center" valign="middle" width="80"><c:choose>
							<c:when test="${time == 12}">
								<c:out value="${time}" />:00pm
							</c:when>
							<c:when test="${time > 12}">
								<c:out value="${time - 12}" />:00pm
							</c:when>
							<c:otherwise>
								<c:out value="${time}" />:00am
							</c:otherwise>
						</c:choose></TD>
					      <c:forEach begin="0" end="6" step="1" var="day">
						  <TD align="center" valign="middle" width="100"><c:forEach
								items="${schoolschedule.classes}" var="clazz">
								<c:if
									test="${clazz.startTime <= time && clazz.endTime > time && clazz.day == day}">
									<c:out value="${clazz.title}" />
								</c:if>
							</c:forEach></TD>
					</c:forEach>
				</TR>
			</c:forEach>
		</TBODY>
	</TABLE>

<BR> 
</BODY>
</HTML>