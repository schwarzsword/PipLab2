package servlets;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class AreaCheckServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            double x = Double.parseDouble(request.getParameter("X"));
            double y = Double.parseDouble(request.getParameter("Y"));
            double r = Double.parseDouble(request.getParameter("R"));


            Point point = new Point(x, y, r);
            point.setIsInArea();

            Points list = (Points) request.getSession().getAttribute("MyPoints");

            list.add(point);


            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println("<!DOCTYPE HTML> <html> <head> <meta charset='UTF-8'> <title>Points</title> <link href=\"css/page.css\" rel=\"stylesheet\"> " +
                    "            </head> <body>");
            out.println("<br> <table class='tab' align='center' cellspacing=\"1px\"> <tr><td><h3>X coord</h3></td><td><h3>Y coord</h3></td><td><h3>Radius R</h3></td><td><h3>Entrance</h3></td></tr>");

            for (int i = 0; i < list.size(); i++) {
                Point p = (Point) list.get(i);
                out.println("<tr>");
                out.println("<td>");
                out.println(p.getX());
                out.println("</td>");
                out.println("<td>");
                out.println(p.getY());
                out.println("</td>");
                out.println("<td>");
                out.println(p.getR());
                out.println("</td>");
                out.println("<td>");
                out.println(p.getIsInArea());
                out.println("</td>");
                out.println("</tr>");
            }

            out.println("</table> <a href=/><button class=\"ret\">Return</button></a></body> </html>");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/");
        }
    }
}