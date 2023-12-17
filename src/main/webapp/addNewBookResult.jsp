<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Added Book</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        p {
            color: #555;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
            font-size: 16px;
            color: #777;
        }

        button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
  <h1>Result Page</h1>

  <p>You entered the following data:</p>
  <% 
    String title = (String)request.getAttribute("title"); 
    String author = (String)request.getAttribute("author"); 
    int publication_year = Integer.parseInt((String)request.getAttribute("publication_year")); 
  %>
  
  <ul>
      <li><strong>Title:</strong> <%= title %></li>
      <li><strong>Author:</strong> <%= author %></li>
      <li><strong>Publication Year:</strong> <%= publication_year %></li>
  </ul>

  <form action="index.jsp" method="get">
      <button type="submit">Back to Main Page</button>
  </form>

</body>
</html>