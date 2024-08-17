# Solution in PY
from typing import List


class Solution:
    def maxPoints(self, points: List[List[int]]) -> int:
        # Get the number of rows and columns in the points matrix
        m = len(points)
        n = len(points[0])
        
        # Initialize a dynamic programming array to store the maximum points for each column
        dp = [0] * n
        
        # Iterate over each row in the points matrix
        for i in range(m):
            # Initialize a new dynamic programming array for the current row
            newDp = [0] * n
            
            # Iterate over each column in the current row
            for j in range(n):
                # Get the point value at the current position
                point = points[i][j]
                
                # If this is not the first row, add the maximum points from the previous row
                if i > 0:
                    point += dp[j]
                
                # If this is not the first column, try to extend the maximum points from the left
                if j > 0:
                    # If the current point is greater than the maximum points to the left minus 1, 
                    # update the maximum points to the left
                    if point > newDp[j - 1] - 1:
                        k = j
                        while k >= 0 and newDp[k] < point:
                            newDp[k] = point
                            k -= 1
                            point -= 1
                    # Otherwise, use the maximum points to the left minus 1
                    else:
                        newDp[j] = newDp[j - 1] - 1
                # If this is the first column, use the current point value
                else:
                    newDp[j] = point
            
            # Update the dynamic programming array for the next iteration
            dp = newDp
        
        # Return the maximum points in the last row
        return max(dp)