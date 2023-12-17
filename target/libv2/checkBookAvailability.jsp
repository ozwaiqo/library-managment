<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Book" %>
<html>
<head>
    <title>Library</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .back-button {
            margin-top: 10px;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .back-button:hover {
            background-color: #2a762e;
        }
    </style>
</head>
<body>
    <h1>Library Books</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Publication Year</th>
            <th>Available</th>
        </tr>
        <% 
            List<Book> books = (List<Book>) request.getAttribute("books");
            if (books != null) {
              for (Book book : books) {
        %>
        <tr>
            <td><%= book.getId() %></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getPublicationYear() %></td>
            <td><%= book.isAvailable() %></td>
        </tr>
        <%    }
            } else {
                System.out.println("List of books is null!");
            } %>
    </table>

    <form action="index.jsp" method="get">
        <button type="submit" class="back-button">Go to Main Page</button>
    </form>
</body>
</html>
