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

tr:nth-child(even){/*background-color: #f2f2f2*/}

th {
    background-color: brown;
    color: white;
}
</style>

<script language="javascript">
	function validate(formObj)
	{
	if(formObj.t1.value.length==0)
	{
	alert("Please Enter User Name");
	formObj.t1.focus();
	return false;
	}
	if(formObj.t2.value.length==0)
	{
	alert("Please Enter Password");
	formObj.t2.focus();
	return false;
	}
	formObj.actionUpdateData.value="update";
	return true;
	}
	</script>
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
		 <form name ="frm" method="post" action="Checkout" onsubmit="return validate(this);">
		 <br/><br/><br/><br/>
		<!-- start content -->
		<div id="content">
			<div class="flower"><center><h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Book Checkout Screen<h1></div>
			<br/>
			<%
	String res = request.getParameter("t1");
	if(res != null){
	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		out.println("<center><font size=3 color=red>"+res+"</font></center>");
	}%>
	
	<%

	System.out.println("In Checkout.jsp Page"+session.getAttribute("rid"));
	String rid=session.getAttribute("rid").toString();
	String status="";
	
	try
		  		{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","library","library");

					Statement st=con.createStatement();

					ResultSet rs=st.executeQuery("select * from book ");

		%><br/><br/>
					<table border=1 align=center cellpadding="10">
						<tr><th>Book Id</th><th>Book Title</th><th>Book Author</th><th>Book ISBN</th><th>Book Publisher</th><th>Book_Publication_Date</th><th>Book Status</th><th>Library Id</th><th>Action</th></tr>
		<%
					while(rs.next())
					{ 
						status=rs.getString(7);
						
		%>						
					    <tr><td><%=rs.getString(1)%></td>
					    <td><%=rs.getString(2)%></td>
					    <td><%=rs.getString(3) %></td>
					    <td><%=rs.getString(4) %></td>
					    <td><%=rs.getString(5)%></td>
					    <td><%=rs.getString(6) %></td>
						<td><%=rs.getString(7)%></td>
					    <td><%=rs.getString(8) %></td>
						<%
							if(status.equalsIgnoreCase("available"))
							{
						%>
						<td><a href="Checkout?rid=<%=rid%>&bid=<%=rs.getString(1)%>&bname=<%=rs.getString(2)%>&bauthor=<%=rs.getString(3)%>&bpub=<%=rs.getString(5)%>&libid=<%=rs.getString(8)%>">Checkout</a>
				<!--<a href="RejectApp?t1=<%=rs.getString(2)%>&t2=<%=rs.getString(6)%>">Reject</a>--></td>

						<%
							}
							else
							{
						%>
							<td>Checkout</td>
						<%
							}	
						%>
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
				
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</form>
			</table>
			</center><br/><div class="post">
				
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


