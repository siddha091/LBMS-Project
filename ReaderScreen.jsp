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
	}%>
	<br/><br/>
	<div class="flower"><center><img src="images/tra11.jpg" alt="" width="660" height="300" /></center></div>
			<br/><br/><br/><br/>
		<center>
		
			<table align="center">
			<tr>
			<h3>
			</p></h3>
			</table>
			</center><br /><div class="post">
				
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


