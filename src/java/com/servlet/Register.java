/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.database.database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            database db=new database();
            String _firstname=request.getParameter("first_name");
            String _lastname=request.getParameter("last_name");
            String _mail=request.getParameter("email");
            String _password=request.getParameter("pass");
            ArrayList<String> emails=db.getEmailList();
            
             try {
                 String msg="";
                 boolean check=false;
                 db.takeUsers();
                 if(emails.size()==0)
                 {
                     check=true;
                 }
                 for(int i=0;i<emails.size();i++)
                 {
                     if(_mail.equals(emails.get(i)))
                     {
                         check=false;
                         msg="Bu mail kullanılmaktadır.";
                     }
                     else
                     {   
                         check=true;
                     }
                 }
                if (_firstname!=null&&_lastname!=null&&_mail!=null&&_password!=null&&check) {
                        db.registerUser(_mail, _password, _firstname, _lastname);
                        response.sendRedirect("Successful.jsp");
                }
                else
                {
                    request.setAttribute("msg",msg);
                    RequestDispatcher rd =getServletContext().getRequestDispatcher("/register.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception ex) {
                 out.println("Exp"+ex);
                 
               
            }
        }catch (Exception e) {
            
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
