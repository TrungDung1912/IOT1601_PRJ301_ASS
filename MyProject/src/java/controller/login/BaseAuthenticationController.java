/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

/**
 *
 * @author ADMIN
 */
public abstract class BaseAuthenticationController extends HttpServlet{
   
    private boolean isAuthen(HttpServletRequest req)
    {
        return req.getSession().getAttribute("account") != null;
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthen(req))
        {
            Account account = (Account)req.getSession().getAttribute("account");
            doPost(req, resp, account);
        }
        else
            resp.getWriter().println("access denied!");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthen(req))
        {
            Account account = (Account)req.getSession().getAttribute("account");
            doGet(req, resp, account);
        }
        else
            resp.getWriter().println("access denied!");
    }
    
    protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;
    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;
    
}
