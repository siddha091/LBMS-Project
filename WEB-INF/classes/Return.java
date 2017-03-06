package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Return extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	HttpSession session=request.getSession();
	PrintWriter out = response.getWriter();
	String rid=request.getParameter("rid");
	String bid=request.getParameter("bid");
	String libid=request.getParameter("libid");
	String delayDays=request.getParameter("delayDays");
	String fineAmount=request.getParameter("fineAmount");

    //session.setAttribute("keyword",keyword);
	//System.out.println("In Search.java Page : "+session.getAttribute("keyword"));
	try{
		String input[]={rid,bid,libid,delayDays,fineAmount};
		String res = Database.returnBook(input);
    if(!res.equals("fail")){
		RequestDispatcher rd=request.getRequestDispatcher("Return.jsp?t1=Return done on book with Id : "+res);
		rd.forward(request, response);
	}else{
		response.sendRedirect("Return.jsp?t1=No Results Found");
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
}

}
