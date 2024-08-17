// Solution in SWIFT

class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        // Get the number of rows and columns in the grid
        let m = points.count // number of rows
        let n = points[0].count // number of columns

        // Initialize two arrays to store the maximum points for each column
        var current = [Int](repeating: 0, count: n) // current row's max points
        var previous = [Int](repeating: 0, count: n) // previous row's max points

        // Initialize the previous array with the values from the first row
        for i in 0..<n {
            previous[i] = points[0][i] // copy values from first row
        }

        // Process each row
        for row in 1..<m {
            // Initialize the peak value for the forward pass
            var peak = 0

            // Forward pass: calculate the maximum points for each column
            for col in 0..<n {
                // Calculate the peak value for this column
                peak = max(peak - 1, previous[col])

                // Update the current array with the maximum points for this column
                current[col] = points[row][col] + peak
            }

            // Initialize the peak value for the backward pass
            peak = 0

            // Backward pass: update the maximum points for each column
            for col in (0..<n).reversed() {
                // Calculate the peak value for this column
                peak = max(peak - 1, previous[col])

                // Update the current array with the maximum points for this column
                current[col] = max(current[col], points[row][col] + peak)
            }

            // Swap the current and previous arrays
            (previous, current) = (current, previous)
        }

        // Return the maximum value in the previous array
        return previous.max()!
    }
}