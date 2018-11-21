<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Unicode</title>

    <style>
        table{
            /*border: solid black;*/
            border-spacing: 5px;
        }

        /*th, td {*/
            /*padding: 100px;*/
        /*}*/

        div:first-child{
            background-color: #757780;
            padding: 10px;
        }
        div:last-child{
            background-color: #c9c9ee;
            padding: 20px;
        }
        .empty{
            background-color: #710627;
            padding: 20px;
        }

    </style>

</head>
<body>
<h1>Les caractères de 0 à 255</h1>
<p />
<hr width="100%" />

<table>
<c:forEach var="alphabet" items="${alphabet}">

    <c:if test="${alphabet%10==1}">
        <tr>
    </c:if>

    <td>
        <%--<c:choose>--%>
            <%--<c:when test="${alphabet == ''}">--%>
                <%--<div class="empty">${alphabet}</div>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
                <%--<div>${alphabet}</div>--%>
            <%--</c:otherwise>--%>
        <%--</c:choose>--%>


        <div>${alphabet}</div>
        <div>&#${alphabet};</div>
    </td>

</c:forEach>
</table>

</body>
</html>
