package data;

import java.util.ArrayList;
import models.Route;

/**
 *
 * @author David
 */
public class Routes {
    private static Routes sRoutes;
    private ArrayList<Route> routes;
    
    public static Routes get() {
        if (sRoutes == null) {
            sRoutes = new Routes();
        }
        return sRoutes;
    }
    
    private Routes() {
        routes = new ArrayList<>();
    }

    public ArrayList<Route> getRoutes() {
        return routes;
    }

    public void setRoutes(ArrayList<Route> routes) {
        this.routes = routes;
    }
}
