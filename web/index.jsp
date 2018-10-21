<%@ page import="servlets.Point" %>
<%@ page import="servlets.Points" %>
<%@ page import="java.util.ArrayList" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="MyPoints" class="servlets.Points" scope="session"/>
<html>
<head>
    <title>Lab2.0</title>
    <style> <%@include file='css/styles.css' %> </style>
    <script type="text/javascript"> <%@include file='js/jscript.js' %> </script>
</head>
<body>
<div class="container header">
    <a href="https://isu.ifmo.ru/pls/apex/f?p=2143:GR:103237292305101::NO:RP:GR_GR,GR_DATE:P3111," id="group"
       title="Ссылка на группу">Группа:P3211</a>
    <a href="https://isu.ifmo.ru/person/schwarzkv" id="name" title="Ссылка на автора">Черный Кирилл</a>
    <span id="task">Вариант:28123</span>
</div>
<div id="weatheranim" class="nope"></div>
<div class="container main" id="main">
    <p class="title"><b>Выберите входные данные</b></p>
    <form name="form" class="form" id="form" method="get" action="Lab2_0" target="_self">
        <p class="text">Выберите координату X:</p>
        <select class="Y element" name="X" id="X">
            <option value="-3">-3</option>
            <option value="-2">-2</option>
            <option value="-1">-1</option>
            <option value="0" selected>0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        <p class="text">Введите координату Y:</p>
        <input type="text" autocomplete="off" name="Y" id="Y" class="X element" placeholder="(-5..3)"
               onkeydown="resetValidationY()" maxlength="8">
        <div class="error" id="errY">123</div>

        <p class="text">Введите радиус R:</p>
        <input type="text" autocomplete="off" name="R" id="R" class="X element" placeholder="(1..4)"
               onkeydown="resetValidationR()"
            <%
                out.print("oninput=\"validationR();");
                Object obj2 = request.getSession().getAttribute("MyPoints");
            if (!(obj2 == null)) {
                ArrayList points2 = ((Points) obj2).getPoints();
                 if (points2.size() != 0){
                    for (int i = 0; i < points2.size(); ++i) {
                        Point point1 = (Point) points2.get(i);
                        if (!point1.getIsInArea().equals("inv operands")) {
                            out.print("drawPoint(\'graph\'," + point1.getX() + "," + point1.getY() + ",form.R.value);");
                        }
                    } out.print("\"");
                }
            }

            %> maxlength="8">
        <div class="error" id="errR">123</div>

        <input type="button" onclick="validation()" value="Отправить" class="R" id="sub" name="sub">
    </form>
    <span class="image"> <canvas height="400" width="400" id="graph" name="graph" onclick="interract()"
                                 class="graph"></canvas></span>
</div>
<div class="container resTable" name="resTable" id="resTable" frameborder="0" align="middle">
    <table class="pointTab">
        <tr>
            <th>X coord</th>
            <th>Y coord</th>
            <th>R radius</th>
            <th>Entering</th>
        </tr>
        <%
            Object obj = request.getSession().getAttribute("MyPoints");
            if (!(obj == null)) {
                ArrayList points = ((Points) obj).getPoints();
                for (int i = 0; i < points.size(); ++i) {
                    Point point1 = (Point) points.get(i);
                    String ent;
                    if (point1.getIsInArea().equals("true")) {
                        ent = "<span class=\"yes\">yes</span>";
                    } else if (point1.getIsInArea().equals("false")) {
                        ent = "<span class=\"no\">no</span>";
                    } else ent = "<span class=\"inv\">Inv operands</span>";
                    out.println("<tr>");
                    out.println("<td>" + point1.getX() + "</td>");
                    out.println("<td>" + point1.getY() + "</td>");
                    out.println("<td>" + point1.getR() + "</td>");
                    out.println("<td>" + ent + "</td>");
                    out.println("</tr>");
                }
                if (points.size() == 0) {
                    out.println("<tr><td colspan=4>История точек пуста</td></tr>");
                    out.println("<script type=\"text/javascript\"> window.onload = function(ev){ " +
                            " draw('graph', form.R.value);");
                    out.println("}</script>");
                } else {
                    Point p = (Point) points.get(points.size() - 1);
                    double lasrR;
                    if(!p.getIsInArea().equals("inv operands")){
                    lasrR = p.getR();} else lasrR = 4;
                    out.println("<script type=\"text/javascript\"> window.onload = function(ev){ " +
                                    "document.getElementById('form').R.value="+lasrR+";"+
                            " draw('graph'," + lasrR + ");");
                    for (int i = 0; i < points.size(); ++i) {
                        Point point1 = (Point) points.get(i);
                        if (!point1.getIsInArea().equals("inv operands")) {
                            out.println("drawPoint(\'graph\'," + point1.getX() + "," + point1.getY() + "," + lasrR + ");");
                        }
                    }
                    out.println("}</script>");
                }

            }
        %>
    </table>
</div>
</body>
</html>
