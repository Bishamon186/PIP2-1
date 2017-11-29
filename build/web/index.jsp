<%@page import="javax.management.MBeanAttributeInfo"%>
<%@page import="java.util.Set"%>
<%@page import="javax.management.ObjectInstance"%>
<%@page import="mbeans.Results"%>
<%@page import="java.lang.management.ManagementFactory"%>
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
        <h1 align ="center">Лабораторная работа №2; Вариант 754</h1>
        <h3 align = "right">Выполнили: Хлопков Д., Фищенко В.</h3>
        <h3 align = "right">Проверил: Николаев В.В.</h3>
        <style>
            table, th, td {
                border: 1px solid black;
            }
            table {
                width: 400px;
                table-layout: fixed;
            }
            td, .coords{
                overflow-x: scroll;
                max-width:30%;
            }
            body{
                max-width: 100%;
            }
        </style>
        <script type="text/javascript">
            function getNumberOfChecked(){
                var numberOfChecked = 0;
                rButton = document.getElementsByName("r");
                for (var i = 0; i < rButton.length; i++)
                        if (rButton[i].checked)
                            numberOfChecked++;
                return numberOfChecked;
            }
            function getRadiusValue(){
                var radius = 0;
                rButton = document.getElementsByName("r");
                for (var i = 0; i < rButton.length; i++)
                        if (rButton[i].checked)
                            radius = rButton[i].value;
                return radius;
            }
            function validate(f){
                var x = parseFloat(document.getElementsByName("x")[0].value);
                if (x >= -3 && x <= 3){
                    var numberOfChecked = getNumberOfChecked();
                    if (document.getElementsByName("y")[0].selectedIndex>=0 && document.getElementsByName("y")[0].selectedIndex<=8){
                        if (numberOfChecked == 1) return true;
                        else {
                            f.childNodes[f.childNodes.length - 1].nodeValue = "У радиуса может быть только 1 значение";
                            return false;
                        }
                    }
                    else {
                        f.childNodes[f.childNodes.length - 1].nodeValue = "Y должен быть целым числом от -4 до 4";
                        return false;
                    }
                }
                else {
                    f.childNodes[f.childNodes.length - 1].nodeValue = "X должен быть от -3 до 3";
                    return false;
                }
            }
            function drawDefault(){
                var canvas = document.getElementById("canv");
                
                if (canvas.getContext) {
                    var ctx = canvas.getContext('2d');
                    ctx.clearRect(0, 0, 300, 300);
                    ctx.beginPath();
                    ctx.moveTo(150,0);
                    ctx.lineTo(150,300);
                    ctx.stroke();
                    ctx.moveTo(0,150);
                    ctx.lineTo(300,150);
                    ctx.stroke();
                    for (var i = 30; i < 300; i+=30){
                        ctx.moveTo(145,i);
                        ctx.lineTo(155,i);
                        ctx.stroke();
                        ctx.strokeText((300 - 2*i)/60, 160, i);
                        ctx.moveTo(i,145);
                        ctx.lineTo(i,155);
                        ctx.stroke();
                        ctx.strokeText((2*i - 300)/60, i, 140);
                    }
                    canvas.addEventListener('click',function(evt){
                        var x = (evt.pageX - canvas.offsetLeft - 150)/30;
                        var y = (150 - evt.pageY + canvas.offsetTop )/30;
                        if (getNumberOfChecked() == 1){
                            var r = getRadiusValue();
                            var params = "?x=" + x + "&y=" + y + "&r=" + r;
                            window.location.replace("<%=request.getContextPath()%>/app/controllerServlet" + params);
                        }
                        },false);
                    return ctx;
                }
            }
            function drawArea(){
                var ctx = drawDefault();
                if (ctx){
                    var numberOfChecked = getNumberOfChecked();  
                    if (numberOfChecked == 1){
                        var r = parseFloat(getRadiusValue());
                        ctx.beginPath();
                        ctx.moveTo(150 - r*30, 150);
                        ctx.lineTo(150, 150 - r*30);
                        ctx.lineTo(150,150);
                        ctx.fillStyle = "rgba(0,0,255,0.5)";
                        ctx.fill();
                        ctx.closePath();
                        ctx.fillRect(150-r*15, 150, r*15, r*30);
                        ctx.beginPath();
                        ctx.moveTo(150,150);
                        ctx.arc(150,150, r*30, 0, 3*Math.PI/2, true);
                        ctx.fill();
                    }
                    return ctx;
                }
            }
            function drawAreaWithPoint(x, y, r, point){
                var ctx = document.getElementById("canv").getContext('2d');
                if (ctx){
                    ctx.beginPath();
                    ctx.moveTo(150 - r*30, 150);
                    ctx.lineTo(150, 150 - r*30);
                    ctx.lineTo(150,150);
                    ctx.fillStyle = "rgba(0,0,255,0.5)";
                    ctx.fill();
                    ctx.closePath();
                    ctx.fillRect(150-r*15, 150, r*15, r*30);
                    ctx.beginPath();
                    ctx.moveTo(150,150);
                    ctx.arc(150,150, r*30, 0, 3*Math.PI/2, true);
                    ctx.fill();
                    ctx.closePath();
                    point(x,y,ctx);
                    return ctx;
                }
            }
            function makePoint(x,y,ctx){
                
            }
        </script>
    </head>
    <body>
        <canvas id="canv" width="300" height="300"
                style = "border: 1px solid black"> 
        </canvas>
        <script type ="text/javascript">
            drawDefault();
        </script>
        <br>
        <form action = "<%=request.getContextPath()%>/app/controllerServlet" method="GET" id = "myForm" onsubmit="return validate(this);">
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
            1:  <input type ="checkbox" name ="r" value = "1" onclick="drawArea()"><br>
            1.5:<input type ="checkbox" name ="r" value = "1.5" onclick="drawArea()"><br>
            2:  <input type ="checkbox" name ="r" value = "2" onclick="drawArea()"><br>
            2.5:<input type ="checkbox" name ="r" value = "2.5" onclick="drawArea()"><br>
            3:  <input type ="checkbox" name ="r" value = "3" onclick="drawArea()"><br>
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
                    out.write ("<div class = \"coords\">");
		    out.write("Координаты: (" + request.getParameter("x") + "; " + request.getParameter("y") + "), радиус: "
                            + request.getParameter("r") + "<br>");
                    out.write("</div>");
		    if (strike) {
		        out.write("Точка попадает в область. <br>");
		    }
		    else out.write("Точка не попадает в область. <br>");
        %>
        <jsp:useBean id="resultsBean" class="mbeans.Results" scope="session"/>
        <script type="text/javascript">
            drawAreaWithPoint(parseFloat(<%= x%>), parseFloat(<%= y%>), parseFloat(<%= r%>), 
                function (x,y,ctx){
                ctx.beginPath();
                ctx.moveTo(x*30 + 150, 150 - 30*y);
                ctx.arc(x*30 + 150, 150 - 30*y, 1, 0, 2* Math.PI, false);
                ctx.fillStyle = 'red';
                ctx.fill();
                ctx.closePath();
                });
        </script>
        <%
                    resultsBean.setStrike(strike);
                    resultsBean.setX(x);
                    resultsBean.setY(y);
                    resultsBean.setR(r);
                    int size = resultsBean.getX().size();
                    ArrayList<Double> xResults = resultsBean.getX();
                    ArrayList<Double> yResults = resultsBean.getY();
                    ArrayList<Double> rResults = resultsBean.getR();
                    ArrayList<Boolean> strikesResults = resultsBean.getStrikes();
                    out.write("<table>");
                    out.write("<tr>");
                    out.write("<th> x </th>");
                    out.write("<th> y </th>");
                    out.write("<th> r </th>");
                    out.write("<th> Попадает в область? </th>");
                    out.write("</tr>");
                    for (int i = 0; i < size; i++){
                        out.write("<tr>");
                        out.write("<td>");
                        //out.print(xResults.get(i));
                        out.print(request.getParameter("x"));
                        out.write("</td>");
                        out.write("<td>");
                        //out.print(yResults.get(i));
                        out.print(request.getParameter("y"));
                        out.write("</td>");
                        out.write("<td>");
                        //out.print(rResults.get(i));
                        out.print(request.getParameter("r"));
                        out.write("</td>");
                        out.write("<td>");
                        if (strikesResults.get(i))
                            out.print("Попадает");
                        else out.print("Не попадает");
                        out.write("</td>");
                        out.write("</tr>");
                    }
                    out.write("</table>");
		    out.write("<a href = ../index.jsp>Убрать результаты</a>");
                    System.out.println("qwer");
		}
                else if (request.getAttribute("isDataCorrect")!=null)
                    if (!((Boolean) request.getAttribute("isDataCorrect")).booleanValue())
	        	out.write("Неверные параметры GET запроса");
        %>
    </body>
</html>
