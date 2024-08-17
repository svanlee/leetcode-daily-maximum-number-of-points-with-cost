# Solution in RUBY

def max_points(points)
  # Get the number of rows and columns in the grid
  m = points.size # number of rows
  n = points[0].size # number of columns

  # Initialize two arrays to store the maximum points for each column
  current = Array.new(n, 0) # current row's max points
  previous = Array.new(n, 0) # previous row's max points

  # Initialize the previous array with the values from the first row
  (0...n).each { |i| previous[i] = points[0][i] } # copy values from first row

  # Process each row
  (1...m).each do |row|
    # Initialize the peak value for the forward pass
    peak = 0

    # Forward pass: calculate the maximum points for each column
    (0...n).each do |col|
      # Calculate the peak value for this column
      peak = [peak - 1, previous[col]].max

      # Update the current array with the maximum points for this column
      current[col] = points[row][col] + peak
    end

    # Initialize the peak value for the backward pass
    peak = 0

    # Backward pass: update the maximum points for each column
    (n - 1).downto(0).each do |col|
      # Calculate the peak value for this column
      peak = [peak - 1, previous[col]].max

      # Update the current array with the maximum points for this column
      current[col] = [current[col], points[row][col] + peak].max
    end

    # Swap the current and previous arrays
    previous, current = current, previous
  end

  # Return the maximum value in the previous array
  previous.max
end