<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratory Work 2</title>
        <%!
        public String getX (HttpServletRequest request){
        	if (request.getParameter("x")!= null)
            	return request.getParameter("x");
        	else return "";
        }
        public String getY (HttpServletRequest request){
        	if (request.getParameter("y")!= null)
            	return request.getParameter("y");
        	else return "";
        }
        %>
    </head>
    <body>
        <h1>Лабораторная работа №2; Вариант 754</h1> <br>
        <form action = "controllerServlet" method="GET" id = "myForm">
            Input x: <input type="text" name = "x" value ="<%= getX(request)%>">><br>
            Input y: <br>
            <select name = "y" form ="myForm">
                <option value ="-4">-4</option>
                <option value ="-3">-3</option>
                <option value ="-2">-2</option>
                <option value ="-1">-1</option>
                <option value ="0">0</option>
                <option value ="1">1</option>
                <option value ="2">2</option>
                <option value ="3">3</option>
                <option value ="4">4</option>
            </select>
            Input r: <br>
            1:<input type ="checkbox" name ="r" value = "1"><br>
            1.5:<input type ="checkbox" name ="r" value = "1.5"><br>
            2:<input type ="checkbox" name ="r" value = "2"><br>
            2.5:<input type ="checkbox" name ="r" value = "2.5"><br>
            3:<input type ="checkbox" name ="r" value = "3"><br>
            <input type ="submit" value = "Send">
        </form>
        <a href = "/Lab/servlets/areaCheckServlet">controller</a>
    </body>
</html>
