# Solution in RUST

impl Solution {
    pub fn max_points(points: Vec<Vec<i32>>) -> i64 {
        // Initialize a 2D dp array with size (cols x 2)
        let mut dp: Vec<Vec<i64>> = vec![vec![0; 2]; points[0].len()];
        
        // Initialize midx to 0, which will be used to alternate between the two columns of dp
        let mut midx = 0;
        
        // Process each row in points
        for row in points.iter(){
            // Initialize curr_max to 0, which will be used to calculate the maximum points from left to right
            let mut curr_max = 0i64;
            
            // Calculate the maximum points from left to right
            for (i, _) in row.iter().enumerate(){
                // Update curr_max to be the maximum of the current value and the previous maximum minus 1
                curr_max = (curr_max-1).max(dp[i][1-midx]);
                // Update dp[i][midx] to be the current maximum
                dp[i][midx] = curr_max;
            }
            
            // Initialize curr_max to 0, which will be used to calculate the maximum points from right to left
            curr_max = 0i64;
            
            // Calculate the maximum points from right to left
            for (i, _) in row.iter().rev().enumerate(){
                // Update curr_max to be the maximum of the current value and the previous maximum minus 1
                curr_max = (curr_max-1).max(dp[row.len()-1-i][1-midx]);
                // Update dp[row.len()-1-i][midx] to be the maximum of the current maximum and the previous maximum plus the current point
                dp[row.len()-1-i][midx] = curr_max.max(dp[row.len()-1-i][midx]) + row[row.len()-1-i] as i64;
            }
            
            // Alternate between the two columns of dp
            midx = 1-midx;
        }
        
        // Initialize ret to the minimum possible value, which will be used to store the maximum points
        let mut ret = std::i64::MIN;
        
        // Find the maximum points in dp
        for i in 0..dp.len(){
            // Update ret to be the maximum of the current value and the previous maximum
            ret = ret.max(dp[i][1-midx]);
        } 
        
        // Return the maximum points
        return ret;
    }
}