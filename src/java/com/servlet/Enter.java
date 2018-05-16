/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.database.database;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Enter extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String _mail=request.getParameter("email");
            String _password=request.getParameter("pass");
            HttpSession session =request.getSession(true);
                      boolean check=false;
                      database db=new database();
                      db.takeUsers();
                      db.getQuestions();
                      System.out.println(db.getEmailList().size());
                      for(int i=0;i<=db.getEmailList().size()-1;i++)
                      {
                          if((_mail.equals(db.getEmailList().get(i)))&&(_password.equals(db.getPasswordList().get(i))))
                                  {
                                      session.setAttribute("name", db.getNameList().get(i));
                                      session.setAttribute("surname",db.getSurnameList().get(i));
                                      check=true;
                                  }
                      }
                      if(check)
                      {
                          session.setAttribute("login", "true");
                          session.setAttribute("mail",_mail);

                          response.sendRedirect("survey.jsp");
                          session.setAttribute("question", db.getQuestionNames());
                      }
                      else
                      {
                          response.sendRedirect("index.jsp");
                      }
            } catch (Exception ex) {
               Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
                          System.out.println("yanlış");
               //response.sendRedirect("Successful.jsp");
            }
        
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
