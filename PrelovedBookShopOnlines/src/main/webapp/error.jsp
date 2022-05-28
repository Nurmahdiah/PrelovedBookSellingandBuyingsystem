<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Error</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
    table { border: 0; }
    table td { padding: 5px; }
    a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

body, html {
  height: 100%;
  line-height: 1.8;
    margin: 0;
    padding-top: 140px;
    color: #2e323c;
    background: #f5f6fa;
    position: relative;
    height: 100%;
}
.body {
    padding-top: 140px;
    padding-bottom: 100px;
}
.w3-bar .w3-button {
  padding: 16px;
}
</style>
</head>

<body>
<div style="background-color:#F1F5FF;">
<div align="center" style="background-color:#F1F5FF;">
    <h1>Payment Error:</h1>
    <br/>
    <h3>${errorMessage}</h3>
    <br/>
    
    <a href="homePage.jsp"><button type="button" id="return" name="return" class="btn btn-danger">Return</button></a>
    
</div>
</div>
</body>
</html>