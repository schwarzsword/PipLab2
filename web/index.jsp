<%@ page import="servlets.Points" %>
<%@ page import="java.io.IOException" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="MyPoints" class="servlets.Points" scope="session"/>
<html>
<head>
    <title>Lab2.0</title>
    <style> <c:import url='css/styles.css' /> </style>
    <script type="text/javascript"> <c:import url='js/jscript.js' /> </script>
</head>
<body>
<div class="container header">
    <a href="https://isu.ifmo.ru/pls/apex/f?p=2143:GR:103237292305101::NO:RP:GR_GR,GR_DATE:P3111," id="group"
       title="Ссылка на группу">Группа:P3211</a>
    <a href="https://isu.ifmo.ru/person/schwarzkv" id="name" title="Ссылка на автора">Черный Кирилл</a>
    <span id="task">Вариант:21106</span>
</div>
<div class="container main" id="main">
    <p class="title"><b>Выберите входные данные</b></p>
    <form name="form" class="form" id="form" method="get" action="Lab2_0" target="_self">
        <p class="text">Выберите координату X:</p>
        <select class="Y element" id="X" onchange="setX()">
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
        <input class="text" readonly id="trueX" name="X" style="visibility: hidden; display: none" value="0">
        <p class="text">Введите координату Y:</p>
        <input type="text" autocomplete="off" name="Y" id="Y" class="X element" placeholder="(-5..3)"
               onkeydown="resetValidationY()" maxlength="8">
        <div class="error" id="errY">123</div>

        <p class="text">Введите радиус R:</p>
        <input type="text" autocomplete="off" name="R" id="R" class="X element" placeholder="(1..4)"
               onkeydown="resetValidationR()" oninput="validationR();
        <c:forEach var="point" items="${MyPoints}">
                drawPoint('graph', ${point.getX()}, ${point.getY()}, document.getElementById('R').value);
        </c:forEach>
                " maxlength="8">
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
        <c:choose>
            <c:when test="${MyPoints.isEmpty()}">
                <tr>
                    <td colspan="4">История точек будет отбражаться здесь</td>
                    <script> window.onload = function (ev) { draw('graph', form.R.value);  }
                    </script>
                </tr>
            </c:when>
            <c:otherwise>
                <script> window.onload = function (ev) { draw('graph', form.R.value);
                    document.getElementById('R').value = ${MyPoints.get(MyPoints.size()-1).getR()};
                    <c:forEach var="point" items="${MyPoints}">
                    drawPoint('graph', ${point.getX()}, ${point.getY()}, document.getElementById('R').value);
                    </c:forEach>
                }</script>
                <c:forEach var="point" items="${MyPoints}">
                    <tr>
                        <td><c:out value="${point.getX()}"/></td>
                        <td><c:out value="${point.getY()}"/></td>
                        <td><c:out value="${point.getR()}"/></td>
                        <td><c:out value="${point.getIsInArea()}"/></td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>

    </table>
</div>
</body>
</html>
