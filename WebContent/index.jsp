<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>Student Schedule</TITLE>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">


</HEAD>

<BODY>
 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">TeamTAE</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
           
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


<div class="container">
<br><br><br><br>
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-body">
    <p>
    	<FORM action="/SchoolSchedule/Schedule" method="post">
		<b>Course Name: </b><INPUT type="text" class="form-control" name="title" size="35"><BR>
		<b>Course Time: </b>
		Sun <INPUT type="checkbox" name="day" value="sun">
		Mon <INPUT type="checkbox" name="day" value="mon"> 
		Tue <INPUT type="checkbox" name="day" value="tue"> 
		Wed <INPUT type="checkbox" name="day" value="wed"> 
		Thu <INPUT type="checkbox" name="day" value="thu"> 
		Fri <INPUT type="checkbox" name="day" value="fri"> 
		Sat 
		<INPUT type="checkbox" name="day" value="sat"> 
		
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
		</SELECT> <BR> <BR> 
		<INPUT class="btn btn-success" type="submit" name="Submit" value="Add Course"> 
		<button class="btn btn-info" type="button" onclick="document.getElementById('demo').innerHTML = Date()">Display Date and Time</button>
			
<br><br>

<div class="alert alert-info alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Info: </strong> <p id="demo"></p>
</div>

	</FORM>
	
    </p>
  </div>

  <!-- Table -->
  <TABLE class="table table-striped table-hover table-bordered" >
		<TBODY>
			<TR>
				<TH align="center" valign="middle" width="80"></TH>
				<TH align="center" valign="middle" width="100">Sunday</TH>
				<TH align="center" valign="middle">Monday</TH>
				<TH align="center" valign="middle">Tuesday</TH>
				<TH align="center" valign="middle">Wednesday</TH>
				<TH align="center" valign="middle">Thursday</TH>
				<TH align="center" valign="middle">Friday</TH>
				<TH align="center" valign="middle">Saturday</TH>
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
									test="${clazz.startTime <= time 
&& clazz.endTime > time 
&& clazz.day == day}">
									<c:out value="${clazz.title}" />
									
								</c:if>
								
								
							</c:forEach></TD>
					</c:forEach>
				</TR>
			</c:forEach>
		</TBODY>
	</TABLE>
</div>
	
</div>

	
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
</BODY>
</HTML>