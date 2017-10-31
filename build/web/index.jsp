<%@page import="javax.management.Attribute"%>
<%@page import="javax.management.ObjectName"%>
<%@page import="javax.management.MBeanServer"%>
<%@page import="javax.management.MBeanServerFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Laboratory Work 2</title>
        <h1 align ="center">Лабораторная работа №2; Вариант 754</h1> <br>
        <h3 align = "right">Выполнили: Хлопков Д., Фищенко В.</h3>
        <h3 align = "right">Проверил: Николаев В.В.</h3>
        <jsp:useBean id="resultsBean" class="mbeans.Results"/>
        <script type="text/javascript">
            function validate(f){
                var x = parseFloat(document.getElementsByName("x")[0].value);
                if (x >= -3 && x <= 3){
                    rButton = document.getElementsByName("r");
                    var numberOfChecked = 0;
                    for (var i = 0; i < rButton.length; i++)
                        if (rButton[i].checked)
                            numberOfChecked++;
                    if (numberOfChecked == 1) return true;
                    else {
                         f.childNodes[f.childNodes.length - 1].nodeValue = "У радиуса может быть только 1 значение";
                        return false;
                    }
                }
                else {
                    f.childNodes[f.childNodes.length - 1].nodeValue = "X должен быть от -3 до 3";
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <form action = "/Lab2/app/controllerServlet" method="GET" id = "myForm" onsubmit="return validate(this);">
            Введите x: <input type="text" name = "x"><br>
            Введите y: <br>
            <select name = "y" form ="myForm">
                <option value ="-4">-4</option>
                <option value ="-3">-3</option>
                <option value ="-2">-2</option>
                <option value ="-1">-1</option>
                <option value ="0" selected>0</option>
                <option value ="1">1</option>
                <option value ="2">2</option>
                <option value ="3">3</option>
                <option value ="4">4</option>
            </select><br>
            Введите r: <br>
            1:  <input type ="checkbox" name ="r" value = "1"><br>
            1.5:<input type ="checkbox" name ="r" value = "1.5"><br>
            2:  <input type ="checkbox" name ="r" value = "2"><br>
            2.5:<input type ="checkbox" name ="r" value = "2.5"><br>
            3:  <input type ="checkbox" name ="r" value = "3"><br>
            <input type ="submit" value = "Send">
            <div id ="errors"></div>
        </form>
        <%
            if (request.getAttribute("showResult")!=null)
		if ( ((Boolean) request.getAttribute("showResult")).booleanValue()){
		    boolean strike = ((Boolean) request.getAttribute("strike")).booleanValue();
		    Double x = Double.parseDouble(request.getParameter("x"));
		    Double y = Double.parseDouble(request.getParameter("y"));
		    Double r = Double.parseDouble(request.getParameter("r"));
		    out.write("Координаты: (" + x + "; " + y + "), радиус: " + r + "<br>");
		    if (strike) {
		        out.write("Точка попадает в область. <br>");
		    }
		    else out.write("Точка не попадает в область. <br>");
                    
                    /*try {
                        //Получаем ссылку на MBean сервер
                        ArrayList servers = MBeanServerFactory.findMBeanServer(null);
                        if (servers == null)
                        throw new Exception("No MBeanServer found.");
                        MBeanServer server = (MBeanServer)servers.get(0);
                        //Создаем объект для идентификации MBean'а
                        ObjectName objName = new ObjectName("DefaultDomain:type=Results");
                        server.setAttribute(objName, new Attribute("X", x));
                        server.setAttribute(objName, new Attribute("Y", y));
                        server.setAttribute(objName, new Attribute("R", r));
                        server.setAttribute(objName, new Attribute("Strike", strike));
                        
                        int size = (Integer) server.getAttribute(objName, "size");
                        out.write("<table>");
                        out.write("<tr>");
                        out.write("<td> x </td> <td> y </td> <td> r </td> <td> Попадает в область? </td>");
                        out.write("</tr>");
                        
                        for (int i = 0; i < size; size++){
                            out.write("<tr>");
                            out.write("<td>"  + (String) server.getAttribute(objName, "X") + "</td>");
                            out.write("<td>"  + (String) server.getAttribute(objName, "Y") + "</td>");
                            out.write("<td>"  + (String) server.getAttribute(objName, "R") + "</td>");
                            out.write("<td>"  + (String) server.getAttribute(objName, "Strike") + "</td>");
                            out.write("</tr>");
                        }
                        out.write("</table>");
                     }
                    catch(Exception e){
                        out.println(e.getMessage());
                    }*/
		    out.write("<a href = ../index.jsp>Убрать результаты</a>");
		}
                else if (request.getAttribute("isDataCorrect")!=null)
                    if (!((Boolean) request.getAttribute("isDataCorrect")).booleanValue())
	        	out.write("Неверные параметры GET запроса");
        %>
    </body>
</html>
