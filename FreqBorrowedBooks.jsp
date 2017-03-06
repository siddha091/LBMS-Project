<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Blob"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>PUBLIC LIBRARY SYSTEM</title>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><span>PUBLIC LIBRARY SYSTEM</center></span></h1>
		
	</div>
	<div id="menu">
		<ul id="main">
		<ul>
			<li class="current_page_item"><a href="AdminScreen.jsp">Home</a></li>
			<!--<li><a href="AddAuthor.jsp">Add Authors</a></li>-->			
            <li class="dropdown">
              <a href="#" class="dropbtn">ADD</a>
              <div class="dropdown-content">
				<a href="AddReader.jsp">Add Readers</a>
			    <a href="AddAuthor.jsp">Add Authors</a>
			    <a href="AddBook.jsp">Add Books</a>
			    <a href="AddPublisher.jsp">Add Publishers</a>
				<a href="AddLibBranch.jsp">Add Lib Branch</a>
             </div>
            </li>
			<li class="dropdown">
              <a href="#" class="dropbtn">View</a>
              <div class="dropdown-content">
				<a href="ViewLibBranch.jsp">Lib Branches</a>
				<a href="FinePerReader.jsp">AVG Fine Per Reader</a>
             </div>
			 <li class="dropdown">
              <a href="#" class="dropbtn">Top 10 Most Frequent</a>
              <div class="dropdown-content">
				<a href="FreqBorrowers.jsp">Borrowers in Branches</a>
				<a href="FreqBorrowedBooks1.jsp">Borrowed Books in Branch</a>
              </div>
            </li>
			<li><a href="AdminSearch.jsp">Book Search</a></li>
			<li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>
	
</div>
<div id="wrapper">
	<!-- start page -->
	<div id="page">
		
		<!-- start content -->
		<div id="content">
			
			<br/>
			<%
	String libid = request.getParameter("t1");
	if(libid != null){
	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");

	String res1="Top 10 most frequent borrowed books in a branch ";
		
		out.println("<center><font size=3 color=red>"+res1+" : "+libid+"</font></center>");
	}
	
	System.out.println("In PubBooks1.jsp Page"+session.getAttribute("libname"));
	String libname=session.getAttribute("libname").toString();
	String status="";
	
	try
		  		{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","library","library");

					Statement st=con.createStatement();

					//String keyword=session.getAttribute("keyword").toString();
					//System.out.println("In viewEducation.jsp Screen Page"+user);
					//String branch=(user.substring(0,3)).toUpperCase();
					//System.out.println("In viewEducation.jsp Screen Page Sub String : "+branch);

					ResultSet rs=st.executeQuery("select * from(select book_name,count(*)as counter from BOOK_CHECKOUT where lib_id='"+libid+"' group by book_name order by counter desc) where rownum<=10");

		%><br/><br/>
					<table border=1 align=center cellpadding="10">
						<tr><th>Reader Id</th><th>Avg Fine</th></tr>
		<%
			
					while(rs.next())
					{ 
		%>						
					    <tr><td><%=rs.getString(1)%></td>
					    <td><%=rs.getString(2)%></td>
					   </tr>
					    
		<%
		              }
					    st.close();
					    rs.close();
					    con.close(); %>
					    </table>
				<%	
				}
				catch(Exception e){}
				%> 

	<br/><br/>
	<!--<div class="flower"><center><img src="images/tra11.jpg" alt="" width="660" height="300" /></center></div>-->
			<br/><br/><br/><br/>
		<center>
		
			<table align="center">
			<tr>
			<h3>
			</p></h3>
			</table>
			</center><br />
			<div class="post">
				
				<div class="entry">
					
				</div>
			</div>
		</div>
		<!-- end content -->
		<!-- start sidebars -->
		
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
</body>
</html>


