// Solution in CS
public class Solution
{
    public long MaxPoints(int[][] points)
    {
        // Get the number of rows and columns in the points matrix
        int m = points.Length;
        int n = points[0].Length;

        // Initialize a dynamic programming array to store the maximum points for each column
        long[] dp = new long[n];

        // Iterate over each row in the points matrix
        for (int i = 0; i < m; i++)
        {
            // Initialize a new dynamic programming array for the current row
            long[] newDp = new long[n];

            // Iterate over each column in the current row
            for (int j = 0; j < n; j++)
            {
                // Get the point value at the current position
                long point = points[i][j];

                // If this is not the first row, add the maximum points from the previous row
                if (i > 0)
                {
                    point += dp[j];
                }

                // If this is not the first column, try to extend the maximum points from the left
                if (j > 0)
                {
                    // If the current point is greater than the maximum points to the left minus 1, 
                    // update the maximum points to the left
                    if (point > newDp[j - 1] - 1)
                    {
                        int k = j;
                        while (k >= 0 && newDp[k] < point)
                        {
                            newDp[k] = point;
                            k -= 1;
                            point -= 1;
                        }
                    }
                    // Otherwise, use the maximum points to the left minus 1
                    else
                    {
                        newDp[j] = newDp[j - 1] - 1;
                    }
                }
                // If this is the first column, use the current point value
                else
                {
                    newDp[j] = point;
                }
            }

            // Update the dynamic programming array for the next iteration
            dp = newDp;
        }

        // Return the maximum points in the last row
        return dp.Max();
    }
}