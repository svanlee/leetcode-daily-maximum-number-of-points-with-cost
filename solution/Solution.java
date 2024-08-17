// Solution in JAVA
class Solution {

    public long maxPoints(int[][] points) {
        // Get the number of columns in the points matrix
        int cols = points[0].length;

        // Initialize two arrays to store the maximum points for each column in the current and previous rows
        long[] currentRow = new long[cols], previousRow = new long[cols];

        // Iterate over each row in the points matrix
        for (int[] row : points) {
            // Initialize a variable to store the maximum value generated in the previous iteration of each loop
            long runningMax = 0;

            // Left to right pass: update the currentRow array with the maximum points considering the cells to the left
            for (int col = 0; col < cols; ++col) {
                runningMax = Math.max(runningMax - 1, previousRow[col]);
                currentRow[col] = runningMax;
            }

            // Reset runningMax for the right to left pass
            runningMax = 0;

            // Right to left pass: update the currentRow array with the maximum points considering the cells to the right
            for (int col = cols - 1; col >= 0; --col) {
                runningMax = Math.max(runningMax - 1, previousRow[col]);
                // Update the currentRow array with the maximum points considering both left and right cells
                currentRow[col] = Math.max(currentRow[col], runningMax) + row[col];
            }

            // Update the previousRow array for the next iteration
            previousRow = currentRow;
        }

        // Find the maximum points in the last row
        long maxPoints = 0;
        for (int col = 0; col < cols; ++col) {
            maxPoints = Math.max(maxPoints, previousRow[col]);
        }

        // Return the maximum points
        return maxPoints;
    }
}