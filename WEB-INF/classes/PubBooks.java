package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PubBooks extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	HttpSession session=request.getSession();
	PrintWriter out = response.getWriter();
	String pubname=request.getParameter("pubname");
    session.setAttribute("pubname",pubname);
	System.out.println("In Search.java Page : "+session.getAttribute("keyword"));
	try{
		//String input[]={rname,contact,email,qualification,address,gender};
		String res = Database.pubBook(pubname);
    if(!res.equals("fail")){
		RequestDispatcher rd=request.getRequestDispatcher("PubBooks1.jsp?t1=Books Of Publisher : "+res);
		rd.forward(request, response);
	}else{
		response.sendRedirect("PubBooks.jsp?t1=No Results Found");
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
}

}
