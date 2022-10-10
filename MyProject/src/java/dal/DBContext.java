/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Student;

/**
 *
 * @author ADMIN
 */
public class DBContext {  
    ArrayList<Student> db = new ArrayList<>();
    public ArrayList<Student> getStudents(String name)
    {
        ArrayList<Student> result = new ArrayList<>();   
        for(Student student : db){
            if(student.getName().toLowerCase().contains(name.toLowerCase()))
                result.add(student);
        }
        return result;
    }    
}
