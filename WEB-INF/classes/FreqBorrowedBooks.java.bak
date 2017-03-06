package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FreqBorrowers extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	HttpSession session=request.getSession();
	PrintWriter out = response.getWriter();
	String libname=request.getParameter("libname");
    session.setAttribute("libname",libname);
	//System.out.println("In Search.java Page : "+session.getAttribute("keyword"));
	try{
		//String input[]={rname,contact,email,qualification,address,gender};
		String res = Database.freqBorrowers(libname);
    if(!res.equals("fail")){
		RequestDispatcher rd=request.getRequestDispatcher("FreqBorrowers1.jsp?t1="+res);
		rd.forward(request, response);
	}else{
		response.sendRedirect("FreqBorrowers.jsp?t1=No Results Found");
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
}

}
