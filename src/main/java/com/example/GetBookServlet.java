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

@WebServlet("/getBook")
public class GetBookServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    
    int userId = Integer.parseInt(request.getParameter("userId"));
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    
    try (Connection connection = DBUtil.getConnection()) {
      String query = "CALL GetBook(?, ?)";
      
      PreparedStatement preparedStatement = null;
      
      try {
        preparedStatement = connection.prepareStatement(query);

        preparedStatement.setInt(1, userId);
        preparedStatement.setInt(2, bookId);

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

    request.setAttribute("userId", String.valueOf(userId));
    request.setAttribute("bookId", String.valueOf(bookId));

    request.getRequestDispatcher("/getBookResult.jsp").forward(request, response);
  }
}
