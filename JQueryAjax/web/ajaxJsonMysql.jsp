<%-- 
    Document   : ajaxJsonMysql
    Created on : Oct 5, 2016, 2:10:16 AM
    Author     : nhanvo
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Ajax Json Array Example</title>
        <link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <style type="text/css">
            table, td, th {
                border: 1px solid green;
                font-family: 'Oxygen', sans-serif;
            }
            
            th {
                background-color: green;
                color: white;
            }
            
            body {
                text-align: center;
            }
            
            .container {
                margin-left: auto;
                margin-right: auto;
                width: 40em;
            }
        </style>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#tablediv").hide();
                $("#showTable").click(function (event) {
                    $.get('PopulateTable', function (responseJson) {
                        if (responseJson != null) {
                            $("#countrytable").find("tr:gt(0)").remove();
                            var table1 = $("#countrytable");
                            $.each(responseJson, function (key, value) {
                                var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                                rowNew.children().eq(0).text(value['code']);
                                rowNew.children().eq(1).text(value['name']);
                                rowNew.children().eq(2).text(value['continent']);
                                rowNew.children().eq(3).text(value['region']);
                                rowNew.children().eq(4).text(value['population']);
                                rowNew.children().eq(5).text(value['capital']);
                                rowNew.appendTo(table1)
                            });
                        }
                    });
                    $("#tablediv").show();
                });
            });
        </script>
    </head>
    <body class="container">
        <h1>AJAX retrieve data from database in Servlet and JSP using JSONArray</h1>
        <input type="button" value="Show Table" id="showTable"/>
        <div id="tablediv">
            <table cellspacing="0" id="countrytable">
                <tr>
                    <th scope="col">Code</th>
                    <th scope="col">Name</th>
                    <th scope="col">Continent</th>
                    <th scope="col">Region</th>
                    <th scope="col">Population</th>
                    <th scope="col">Capital</th>
                </tr>               
                
            </table>
        </div>
        <br/>
        <a href="index.jsp">Back</a>
    </body>
</html>
