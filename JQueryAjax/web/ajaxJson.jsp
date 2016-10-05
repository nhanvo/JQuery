<%-- 
    Document   : ajaxJson
    Created on : Oct 5, 2016, 12:32:49 AM
    Author     : nhanvo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AJAX calls to Servlet using JQuery and JSON</title>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script>
            $(document).ready(function() {
                $('#country').change(function (event){
                    var $country = $('select#country').val();
                    $.get('ActionServletJson',{countryname:$country}, function(responseJson){
                        var $select = $('#states');
                        $select.find('option').remove();
                        $.each(responseJson, function (key, value) {
                            $('<option>').val(key).text(value).appendTo($select);
                        });
                    });
                });
            });
        </script>
    </head>
    <body>
        <h1>AJAX calls to Servlet using JQuery and JSON</h1>
        Select country:
        <select id ="country">
            <option>Select country</option>
            <option value="India">India</option>
            <option value="US">US</option>
        </select>
        
        Select state:
        <select id="states">
            <option>Select state</option>
        </select>
        <br/>
        <a href="index.jsp">Back</a>
    </body>
</html>
