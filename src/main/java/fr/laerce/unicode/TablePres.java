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

        // -------------Récupération des paramètres--------------------------------------------------
        ArrayList<Integer> liste = new ArrayList<>();
        String alpha = request.getParameter("alphabet");
        int min=-1, max=-1;
        String str_min = request.getParameter("t_min");
        String str_max = request.getParameter("t_max");
        String nom = request.getParameter("nom");
        String typeAffichage = request.getParameter("typeAffichage");

        // -------------Récupération de la liste de characters---------------------------------------

        if (str_min != null) min = Integer.parseInt(str_min);
        if (str_max != null) max = Integer.parseInt(str_max);


//        System.out.println(Integer.toHexString(9556));
        liste = recupInterval(min, max, alpha);

        /* todo: test si typeAffichage=hexa
        *  et traduire la liste d'int en liste de string (Integer.toHexString)
        */

        /* todo: test si nom (de la table) est nul ou non
        *  si non, l'ajouter aux attributs de requete
        * */
        request.setAttribute("alphabet",liste);
        // -------------Ajout des indices correctes--------------------------------------------------
//        if ( alpha!= null){
//            if (alpha.equals("ascii")){
//                for (int i = 1536 ; i<=1791 ; i++ ){
//                    liste.add(i);
//                }
//                request.setAttribute("alphabet",liste);
//            }
//        }

        String laVue = "table-unicode.jsp";
        getServletConfig().getServletContext()
                .getRequestDispatcher("/WEB-INF/jsp/"+laVue).forward(request, response);

    }

    public ArrayList<Integer> recupInterval(int min, int max, String alpha){
        ArrayList<Integer> res = new ArrayList<>();

        // Test si min et/ou max sont défini ou pas.
        // Si non, on leur affecte les valeurs default.
        // Si oui, on vérifie qu'ils font parti de l'interval
        // de l'alphabet qu'on cherche à afficher.
        // Si ils dépassent les intervals, on leur affecte les valeurs default

        if ( (min == -1) && (max == -1) ){
            if (alpha.equals("ascii")){
                min = 1;
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

}
