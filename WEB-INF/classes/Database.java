package com;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.sql.Statement;
import java.util.ArrayList;
import java.io.FileWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Database{
    private static Connection con;
	
public static Connection getCon()throws Exception {
   try{
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","library","library");
     
	}catch(Exception e){
		e.printStackTrace();
	}
	return con;
}

public static String addReader(String[] input)throws Exception{
    String msg="fail";
    boolean flag=false;
    con = getCon();
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select reader_email from reader where reader_email='"+input[2]+"'");
    if(rs.next()){
        flag=true;
        msg = "Reader with this Email already exist";
    }
    if(!flag){
		/*
		int myId=0;
		String sqlIdentifier = "select READERSEQ.NEXTVAL from dual";
        Statement pst = con.createStatement();
        ResultSet rs1 = pst.execute(sqlIdentifier);
        if(rs.next())
		   myId = rs1.getInt(1);
		System.out.println("Reader Id : "+myId);
        String rid=Integer.toString(myId);*/
		String QUERY = "INSERT INTO reader "+
               "  VALUES ('RD'||READERSEQ.NEXTVAL,"+
               "  ?,?,?,?,?,?)";
		PreparedStatement stat=con.prepareStatement(QUERY,new String[] { "READER_ID" });
		String readerId = null;
		stat.setString(1,input[0]);
		stat.setString(2,input[4]);
		stat.setString(3,input[1]);
		stat.setString(4,input[2]);
		stat.setString(5,input[3]);
		stat.setString(6,input[5]);
		int i=stat.executeUpdate();
		if(i > 0){
			ResultSet generatedKeys = stat.getGeneratedKeys();
			if (null != generatedKeys && generatedKeys.next()) 
			{
             readerId = generatedKeys.getString(1);
            }
			msg = "Reader added with Id : "+readerId;
		}
    }
    return msg;
}

public static String addAuthor(String[] input)throws Exception{
    String msg="fail";
    boolean flag=false;
    con = getCon();
	Statement stmt1=con.createStatement();
    ResultSet rs1=stmt1.executeQuery("select author_email from author where author_email='"+input[1]+"'");
    if(rs1.next()){
        flag=true;
        msg = "Author with this Email already exist";
    }
    if(!flag){
		String QUERY1 = "INSERT INTO AUTHOR "+
               "  VALUES ('AU'||AUTHORSEQ.NEXTVAL,"+
               "  ?,?,?)";
		PreparedStatement stat1=con.prepareStatement(QUERY1,new String[] { "AUTHOR_ID" });
		String authorId = null;
		stat1.setString(1,input[0]);
		stat1.setString(2,input[1]);
		stat1.setString(3,input[2]);
		int i=stat1.executeUpdate();
		if(i > 0){
			ResultSet generatedKeys1 = stat1.getGeneratedKeys();
			if (null != generatedKeys1 && generatedKeys1.next()) 
			{
             authorId = generatedKeys1.getString(1);
            }
			msg = "Author added with Id : "+authorId;
		}
    }
    return msg;
}

public static String addBook(String[] input)throws Exception{
    String msg="fail";
    boolean flag=false;
    con = getCon();
	Statement stmt2=con.createStatement();
	DateFormat formatter ; 
    formatter = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date date=formatter.parse(input[4]);
	java.sql.Date mySqlDate = new java.sql.Date(date.getTime());
    ResultSet rs2=stmt2.executeQuery("select book_isbn from book where book_isbn='"+input[2]+"'");
    if(rs2.next()){
        flag=true;
        msg = "Book with this ISBN already exist";
    }
    if(!flag){
		String QUERY2 = "INSERT INTO book "+
               "  VALUES ('BK'||BOOKSEQ.NEXTVAL,"+
               "  ?,?,?,?,?,?,?)";
		PreparedStatement stat2=con.prepareStatement(QUERY2,new String[] { "BOOK_ID" });
		String bookId = null;
		stat2.setString(1,input[0]);
		stat2.setString(2,input[1]);
		stat2.setString(3,input[2]);
		stat2.setString(4,input[3]);
		stat2.setDate(5,mySqlDate);
		stat2.setString(6,"Available");
		stat2.setString(7,input[5]);
		int i=stat2.executeUpdate();
		if(i > 0){
			ResultSet generatedKeys2 = stat2.getGeneratedKeys();
			if (null != generatedKeys2 && generatedKeys2.next()) 
			{
             bookId = generatedKeys2.getString(1);
            }
			msg = "Book added with Id : "+bookId;
		}
    }
    return msg;
}

public static String addPublisher(String[] input)throws Exception{
    String msg="fail";
    boolean flag=false;
    con = getCon();
	Statement stmt3=con.createStatement();
    ResultSet rs3=stmt3.executeQuery("select pub_email from publisher where pub_email='"+input[1]+"'");
    if(rs3.next()){
        flag=true;
        msg = "Publisher with this Email already exist";
    }
    if(!flag){
		String QUERY3 = "INSERT INTO publisher "+
               "  VALUES ('PB'||PUBLISHERSEQ.NEXTVAL,"+
               "  ?,?,?,?)";
		PreparedStatement stat3=con.prepareStatement(QUERY3,new String[] { "PUB_ID" });
		String pubId = null;
		stat3.setString(1,input[0]);
		stat3.setString(2,input[1]);
		stat3.setString(3,input[2]);
		stat3.setString(4,input[3]);
		int i=stat3.executeUpdate();
		if(i > 0){
			ResultSet generatedKeys3 = stat3.getGeneratedKeys();
			if (null != generatedKeys3 && generatedKeys3.next()) 
			{
             pubId = generatedKeys3.getString(1);
            }
			msg = "Publisher added with Id : "+pubId;
		}
    }
    return msg;
}


public static String addLibBranch(String[] input)throws Exception{
    String msg="fail";
    boolean flag=false;
    con = getCon();
	Statement stmt4=con.createStatement();
    ResultSet rs4=stmt4.executeQuery("select LIB_NAME from LIB_BRANCH where LIB_NAME='"+input[1]+"'");
    if(rs4.next()){
        flag=true;
        msg = "Publisher with this Email already exist";
    }
    if(!flag){
		String QUERY4 = "INSERT INTO LIB_BRANCH "+
               "  VALUES ('LB'||LIBSEQ.NEXTVAL,"+
               "  ?,?)";
		PreparedStatement stat4=con.prepareStatement(QUERY4,new String[] { "LIB_ID" });
		String libId = null;
		stat4.setString(1,input[0]);
		stat4.setString(2,input[1]);
		int i=stat4.executeUpdate();
		if(i > 0){
			ResultSet generatedKeys4 = stat4.getGeneratedKeys();
			if (null != generatedKeys4 && generatedKeys4.next()) 
			{
             libId = generatedKeys4.getString(1);
            }
			msg = "Library Branch added with Id : "+libId;
		}
    }
    return msg;
}

public static String login(String input)throws Exception{
    String msg="fail";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select reader_id from reader where reader_id='"+input+"'");
    if(rs.next()){
	    msg = rs.getString(1);
    }
    return msg;
}

public static String search(String input)throws Exception{
    String msg="fail";
	PreparedStatement stat=null;
    con = getCon();
	stat=con.prepareStatement("select book_id from book where book_id like ? or book_title like ? or book_publisher like ?");
    stat.setString(1,"%"+input+"%");
    stat.setString(2,"%"+input+"%");
    stat.setString(3,"%"+input+"%");
	System.out.println("In Database.java Page : "+input);
	ResultSet rs=stat.executeQuery();
    if(rs.next()){
		System.out.println("In Database.java Page : "+input);
        msg = input;
	}
    return msg;
}


public static String checkout(String[] input)throws Exception{
    String msg="no";
    con = getCon();

	Date dt = new Date();
	Calendar c = Calendar.getInstance(); 
    c.setTime(dt); 
    c.add(Calendar.DATE, 20);
    dt = c.getTime();

	PreparedStatement stat1=con.prepareStatement("insert into book_checkout values(?,?,?,?,?,?,?,?,?,?,?,?)");
	stat1.setString(1,input[0]);
	stat1.setString(2,input[1]);
	stat1.setString(3,input[2]);
	stat1.setString(4,input[3]);
	stat1.setString(5,input[4]);
	stat1.setString(6,input[5]);
	stat1.setDate(7,new java.sql.Date(Calendar.getInstance().getTime().getTime()));
	stat1.setDate(8,new java.sql.Date(c.getTime().getTime()));
	stat1.setDate(9,null);
	stat1.setString(10,"Issued");
	stat1.setString(11,null);
	stat1.setString(12,null);
	int i=stat1.executeUpdate();
	if(i > 0){
		msg = input[1];
	}

	PreparedStatement stat=con.prepareStatement("update book set book_status=? where book_id=?");
	stat.setString(1,"Issued");
	stat.setString(2,input[1]);
	i=stat.executeUpdate();
	if(i > 0){
		msg = input[1];
	}
    return msg;
}

public static String returnBook(String[] input)throws Exception{
    String msg="no";
    con = getCon();

	PreparedStatement stat1=con.prepareStatement("update book_checkout set user_return_date=?,book_status=?,RETURN_DELAY_DAYS=?,FINE_AMOUNT=? where reader_id=? and book_id=? and lib_id=?");
	stat1.setDate(1,new java.sql.Date(Calendar.getInstance().getTime().getTime()));
	stat1.setString(2,"Available");
	stat1.setString(3,input[3]);
	stat1.setString(4,input[4]);
	stat1.setString(5,input[0]);
	stat1.setString(6,input[1]);
	stat1.setString(7,input[2]);
	int i=stat1.executeUpdate();
	if(i > 0){
		msg = input[1];
	}

	PreparedStatement stat=con.prepareStatement("update book set book_status=? where book_id=?");
	stat.setString(1,"Available");
	stat.setString(2,input[1]);
	i=stat.executeUpdate();
	if(i > 0){
		msg = input[1];
	}
    return msg;
}

public static String reserve(String[] input)throws Exception{
	String msg="fail";
    boolean flag=false;
    con = getCon();

	Date dt = new Date();
	Calendar c = Calendar.getInstance(); 
    c.setTime(dt); 
    c.add(Calendar.DATE, 20);
    dt = c.getTime();
	
	Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select count(1) from book_checkout where reader_id='"+input[0]+"' and book_status='Reserved' and user_return_date is null");
	while(rs.next())
	{
	 System.out.println("Enter into WHILE");
	 int count=rs.getInt(1);
	 System.out.println("Count Value :"+count);
	 if(count>9){
	    System.out.println("Enter into IF");
        flag=true;
        msg = "Maximum Reservation Limit i.e. 10 reached";
     }
	}

    if(!flag)
	{
	 PreparedStatement stat1=con.prepareStatement("insert into book_checkout values(?,?,?,?,?,?,?,?,?,?,?,?)");
	 stat1.setString(1,input[0]);
	 stat1.setString(2,input[1]);
	 stat1.setString(3,input[2]);
	 stat1.setString(4,input[3]);
	 stat1.setString(5,input[4]);
	 stat1.setString(6,input[5]);
	 stat1.setDate(7,new java.sql.Date(Calendar.getInstance().getTime().getTime()));
	 stat1.setDate(8,new java.sql.Date(c.getTime().getTime()));
	 stat1.setDate(9,null);
	 stat1.setString(10,"Reserved");
	 stat1.setString(11,null);
	 stat1.setString(12,null);
	 int i=stat1.executeUpdate();
	 if(i > 0){
		msg = input[1];
	 }

	 PreparedStatement stat=con.prepareStatement("update book set book_status=? where book_id=?");
	 stat.setString(1,"Reserved");
	 stat.setString(2,input[1]);
	 i=stat.executeUpdate();
	 if(i > 0){
		msg = input[1];
	 }
	}
    return msg;
}

public static String pubBook(String input)throws Exception{
    String msg="fail";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select book_publisher from book where book_publisher='"+input+"'");
    if(rs.next()){
	    msg = rs.getString(1);
    }
    return msg;
}

public static String freqBorrowers(String input)throws Exception{
    String msg="fail";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select lib_id from lib_branch where lib_name='"+input+"'");
    if(rs.next()){
	    msg = rs.getString(1);
    }
    return msg;
}

}
