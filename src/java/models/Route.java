package models;

import java.util.ArrayList;

/**
 *
 * @author David
 */
public class Route {
    private final ArrayList<Node> nodes;
    
    public Route() {
        this.nodes = new ArrayList<>();
    }
    
    public Route(ArrayList<Node> nodes) {
        this.nodes = nodes;
    }
    
    public ArrayList<Node> getNodes() {
        return nodes;
    }
    
    public void append(Node node) {
        nodes.add(node);
    }
}
