<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Unicode</title>

    <style>
        *{
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            /*margin: auto;*/
            text-align: center;
        }

        form{
            border-radius: 5px;
            color: #304d6d;
            display:inline-block;
            background-color: #8693ab;
        }

        label{
            display: block;
            font-size:11px;
            font-weight:bold;
            float:left;
            margin: 0 20px 0 20px;
        }

        select{
            display: block;
            font-size:11px;
            border: none;
            margin:2px 0 20px 10px;
        }

        button{
            border-radius: 5px;
            padding: 5px;
            margin: 5px auto;
            font-size:11px;
            color: white;
            background-color: #607696;
            border:none;
        }

        input {
            display: block;
            font-size:11px;
            border:none;
            margin:15px;
        }

        button:hover{
            background-color: #304d6d;
        }

    </style>

</head>
<body>
<h2>Table de caractères Unicode</h2>

<form action="/table" method="get" >
    <div>
        <label>Liste des 256 premiers caractères</label>
        <input type="radio" name="alphabet" value="ascii">
        <label>Liste de l'alphabet arabe</label>
        <input type="radio" name="alphabet" value="arabe">
        <label>Liste de l'alphabet tibetain</label>
        <input type="radio" name="alphabet" value="tibetain">
        <label>Liste des katakana</label>
        <input type="radio" name="alphabet" value="katakana">
        <label>Liste des hiragana</label>
        <input type="radio" name="alphabet" value="hiragana">

        <label for="typeAffichage">Selectionnez un type:</label>
        <select name="typeAffichage">
            <option value="">Decimal</option>
            <option value="hexa">Hexadecimal</option>
        </select>

        <button type="submit">Afficher la table</button>
    </div>
</form>

<form action="/table" method="get" >
    <div>

        <p>Choix de la plage de l'Unicode à afficher :</p>

        <label for="t_min">Indice minimal de la table:</label>
        <input type="number" id="t_min" name="t_min" min="0" max="1000">


        <label for="t_max">Indice maximal de la table:</label>
        <input type="number" id="t_max" name="t_max" min="1" max="1000">

        <label for="nom">Donnez un nom à la table:</label>
        <input type="text" id="nom" name="nom">

        <label for="typeAffichage">Selectionnez un type:</label>
        <select name="typeAffichage" id="typeAffichage">
            <option value="">Decimal</option>
            <option value="hexa">Hexadecimal</option>
        </select>

        <button type="submit">Afficher la table</button>
    </div>
</form>

</body>
</html>