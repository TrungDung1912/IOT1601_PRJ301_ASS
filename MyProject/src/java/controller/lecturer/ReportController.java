/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import dal.AttandanceDBContext;
import dal.GroupDBContext;
import dal.ReportDBContext;
import dal.StudentDBContext;
import dal.SubjectDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Attandance;
import model.Group;
import model.Session;
import model.Student;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class ReportController extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
  
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 
        req.getRequestDispatcher("../view/lecturer/report.jsp").forward(req, resp);
    }
}
