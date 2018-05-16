/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;


public class database {
    int n;
    private String User = "sa";
    private String Password = "1234";
    private Connection connection=null;
    private static String connectionString = "jdbc:sqlserver://192.168.1.102:1433;DatabaseName=PoolEx;user=";
    ArrayList<String> emailList=new ArrayList<String>();
    ArrayList<String> passwordList=new ArrayList<String>();
    ArrayList<String> nameList=new ArrayList<String>();
    ArrayList<String> surnameList=new ArrayList<String>();
    int[] questionIDs;
    ArrayList<String> questionNames=new ArrayList<String>();

    public ArrayList<String> getEmailList() {
        return emailList;
    }

    public void setEmailList(ArrayList<String> emailList) {
        this.emailList = emailList;
    }

    public ArrayList<String> getPasswordList() {
        return passwordList;
    }

    public void setPasswordList(ArrayList<String> passwordList) {
        this.passwordList = passwordList;
    }

    public ArrayList<String> getNameList() {
        return nameList;
    }

    public void setNameList(ArrayList<String> nameList) {
        this.nameList = nameList;
    }

    public ArrayList<String> getSurnameList() {
        return surnameList;
    }

    public void setSurnameList(ArrayList<String> surnameList) {
        this.surnameList = surnameList;
    }

    public int[] getQuestionIDs() {
        return questionIDs;
    }

    public void setQuestionIDs(int[] questionIDs) {
        this.questionIDs = questionIDs;
    }

    public ArrayList<String> getQuestionNames() {
        return questionNames;
    }

    public void setQuestionNames(ArrayList<String> questionNames) {
        this.questionNames = questionNames;
    }

    public database() throws ClassNotFoundException {
            {try { 
        if(connection==null)
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(connectionString,User,Password);
            System.out.println("database connected");
        }
        else
        {
            System.out.println("database already connected");
        }
    } catch (SQLException ex) {
                Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("database connection error");
            }
    }
    }

    public void takeUsers() throws ClassNotFoundException
    {try { 
  
            Statement sql=connection.createStatement();
            ResultSet rs=sql.executeQuery(" Select * From Users");
            while(rs.next())
            {
                emailList.add(rs.getString("Mail"));
                passwordList.add(rs.getString("uPassword"));
                nameList.add(rs.getString("Name"));
                surnameList.add(rs.getString("Surname"));
               
            }
          
       
      } catch (SQLException ex) { 
          Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("database connection error");
            }
    }
    public void putAnswers (String email,ArrayList<String> answerList) throws SQLException, ClassNotFoundException
    {
        try{
                for (int i=0;i<3;i++)
                {
                    System.out.println(answerList.get(i));
                    PreparedStatement stmt = connection.prepareStatement("insert into Pool_Result(Mail,Quest_ID,Quest_Answer)"+" values(?,?,?)");
                    stmt.setString(1, email);
                    stmt.setInt(2, i+1);
                    stmt.setString(3, answerList.get(i));
                    stmt.execute();
                }
        }catch(SQLException ex){
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("database connection error");
        }
    }
    public void getQuestions()
    {
        try { 
            questionIDs= new int[100];
            Statement sql=connection.createStatement();
            ResultSet rs=sql.executeQuery(" Select * From Questions");
            while(rs.next())
            {
                questionNames.add(rs.getString("Quest_Name"));
            }
       
      } catch (SQLException ex) { 
          Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("database get question error");
            }
    }
    public void registerUser(String email,String password,String name,String surname) throws ClassNotFoundException
    {
                try{
                        System.out.println("email = "+email);
                        PreparedStatement sql= connection.prepareStatement("Insert into Users values('"+email+"','"+name+"','"+surname+"','"+password+"')");
                        sql.execute();
        }catch(SQLException ex){
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("database connection error");
        }
    }
}
