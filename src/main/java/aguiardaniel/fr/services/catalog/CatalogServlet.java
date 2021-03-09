package aguiardaniel.fr.services.catalog;

import mediatek2021.Document;
import mediatek2021.Mediatek;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CatalogServlet", value = "/documents")
public class CatalogServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");

        System.out.println(type);
        if(type == null){
            List<Document> documentList = Mediatek.getInstance().catalogue(4);
            request.setAttribute("documents", documentList);
        }else{
            int docType = Integer.parseInt(type);
            System.out.println(docType);

            List<Document> documentList = Mediatek.getInstance().catalogue(docType);
            request.setAttribute("documents", documentList);
        }

        this.getServletContext().getRequestDispatcher("/catalog/catalog.jsp").forward(request, response);

    }
}
