package fr.laerce.unicode;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class TablePres extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //todo rename les "alphabet" en plagePredef

        // -------------Récupération des paramètres--------------------------------------------------
        // 1e formulaire
       String alpha = request.getParameter("alphabet"); //Nom de la plage prédéfini:
                                                            //Latin, arabe, hira/kata-kana,etc
        int min=-1, max=-1;
        // 2e formulaire
        String str_min = request.getParameter("t_min"); //min de la plage
        String str_max = request.getParameter("t_max"); //max de la plage
        String nom = request.getParameter("nom"); //nom de la table

        // Données communes aux 2 formulaires
        String typeAffichage = request.getParameter("typeAffichage"); //affichage decimal/hexa?
        ArrayList<Integer> liste;
        ArrayList<String> listeHexa;

        // -------------Récupération de la liste de characters---------------------------------------

        if (str_min != null) min = Integer.parseInt(str_min);
        if (str_max != null) max = Integer.parseInt(str_max);

        liste = recupInterval(min, max, alpha,nom);

        // Nom de la table par défaut ou non selon que l'utilisateur
        // a entré un nom ou pas.
        if (nom != null){
            request.setAttribute("nomTable",nom);
        }else{
            if ( (min == -1) && (max == -1) ){
                if (alpha.equals("ascii")){
                    nom = "Caractères de 0 à 255:";
                }else if(alpha.equals("arabe")){
                    nom = "Caractères arabes:";
                }else if(alpha.equals("tibetain")){
                    nom = "Caractères tibetain:";
                }else if(alpha.equals("katakana")){
                    nom = "Katakana:";
                }else if(alpha.equals("hiragana")){
                    nom = "Hiragana:";
                }
            }
            request.setAttribute("nomTable",nom);
        }

        if (typeAffichage.equals("hexa")){
            listeHexa=deciToHexa(liste);
            request.setAttribute("alphabetHexa",listeHexa);
        }

        request.setAttribute("alphabet",liste);

        // ---------Redirection-------------------------------------------
        String laVue = "table-unicode.jsp";
        getServletConfig().getServletContext()
                .getRequestDispatcher("/WEB-INF/jsp/"+laVue).forward(request, response);

    }

    public ArrayList<Integer> recupInterval(int min, int max, String alpha, String nom){
        ArrayList<Integer> res = new ArrayList<>();

        if ( (min == -1) && (max == -1) ){
            if (alpha.equals("ascii")){
                min = 0;
                max = 255;
            }else if(alpha.equals("arabe")){
                min = 1536;
                max = 1791;
            }else if(alpha.equals("tibetain")){
                min = 3840;
                max = 4095;
            }else if(alpha.equals("katakana")){
                min = 12448;
                max = 12543;
            }else if(alpha.equals("hiragana")){
                min = 12352;
                max = 12447;
            }
        }

        // todo vérification de la plage utilisateur

        for (int i=min ; i<=max ; i++){
            res.add(i);
        }

        return res;
    }

    public ArrayList<String> deciToHexa(ArrayList<Integer> liste){
        ArrayList<String> res = new ArrayList<>();

        for (int index : liste){
            res.add(Integer.toHexString(index));
        }

        return res;
    }

}
