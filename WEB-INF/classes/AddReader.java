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

public class AddReader extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String rname=request.getParameter("rname").trim();
	String contact=request.getParameter("rmobile").trim();
	String email=request.getParameter("remail").trim();
	String qualification=request.getParameter("rqualif").trim();
	String address=request.getParameter("raddr").trim();
	String gender=request.getParameter("rgender").trim();
	try{
		String input[]={rname,contact,email,qualification,address,gender};
		String res = Database.addReader(input);
    if(!res.equals("fail")){
		RequestDispatcher rd=request.getRequestDispatcher("AdminScreen.jsp?t1="+res);
		rd.forward(request, response);
	}else{
		RequestDispatcher rd=request.getRequestDispatcher("AdminScreen.jsp?t1=Error in adding Reader");
		rd.forward(request, response);
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
