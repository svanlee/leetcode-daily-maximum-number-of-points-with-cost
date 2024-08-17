// Solution in CPP

auto init = []()
{
    // Initialize the input/output streams
    ios::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    return 'c';
}();

class Solution
{
public:
    long long maxPoints(vector<vector<int>> &points)
    {
        // Get the number of rows and columns in the points matrix
        const int m = points.size();
        const int n = points[0].size();

        // Create a 1D array dp to store the maximum points that can be achieved
        vector<long long> dp(n, 0);

        // Initialize the answer
        long long ans = 0;

        // Iterate over each row in the points matrix
        for (int i = 0; i < m; i++)
        {
            // Iterate over each column in the points matrix
            for (int j = 0; j < n; j++)
            {
                // Update the dp array with the points of the current cell
                dp[j] += points[i][j];
                // Update the answer with the maximum points achieved so far
                ans = max(ans, dp[j]);
            }

            // Initialize maxV to store the maximum value
            long long maxV = 0;

            // Iterate over each column in the points matrix from left to right
            for (int j = 0; j < n; j++)
            {
                // Update dp[j] with the maximum value considering the cells to the left
                maxV = dp[j] = max(maxV - 1, dp[j]);
            }

            // Initialize maxV to store the maximum value
            maxV = 0;
            // Iterate over each column in the points matrix from right to left
            for (int j = n - 1; j >= 0; j--)
            {
                // Update dp[j] with the maximum value considering the cells to the right
                maxV = dp[j] = max(maxV - 1, dp[j]);
            }
        }

        // Return the maximum points that can be achieved
        return ans;
    }
};