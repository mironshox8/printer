<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chek Chop Qilish</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .print-btn {
            padding: 15px 30px;
            font-size: 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .print-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form action="print.php" method="post">
        <button type="submit" class="print-btn">Chekni Chop Etilishi</button>
    </form>
</body>
</html>