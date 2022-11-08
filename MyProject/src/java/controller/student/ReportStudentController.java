/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.student;

import controller.lecturer.*;
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
public class ReportStudentController extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int gid = Integer.parseInt(req.getParameter("gid"));
        int stdid = Integer.parseInt(req.getParameter("stdid"));
        int subid = Integer.parseInt(req.getParameter("subid"));
        
        GroupDBContext gDB = new GroupDBContext();
        ArrayList<Group> groups = gDB.list(gid);
        Group group = gDB.get(gid);
        req.setAttribute("groups", groups);
        req.setAttribute("group", group);
   
        StudentDBContext sDB = new StudentDBContext();
        Student student = sDB.get(stdid);
        req.setAttribute("student", student);
        
        SubjectDBContext subDB = new SubjectDBContext();
        ArrayList<Subject> subjects = subDB.list(subid);
        Subject subject = subDB.get(subid);
        req.setAttribute("subjects", subjects);
        req.setAttribute("subject", subject);
        
        ReportDBContext rDB = new ReportDBContext();
        ArrayList<Session> sessions = rDB.show(stdid, subid);
        req.setAttribute("sessions", sessions);
        
        
        AttandanceDBContext aDB = new AttandanceDBContext();
        ArrayList<Attandance> attandances = aDB.list(stdid);
        req.setAttribute("attandances", attandances);
        req.getRequestDispatcher("../view/student/report.jsp").forward(req, resp);
    }
}
