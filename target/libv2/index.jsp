<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 1em;
            text-align: center;
        }

        section {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        form {
            text-align: left;
            margin-top: 20px;
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

        #management form {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to the Library</h1>
    </header>

    <section id="registration">
      <h2>Registration</h2>
      <form action="addNewBook.html" method="post">
        <button type="submit">Register New Book</button>
      </form>
  </section>

  <section id="management">
      <h2>Book Management</h2>
      <form action="getBook.html" method="get">
        <button type="submit">Get the book</button>
      </form>
      <form action="returnBook.html" method="get">
        <button type="submit">Return the Book</button>
      </form>
  </section>

  <section id="availability">
      <h2>Availability</h2>
      <form action="checkBookAvailability" method="get">
        <button type="submit">Fetch Library Data</button>
      </form>
  </section>

  <section id="reports">
      <h2>Reports</h2>
      <form action="getReport" method="get">
        <button type="submit">Generate Reports</button>
      </form>
  </section>

</body>
</html>
