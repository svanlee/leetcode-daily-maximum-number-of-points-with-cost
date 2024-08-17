// Solution in PHP

class Solution {

/**
* @param Integer[][] $points
* @return Integer
*/
function maxPoints($points) {
// Get the number of rows and columns in the grid
$m = count($points); // number of rows
$n = count($points[0]); // number of columns

// Initialize two arrays to store the maximum points for each column
$current = array_fill(0, $n, 0); // current row's max points
$previous = array_fill(0, $n, 0); // previous row's max points

// Initialize the previous array with the values from the first row
for ($i = 0; $i < $n; $i++) { $previous[$i]=$points[0][$i]; // copy values from first row } // Process each row for
    ($row=1; $row < $m; $row++) { // Initialize the peak value for the forward pass $peak=0; // Forward pass: calculate
    the maximum points for each column for ($col=0; $col < $n; $col++) { // Calculate the peak value for this column
    $peak=max($peak - 1, $previous[$col]); // Update the current array with the maximum points for this column
    $current[$col]=$points[$row][$col] + $peak; } // Initialize the peak value for the backward pass $peak=0; //
    Backward pass: update the maximum points for each column for ($col=$n - 1; $col>= 0; $col--) {
    // Calculate the peak value for this column
    $peak = max($peak - 1, $previous[$col]);

    // Update the current array with the maximum points for this column
    $current[$col] = max($current[$col], $points[$row][$col] + $peak);
    }

    // Swap the current and previous arrays
    $temp = $previous;
    $previous = $current;
    $current = $temp;
    }

    // Return the maximum value in the previous array
    return max($previous);
    }
    }