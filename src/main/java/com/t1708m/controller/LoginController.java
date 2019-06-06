package com.t1708m.controller;

import com.t1708m.entity.Student;
import com.t1708m.model.StudentModel;
import com.t1708m.utility.HandleP;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                System.out.println(cookie.getName() + " - " + cookie.getValue() + " - " + cookie.getDomain());
            }
        }
        HttpSession session = req.getSession();
        Student student = (Student) session.getAttribute("currentLoggedIn");
        req.setAttribute("student", student);
        req.getRequestDispatcher("/member/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String inputUsername = req.getParameter("username");
        String inputPass = req.getParameter("password");
        PrintWriter out = resp.getWriter();
        try {
            StudentModel studentModel = new StudentModel();
            Student student = studentModel.findByUsernameAndStatus(inputUsername, Student.Status.ACTIVE);

            if (student == null) {
                resp.setStatus(404);
                resp.getWriter().println("Tai khoan ko ton tai hoac da bi xoa");
            } else {
                //mã hóa pass
                String passwords = student.getSalt() + HandleP.stringHash(inputPass);
                System.out.println("xxx" + student.getSalt());
                if (passwords.equals(student.getPassword())) {
                    HttpSession session = req.getSession();
                    session.setAttribute("currentLoggedIn", student);
                    resp.setStatus(200);
                    if (student.getRole() == 2) {
                        resp.sendRedirect("/product/list");
                    } else {
                        resp.sendRedirect("/member/list");
                    }
                } else {
                    resp.setStatus(401);
                    resp.getWriter().println(passwords);

                    resp.getWriter().println("Sai tt tài khoản");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
