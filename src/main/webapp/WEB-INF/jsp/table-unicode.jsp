<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Unicode</title>

    <style>
        *{
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            margin: auto;
            text-align: center;
        }

        h1{
            margin: 10px;
        }

        table{
            border-radius: 5px;
            border-collapse: collapse;
            width: 50%;
            background-color: #0d1321 ;
        }

        div:first-child{
            /*background-color: #0d1321;*/
            color: white;
            padding: 10px;
            border-radius: 5px;
        }
        div:last-child{
            background-color: #586f7c;
            padding: 20px;
            border-radius: 5px;
        }
        /*.empty{*/
            /*background-color: #710627;*/
            /*padding: 20px;*/
        /*}*/

    </style>

</head>
<body>

<c:choose>
    <c:when test="${nomTable != null}">
        <h1>${nomTable}</h1>
    </c:when>
    <c:otherwise>
        <h1>Les caractères de 0 à 255</h1>
    </c:otherwise>
</c:choose>

<%--todo: afficher les tables data d'une couleur différente si il est vide.--%>

<table>
<c:forEach var="alphabet" items="${alphabet}" varStatus="status">

    <c:if test="${status.index%10==0}">
        <tr>
    </c:if>

    <td>
        <c:choose>
            <%--Affichage hexa--%>
            <c:when test="${alphabetHexa != null}">
                <div>${alphabetHexa[status.index]}</div>
            </c:when>
            <%--Affichage Deci--%>
            <c:otherwise>
                <div>${alphabet}</div>
            </c:otherwise>

        </c:choose>

        <div>&#${alphabet};</div>
    </td>

</c:forEach>
</table>

</body>
</html>
