package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;

import org.hibernate.Transaction;

import Entities.Note;
import Helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class saveNoteservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Transaction tx;

    public saveNoteservlet() {
    	
    	super();
  
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			Note note= new Note(title,content,new Date());
			
			Session s=FactoryProvider.getFactory().openSession()
;			
			tx=s.beginTransaction();
			
			s.persist(note);
			
			tx.commit();
			s.close();
			response.setContentType("text/html");
	        
			PrintWriter out=response.getWriter();
			out.println("note is added");
			out.println("<a class=\"nav-link\" href=\"allNotes.jsp\">Add Notes</a>");
			
		
			
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
		
	}

}
