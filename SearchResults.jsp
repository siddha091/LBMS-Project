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
	align:right;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){/*background-color: #f2f2f2*/}

th {
    background-color: brown;
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
			<li class="current_page_item"><a href="ReaderScreen.jsp">Home</a></li>
			<!--<li><a href="AddAuthor.jsp">Add Authors</a></li>-->			
            <li class="dropdown">
              <a href="#" class="dropbtn">BOOK</a>
              <div class="dropdown-content">
				<a href="Search.jsp">Book Search</a>
			    <a href="Checkout.jsp">Book Checkout</a>
			    <a href="Return.jsp">Book Return</a>
			    <a href="Reserve.jsp">Book Reserve</a>
             </div>
            </li>
			<li><a href="ReservedBooks.jsp">Books Reserved</a></li>
			<li><a href="PubBooks.jsp">Show Books Publisherwise</a></li>
			<li><a href="Logout.jsp">Logout</a></li>
		</ul>		
	</div>
	
</div>
<div id="wrapper">
	<!-- start page -->
	<div id="page">
		
		<!-- start content -->
		<div id="content">
			
			<br/><%
	String res = request.getParameter("t1");
	if(res != null){
	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		out.println("<center><font size=3 color=red>"+res+"</font></center>");
	}
	
	//System.out.println("Entered Search String : "+searchkeyword);

	System.out.println("In SearchResults.jsp Page"+session.getAttribute("keyword"));
	
	try
		  		{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","library","library");

					Statement st=con.createStatement();

					String keyword=session.getAttribute("keyword").toString();
					//System.out.println("In viewEducation.jsp Screen Page"+user);
					//String branch=(user.substring(0,3)).toUpperCase();
					//System.out.println("In viewEducation.jsp Screen Page Sub String : "+branch);

					ResultSet rs=st.executeQuery("select * from book where book_id like '%"+keyword+"%'");

		%><br/><br/>
					<table border="1" align="center" cellpadding="10">
						<tr><th>Book Id</th><th>Book Title</th><th>Book Author</th><th>Book ISBN</th><th>Book Publisher</th><th>Book_Publication_Date</th><th>Book Status</th><th>Lib Id</th></tr>
		<%
			
					while(rs.next())
					{ 
					   System.out.println("in while");
					   //String atch=rs.getString(5);
					   //session.setAttribute("atch",atch);
		%>						
					    <tr><td><%=rs.getString(1)%></td>
					    <td><%=rs.getString(2)%></td>
					    <td><%=rs.getString(3) %></td>
					    <td><%=rs.getString(4) %></td>
					    <td><%=rs.getString(5)%></td>
					    <td><%=rs.getString(6) %></td>
						<td><%=rs.getString(7) %></td>
						<td><%=rs.getString(8) %></td>
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


