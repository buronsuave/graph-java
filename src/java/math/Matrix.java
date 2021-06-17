package math;

/**
 *
 * @author David
 */
public class Matrix {
    private final int [][] values;
    
    public Matrix(int dim) {
        values = new int[dim][dim];
        for (int i = 0; i < dim; i++) {
            values[i] = new int[dim];
            for (int j = 0; j < dim; j++) {
                values[i][j] = 0;
            }
        }
    }
    
    public int getRows() {
        return values.length;
    }
    
    public int getCols() {
        return values[0].length;
    }
    
    public int[][] getValues() {
        return values;
    }
    
    public void setValue(int i, int j, int value) {
        values[i][j] = value;
    }
    
    public int getValue(int i, int j) {
        return values[i][j];
    }
}
