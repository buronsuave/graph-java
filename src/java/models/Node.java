package models;

/**
 *
 * @author David
 */
public class Node {
    private final int id;
    private String name;
    private Node next;
    
    public Node(int id, String name, Node next) {
        this.id = id;
        this.name = name;
        this.next = next;
    }
    
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Node getNext() {
        return next;
    }

    public void setNext(Node next) {
        this.next = next;
    }    
}

/**
 * []          []                []
 * [Nodos]     [Relaciones]      [Rutas]
 * 
 * 
 */
