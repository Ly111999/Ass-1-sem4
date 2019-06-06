package com.t1708m.model;

import com.t1708m.entity.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductModel {
    public static void main(String[] args) {
        ArrayList<Product> list = new ArrayList<>();
        list.add(new Product("Sp1", "100000"));
        list.add(new Product("Sp2", "100000"));
        list.add(new Product("Sp3", "100000"));
        list.add(new Product("Sp4", "100000"));
        list.add(new Product( "Sp5", "100000"));
        list.add(new Product( "Sp6", "100000"));
        list.add(new Product( "Sp7", "100000"));
        list.add(new Product( "Sp8", "100000"));
        list.add(new Product( "Sp9", "100000"));
        list.add(new Product( "Sp10", "100000"));

        ProductModel model = new ProductModel();
        for (Product product:
                list) {
            model.save(product);
        }
        System.out.println("Lưu thành công");
    }

    public boolean save(Product product) {
        try {
            String sqlCommand = "insert into products (`id`, `name`, `price`) values (?,?,?)";
            PreparedStatement preparedStatement = ConnectionHelper.getConnection().prepareStatement(sqlCommand);
            preparedStatement.setInt(1, product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getPrice());
            preparedStatement.execute();
            return true;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Product> getList() {
        ArrayList<Product> results = new ArrayList<>();
        try {
            String sqlCommand = "select * from products";
            PreparedStatement preparedStatement = ConnectionHelper.getConnection().prepareStatement(sqlCommand);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String price = resultSet.getString("price");
                Product product = new Product();
                product.setName(name);
                product.setPrice(price);
                results.add(product);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return results;
    }

}
