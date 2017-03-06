<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>PUBLIC LIBRARY SYSTEM</title>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<script language="javascript">
	function validate(formObj)
	{
	if(formObj.t1.value.length==0)
	{
	alert("Please Enter Employee Name");
	formObj.t1.focus();
	return false;
	}
	if(formObj.t2.value.length==0)
	{
	alert("Please Enter Contact No");
	formObj.t2.focus();
	return false;
	}
	if(formObj.t3.value.length==0)
	{
	alert("Please Enter Email ID");
	formObj.t3.focus();
	return false;
	}
	if(formObj.t4.value.length==0)
	{
	alert("Please Enter Qualification");
	formObj.t4.focus();
	return false;
	}
	if(formObj.t5.value.length==0)
	{
	alert("Please Enter Address");
	formObj.t5.focus();
	return false;
	}
	if(formObj.t8.value.length==0)
	{
	alert("Please Enter Username");
	formObj.t8.focus();
	return false;
	}
	if(formObj.t9.value.length==0)
	{
	alert("Please Enter Password");
	formObj.t9.focus();
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
		 <form name ="frm" method="post" action="AddBook" onsubmit="return validate(this);">
		<!-- start content -->
		<div id="content">
			<div class="flower"><center><h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Screen To Add Books<h1></div>
			<br/>
			<%
	String res = request.getParameter("t1");
	if(res != null){
	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		out.println("<center><font size=3 color=red>"+res+"</font></center>");
	}%>
	
			<br/>
		
		
<table align="right">
<tr><td><b>Book Title</b></td><td><input type="text" name="btitle" /></td></tr>
<tr><td><b>Book Author</b></td><td><input type="text" name="bauthor"/> </td></tr>
<tr><td><b>Book ISBN</b></td><td><input type="text" name="bisbn"/> </td></tr>
<tr><td><b>Book Pulisher</b></td><td><input type="text" name="bpublish"/> </td></tr>
<tr><td><b>Book Publication Date</b></td><td><input type="date" name="bpubdate"/> </td></tr>
<tr><td><b>Library to which book belongs</b></td><td><input type="text" name="blibid"/> </td></tr>
<tr><td></td><td><input type="submit" value="Add Book"></td>
</td></tr></table>
</form>
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


