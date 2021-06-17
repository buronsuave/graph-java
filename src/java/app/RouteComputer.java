package app;

import data.Nodes;
import data.Relations;
import java.util.ArrayList;
import math.Matrix;
import models.Node;
import models.Route;

/**
 *
 * @author David
 */
public class RouteComputer {

    public static ArrayList<Route> createRoutes(Node start, Node end) {
        Matrix matrix = Relations.get().getMatrix();
        ArrayList<Route> routes = new ArrayList<>();
        ArrayList<Node> inputs = new ArrayList<>();
        ArrayList<Node> outputs = new ArrayList<>();

        Node pivotNode = new Node(start.getId(), start.getName(), null);
        inputs.add(pivotNode);

        do {
            outputs.add(inputs.get(0));
            inputs.remove(0);
            pivotNode = outputs.get(outputs.size() - 1);
            for (int i = 0; i < matrix.getRows(); i++) {
                if (matrix.getValue(pivotNode.getId(), i) == 1) {
                    Node auxNode = Nodes.get().cloneNode(i);
                    auxNode.setNext(pivotNode);
                    inputs.add(auxNode);
                }
            }

            if (pivotNode.getId() == end.getId()) {
                routes.add(createRoute(pivotNode));
            }

        } while (inputs.size() > 0);

        return routes;
    }

    public static Route createRoute(Node node) {
        Route route = new Route();
        Node auxNode = node;
        do {
            route.append(auxNode);
            auxNode = auxNode.getNext();
        } while (auxNode.getNext() != null);
        route.append(auxNode);
        return route;
    }
}
