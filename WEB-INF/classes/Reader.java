package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Reader extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	HttpSession session=request.getSession();
	PrintWriter out = response.getWriter();
	String rid=request.getParameter("t1");
	session.setAttribute("rid",rid);
	try{
		//String input[]={rname,contact,email,qualification,address,gender};
		String res = Database.login(rid);
    if(!res.equals("fail")){
		RequestDispatcher rd=request.getRequestDispatcher("ReaderScreen.jsp?t1=Welcome "+res);
		rd.forward(request, response);
	}else{
		response.sendRedirect("Reader.jsp?t1=Invalid Reader");
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
}

}
