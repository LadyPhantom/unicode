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

        // -------------Récupération des paramètres-------------------------------------------------
        ArrayList<Integer> liste = new ArrayList<>();
        String alpha = request.getParameter("alphabet");
        int min, max;
        String str_min = request.getParameter("t_min");
        String str_max = request.getParameter("t_max");
        String nom = request.getParameter("nom");

        // -------------Réalisation des tests--------------------------------------------------------

        if (str_min == null){
            min=1;
        }else{
            
        }


        // -------------Ajout des indices correctes--------------------------------------------------
        if ( alpha!= null){
            if (alpha.equals("ascii")){
                for (int i = 1 ; i<=255 ; i++ ){
                    liste.add(i);
                }
                request.setAttribute("alphabet",liste);
            }
        }

        String laVue = "table-unicode.jsp";
        getServletConfig().getServletContext()
                .getRequestDispatcher("/WEB-INF/jsp/"+laVue).forward(request, response);

    }

    public ArrayList<Integer> recupInterval(int min, int max){
        ArrayList<Integer> res = new ArrayList<>();

        return res;
    }

}
