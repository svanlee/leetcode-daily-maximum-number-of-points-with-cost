// Solution in JS
var maxPoints = function(points) {
    // Get the number of rows and columns in the grid
    let m = points.length;
    let n = points[0].length;

    // Initialize two arrays to store the maximum points for each column
    let current = new Array(n).fill(0);
    let previous = new Array(n);

    // Initialize the previous array with the values from the first row
    for (let i = 0; i < n; i++) {
        previous[i] = points[0][i];
    }

    // Process each row
    for (let row = 1; row < m; row++) {
        // Initialize the peak value for the forward pass
        let peak = 0;

        // Forward pass: calculate the maximum points for each column
        for (let col = 0; col < n; col++) {
            // Calculate the peak value for this column
            peak = Math.max(peak - 1, previous[col]);

            // Update the current array with the maximum points for this column
            current[col] = points[row][col] + peak;
        }

        // Initialize the peak value for the backward pass
        peak = 0;

        // Backward pass: update the maximum points for each column
        for (let col = n - 1; col >= 0; col--) {
            // Calculate the peak value for this column
            peak = Math.max(peak - 1, previous[col]);

            // Update the current array with the maximum points for this column
            current[col] = Math.max(current[col], points[row][col] + peak);
        }

        // Swap the current and previous arrays
        [previous, current] = [current, previous];
    }

    // Return the maximum value in the previous array
    return Math.max(...previous);
};