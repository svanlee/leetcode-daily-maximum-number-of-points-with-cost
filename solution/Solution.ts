// Solution in TS
function maxPoints(points: number[][]): number {
  // Get the number of rows and columns in the grid
  let m: number = points.length; // number of rows
  let n: number = points[0].length; // number of columns

  // Initialize two arrays to store the maximum points for each column
  let current: number[] = new Array(n).fill(0); // current row's max points
  let previous: number[] = new Array(n); // previous row's max points

  // Initialize the previous array with the values from the first row
  for (let i: number = 0; i < n; i++) {
    previous[i] = points[0][i]; // copy values from first row
  }

  // Process each row
  for (let row: number = 1; row < m; row++) {
    // Initialize the peak value for the forward pass
    let peak: number = 0;

    // Forward pass: calculate the maximum points for each column
    for (let col: number = 0; col < n; col++) {
      // Calculate the peak value for this column
      peak = Math.max(peak - 1, previous[col]);

      // Update the current array with the maximum points for this column
      current[col] = points[row][col] + peak;
    }

    // Initialize the peak value for the backward pass
    peak = 0;

    // Backward pass: update the maximum points for each column
    for (let col: number = n - 1; col >= 0; col--) {
      // Calculate the peak value for this column
      peak = Math.max(peak - 1, previous[col]);

      // Update the current array with the maximum points for this column
      current[col] = Math.max(current[col], points[row][col] + peak);
    }

    // Swap the current and previous arrays
    let temp: number[] = previous;
    previous = current;
    current = temp;
  }

  // Return the maximum value in the previous array
  return Math.max(...previous);
}