/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attandance;
import model.Session;
import model.Student;

/**
 *
 * @author ADMIN
 */
public class AttandanceDBContext extends DBContext<Attandance>{

    @Override
    public void insert(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attandance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public Attandance absent(int stdid) {
        
         try {
            String sql = "select count(a.present) [absent]\n"
                     + "                      from Attandance a\n"
                     + "                      inner join Student s on s.stdid = a.stdid\n"
                     + "                      where a.stdid = ?\n"
                     + "		       and a.present = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Attandance att = new Attandance();
                Session ses = new Session();
                ses.setId(rs.getInt("sesid"));
                ses.setIndex(rs.getInt("index"));
                att.setSession(ses);
                
                Student s = new Student();
                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));
                att.setStudent(s);
                
                return att;

            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AttandanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
        
    }

    
    public ArrayList<Attandance> list(int stdid) {
        ArrayList<Attandance> atts = new ArrayList<>();
        
        try {
            String sql = "SELECT present, [description]\n"
                    + "   ,ses.sesid,ses.[index]\n"
                    + "	  ,s.stdid, s.stdname\n"
                    + "  FROM Attandance a\n"
                    + "  INNER JOIN [Session] ses on ses.sesid = a.sesid\n"
                    + "  INNER JOIN Student s on s.stdid = a.stdid\n"
                    + "  WHERE a.stdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Attandance att = new Attandance();
                Session ses = new Session();
                ses.setId(rs.getInt("sesid"));
                ses.setIndex(rs.getInt("index"));
                att.setSession(ses);
                
                Student s = new Student();
                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));
                att.setStudent(s);
                
                att.setDescription(rs.getString("description"));
                att.setPresent(rs.getBoolean("present"));
                atts.add(att);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AttandanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;

    }

    @Override
    public ArrayList<Attandance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}