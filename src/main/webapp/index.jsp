<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<h2>Table de caractères Unicode</h2>
<%--<p><a href="table"> Liste des 256 premiers caractères</a> </p>--%>
<p><a href="table?alphabet=ascii"> Liste des 256 premiers caractères</a> </p>

<br/><br/>
<form action="/table" method="get" >
    <input type="radio" name="alphabet" value="ascii">Liste des 256 premiers caractères<br/><br/>
    <input type="radio" name="alphabet" value="arabe">Liste de l'alphabet arabe<br/><br/>
    <input type="radio" name="alphabet" value="arabe">Liste de l'alphabet tibetain<br/><br/>
    <input type="radio" name="alphabet" value="arabe">Liste des katakana<br/><br/>
    <input type="radio" name="alphabet" value="arabe">Liste des hiragana<br/><br/>


    <br/><br/>
    <br/><br/>
    <label for="t_min">Choix des éléments à afficher :</label>
    <br/><br/>
    <label for="t_min">Indice minimal de la table:</label>
    <input type="number" id="t_min" name="t_min" min="0" max="1000">

        <br/><br/>

    <label for="t_max">Indice Maximal de la table:</label>
    <input type="number" id="t_max" name="t_max" min="1" max="1000">

        <br/><br/>

    <label for="nom">Donnez un nom à la table:</label>
    <input type="text" id="nom" name="nom" value="Table :">

        <br/><br/>

    <button type="submit">Afficher la table</button>
</form>

</body>
</html>