<%-- 
    Document   : index
    Created on : Oct 5, 2016, 12:05:07 AM
    Author     : nhanvo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AJAX calls using Jquery in Servlet</title>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script>
            $(document).ready(function() {
                $("#submit").click(function (event) {
                   var username = $('#user').val();
                   $.get('ActionServlet', {user:username}, function(responseText){
                       console.log(responseText);
                      $("#welcometext").text(responseText); 
                   });
                });
            });
        </script>
    </head>
    <body>
        <form>
            <h1>AJAX Demo using JQuery in JSP and Servlet</h1>
            Enter your name:
            <input type="text" id="user"/>
            <input type="button" id="submit" value="Ajax submit"/>
            <div id="welcometext"></div>
        </form>
        <br/>
        <a href="index.jsp">Back</a>
    </body>
</html>
