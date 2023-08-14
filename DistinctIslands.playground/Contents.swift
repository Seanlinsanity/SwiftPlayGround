import UIKit

/*
 Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical). You may assume all four edges of the grid are surrounded by water.

 Count the number of distinct islands. An island is considered to be the same as another if and only if one island has the same shape as another island (and not rotated or reflected).

 Notice that:

 11
 1
 and

  1
 11
 are considered different island, because we do not consider reflection / rotation.

 The length of each dimension in the given grid does not exceed 50.

 Example
 Example 1:

 Input:
   [
     [1,1,0,0,1],
     [1,0,0,0,0],
     [1,1,0,0,1],
     [0,1,0,1,1]
   ]
 Output: 3
 Explanation:
   11   1    1
   1        11
   11
    1
 Example 2:

 Input:
   [
     [1,1,0,0,0],
     [1,1,0,0,0],
     [0,0,0,1,1],
     [0,0,0,1,1]
   ]
 Output: 1
 */

class Solution {
    var visited = [[Bool]]()

    func numberofDistinctIslands(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let columns = grid[0].count
        visited = Array(repeating: Array(repeating: false, count: columns), count: rows)
        var islandSet = Set<String>()
        for row in 0..<rows {
            for column in 0..<columns {
                if grid[row][column] == 1 && !visited[row][column] {
                    let path = dfs(row, column, rows, columns, grid)
                    islandSet.insert(path)
                }
            }
        }
        return islandSet.count

    }

    func dfs(_ row: Int, _ column: Int, _ rows: Int, _ columns: Int, _ grid: [[Int]]) -> String {
        if row < 0 || row >= rows || column < 0 || column >= columns { return "n" }
        if grid[row][column] == 0 { return "n"}

        if visited[row][column] { return "n" }
        visited[row][column] = true
        return "1" + dfs(row - 1, column, rows, columns, grid) +
            dfs(row + 1, column, rows, columns, grid) +
            dfs(row, column - 1, rows, columns, grid) +
            dfs(row, column + 1, rows, columns, grid)
    }
}

Solution().numberofDistinctIslands([
    [1,1,0,0,1],
    [1,0,0,0,0],
    [1,1,0,0,1],
    [0,1,0,1,1]
])

Solution().numberofDistinctIslands([
    [1,1,0,0,0],
    [1,1,0,0,0],
    [0,0,0,1,1],
    [0,0,0,1,1]
])

