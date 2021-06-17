/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.util.ArrayList;
import models.Node;

/**
 *
 * @author David
 */
public class Nodes {
    private static Nodes sNodes;
    private final ArrayList<Node> nodes;
    
    public static Nodes get() {
        if (sNodes == null) {
            sNodes = new Nodes();
        }
        return sNodes;
    }
    
    private Nodes() {
        nodes = new ArrayList<>();
    }
    
    public void addNode(Node node) {
        nodes.add(node);
    }
    
    public Node getNode (int i) {
        return nodes.get(i);
    }
    
    public ArrayList<Node> getNodes() {
        return nodes;
    }
    
    public int size() {
        return nodes.size();
    }
    
    public void clear() {
        nodes.clear();
    }
    
    public String getJSON() {
        String output = "[";
        for (int i = 0; i < nodes.size(); i++) {
            Node node = nodes.get(i);
            output += ("{\"id\": " + node.getId());
            output += ", \"name\": \"" + node.getName() + "\"";
            output += "}";
            if (i != nodes.size()-1) {
                output += ", ";
            }
        }
        output += "]";
        return output;
    }
    
    public Node cloneNode(int id) {
        for (int i = 0; i < nodes.size(); i++) {
            if (nodes.get(i).getId() == id) {
                return new Node(nodes.get(i).getId(), nodes.get(i).getName(), null);
            }
        }
        return null;
    }
}
