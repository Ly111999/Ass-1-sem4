package com.t1708m.controller;

import com.t1708m.entity.Product;
import com.t1708m.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class ProductController extends HttpServlet {
    private static ProductModel model = new ProductModel();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Product> list = model.getList();
        req.setAttribute("list", list);
        req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
    }
}
