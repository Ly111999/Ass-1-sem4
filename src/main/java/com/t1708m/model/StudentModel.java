package com.t1708m.model;

import com.t1708m.entity.Student;

import java.sql.*;
import java.util.ArrayList;

public class StudentModel {
    public boolean saveTest(Student student) {
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/student-manager?user=root&password=");
            Statement statement = connection.createStatement();
            String sqlCommand = "insert into students (username, password, email, fullName, address, phone) " +
                    "values ('" + student.getUsername() + "', '" + student.getPassword() + "'" +
                    ", '" + student.getEmail() + "', '" + student.getFullName() + "', '" + student.getAddress() + "', '" + student.getPhone() + "')";
            statement.execute(sqlCommand);
            System.out.println("Okie.");
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean save(Student student) {
        try {
            String sqlCommand = "insert into students (username, password, salt, email, fullName, address, phone, role) values (?,?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = ConnectionHelper.getConnection().prepareStatement(sqlCommand);
            preparedStatement.setString(1, student.getUsername());
            preparedStatement.setString(2, student.getPassword());
            preparedStatement.setString(3, student.getSalt());
            preparedStatement.setString(4, student.getEmail());
            preparedStatement.setString(5, student.getFullName());
            preparedStatement.setString(6, student.getAddress());
            preparedStatement.setString(7, student.getPhone());
            preparedStatement.setInt(8, student.getRole());

            preparedStatement.execute();
            return true;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Student> getList() {
        ArrayList<Student> results = new ArrayList<>();
        try {
            String sqlCommand = "select * from students";
            PreparedStatement preparedStatement = ConnectionHelper.getConnection().prepareStatement(sqlCommand);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("fullName");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                Student student = new Student();
                student.setUsername(username);
                student.setPassword(password);
                student.setFullName(fullName);
                student.setEmail(email);
                student.setAddress(address);
                student.setPhone(phone);
                results.add(student);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return results;
    }

    public static Student findByUsernameAndStatus(String username, Student.Status status) {
        try {
            String sqlCommand = "SELECT * FROM students WHERE username = ? AND status = ?";
            PreparedStatement preparedStatement = ConnectionHelper.getConnection().prepareStatement(sqlCommand);
            preparedStatement.setString(1, username);
            preparedStatement.setInt(2, status.getValue());
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String rsUsername = resultSet.getString(1);
                String rsPass = resultSet.getString(2);
                String rsSalt = resultSet.getString(3);
                String email = resultSet.getString(4);
                String fullName = resultSet.getString(5);
                String address = resultSet.getString(6);
                String phone = resultSet.getString(7);
                int rsRole = resultSet.getInt(8);
                int rsStatus = resultSet.getInt(9);

                Student student = new Student();
                student.setUsername(rsUsername);
                student.setPassword(rsPass);
                student.setFullName(fullName);
                student.setEmail(email);
                student.setAddress(address);
                student.setPhone(phone);
                student.setStatus(Student.Status.findByValue(rsStatus));
                student.setSalt(rsSalt);
                student.setRole(Student.Role.findByValue(rsRole));
                return student;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        Student student =  findByUsernameAndStatus("1", Student.Status.ACTIVE);
        if (student != null){
            System.out.println(student.getSalt());
        }
    }

}
