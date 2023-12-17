package com.example;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/addNewBook")
public class AddNewBookServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    int publication_year = Integer.parseInt(request.getParameter("publication_year"));
    int available = 1;

    try (Connection connection = DBUtil.getConnection()) {
      String query = "INSERT INTO books(title, author, publication_year, available) VALUES(?, ?, ?, ?)";
      
      PreparedStatement preparedStatement = null;
      
      try {
        preparedStatement = connection.prepareStatement(query);

        preparedStatement.setString(1, title);
        preparedStatement.setString(2, author);
        preparedStatement.setInt(3, publication_year);
        preparedStatement.setInt(4, available);

        preparedStatement.executeUpdate();

      } finally {
        if (preparedStatement != null)
          preparedStatement.close();
        if (connection != null)
          connection.close();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    request.setAttribute("title", title);
    request.setAttribute("author", author);
    request.setAttribute("publication_year", String.valueOf(publication_year));

    request.getRequestDispatcher("/addNewBookResult.jsp").forward(request, response);
  }
}
