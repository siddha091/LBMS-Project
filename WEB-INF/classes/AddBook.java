package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.io.File;

public class AddBook extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String btitle=request.getParameter("btitle").trim();
	String bauthor=request.getParameter("bauthor").trim();
	String bisbn=request.getParameter("bisbn").trim();
	String bpublish=request.getParameter("bpublish").trim();
	String bpubdate=request.getParameter("bpubdate").trim();
	String blibid=request.getParameter("blibid").trim();

	//System.out.println("Pub date : "+bpubdate);
	try{
		String input[]={btitle,bauthor,bisbn,bpublish,bpubdate,blibid};
		String res = Database.addBook(input);
    if(!res.equals("fail")){
		RequestDispatcher rd=request.getRequestDispatcher("AdminScreen.jsp?t1="+res);
		rd.forward(request, response);
	}else{
		RequestDispatcher rd=request.getRequestDispatcher("AdminScreen.jsp?t1=Error in adding Book");
		rd.forward(request, response);
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
