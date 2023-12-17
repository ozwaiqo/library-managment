package com.example;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/getReport")
public class GetReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int total_books = 0;
        int taken_books = 0;
        try (Connection connection = DBUtil.getConnection()) {
            String query = "SELECT COUNT(*) AS total_books, SUM(CASE WHEN `available` = 0 THEN 1 ELSE 0 END) AS taken_books FROM books";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery()) {
                
                if (resultSet.next()) {
                  total_books = resultSet.getInt("total_books");
                  taken_books = resultSet.getInt("taken_books");
                } 
            }
        
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("total_books", total_books);
        request.setAttribute("taken_books", taken_books);

        request.getRequestDispatcher("/getReport.jsp").forward(request, response);
    }
}
