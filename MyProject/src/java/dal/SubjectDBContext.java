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
import model.Group;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class SubjectDBContext extends DBContext<Subject> {

    @Override
    public void insert(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Subject get() {
        try {
            String sql = "SELECT sub.subid, sub.subname FROM [Subject] sub";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {

                Subject sub = new Subject();

                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));

                return sub;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    @Override
    public Subject get(int id) {
        try {
            String sql = "SELECT sub.subid, sub.subname\n"
                    + "      FROM [Subject] sub\n"
                    + "      where sub.subid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject sub = new Subject();
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                return sub;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList<Subject> list(int stdid) {
        ArrayList<Subject> subjects = new ArrayList<>();

        String sql = "SELECT s.subid, s.subname\n"
                + "     FROM [Subject] s\n"
                + "     INNER JOIN [Group] g on s.subid = g.subid\n"
                + "	INNER JOIN Student_Group sg on sg.gid = g.gid\n"
                + "	INNER JOIN Student st on st.stdid = sg.stdid\n"
                + "     WHERE st.stdid = ?\n"
                + "	GROUP BY s.subid, s.subname";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject sub = new Subject();
                Group g = new Group();
                
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                sub.getGroups().add(g);
                subjects.add(sub);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subjects;
    }

    @Override
    public ArrayList<Subject> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
