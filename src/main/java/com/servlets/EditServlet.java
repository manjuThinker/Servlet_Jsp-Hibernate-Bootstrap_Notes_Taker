package com.servlets;

import java.io.IOException;
import java.util.Date;

import Entities.Note;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EditServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int id=Integer.parseInt(request.getParameter("myField"));
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			Note n=session.get(Note.class, id);
			
			n.setContent(content);
			n.setTitle(title);
			n.setAddedDate(new Date());
			
			tx.commit();
			session.close();
			
			response.sendRedirect("allNotes.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
