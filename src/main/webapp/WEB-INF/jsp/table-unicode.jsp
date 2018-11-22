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
<%-- todo: afficher un titre différent selon les besoins --%>
<h1>Les caractères de 0 à 255</h1>

<table>
<c:forEach var="alphabet" items="${alphabet}" varStatus="status">

    <c:if test="${status.index%10==0}">
        <tr>
    </c:if>

    <td>
        <div>${alphabet}</div>
        <div>&#${alphabet};</div>
    </td>

</c:forEach>
</table>

</body>
</html>
