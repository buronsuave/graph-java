package data;

import math.Matrix;

/**
 *
 * @author David
 */
public class Relations {
    private static Relations sRelations;
    private Matrix relations;
    
    public static Relations get(){
        if (sRelations == null) {
            sRelations = new Relations();
        }
        return sRelations;
    }
    
    private Relations() {
        relations = new Matrix(1);
    }
    
    public void createMatrix(int dim) {
        relations = new Matrix(dim);
    }
    
    public void createRelation(int i, int j) {
        relations.setValue(i, j, 1);
    }
    
    public Matrix getMatrix() {
        return relations;
    }
    
    @Override
    public String toString() {
        String output = "";
        for (int i = 0; i < relations.getRows(); i++) {
            for (int j = 0; j < relations.getCols(); j++) {
                output += (relations.getValue(i, j) + ", ");
            }
            output += "\n";
        }
        return output;
    }
}
