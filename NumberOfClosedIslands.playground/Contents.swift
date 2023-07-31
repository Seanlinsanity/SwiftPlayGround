import UIKit

/*
 
 Given a 2D grid consists of 0s (land) and 1s (water).  An island is a maximal 4-directionally connected group of 0s and a closed island is an island totally (all left, top, right, bottom) surrounded by 1s.

 Return the number of closed islands.

  

 Example 1:



 Input: grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
 Output: 2
 Explanation:
 Islands in gray are closed because they are completely surrounded by water (group of 1s).
 Example 2:



 Input: grid = [[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]]
 Output: 1
 Example 3:

 Input: grid = [[1,1,1,1,1,1,1],
                [1,0,0,0,0,0,1],
                [1,0,1,1,1,0,1],
                [1,0,1,0,1,0,1],
                [1,0,1,1,1,0,1],
                [1,0,0,0,0,0,1],
                [1,1,1,1,1,1,1]]
 Output: 2
  

 Constraints:

 1 <= grid.length, grid[0].length <= 100
 0 <= grid[i][j] <=1
 
 */

class Solution {
    var newGrid = [[Int]]()
    func closedIsland(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let columns = grid[0].count

        // edge case
        if rows <= 2 || columns <= 2 { return 0 }

        newGrid = grid
        // from top
        for column in 0..<columns {
            dfs(0, column, rows, columns)
        }

        // from bottom
        for column in 0..<columns {
            dfs(rows - 1, column, rows, columns)
        }

        // from left
        for row in 0..<rows {
            dfs(row, 0, rows, columns)
        }

        // from top
        for row in 0..<rows {
            dfs(row, columns - 1, rows, columns)
        }

        var result = 0
        for row in 1..<rows - 1 {
            for column in 1..<columns - 1 {
                if newGrid[row][column] == 0 {
                    result += 1
                    dfsClosedIsland(row, column, rows, columns)
                }
            }
        }

        return result
    }

    func dfs(_ row: Int, _ column: Int, _ rows: Int, _ columns: Int) {
        if row < 0 || row >= rows || column < 0 || column >= columns { return }
        if newGrid[row][column] != 0 { return }
        if newGrid[row][column] == 2 { return }

        newGrid[row][column] = 2
        dfs(row - 1, column, rows, columns)
        dfs(row + 1, column, rows, columns)
        dfs(row, column - 1, rows, columns)
        dfs(row, column + 1, rows, columns)
    }

    func dfsClosedIsland(_ row: Int, _ column: Int, _ rows: Int, _ columns: Int) {
        if row < 0 || row >= rows || column < 0 || column >= columns { return }
        if newGrid[row][column] != 0 { return }

        newGrid[row][column] = 1
        dfsClosedIsland(row - 1, column, rows, columns)
        dfsClosedIsland(row + 1, column, rows, columns)
        dfsClosedIsland(row, column - 1, rows, columns)
        dfsClosedIsland(row, column + 1, rows, columns)
    }

}

Solution().closedIsland([[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]])
Solution().closedIsland([[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]])
Solution().closedIsland([[1,1,1,1,1,1,1],
                         [1,0,0,0,0,0,1],
                         [1,0,1,1,1,0,1],
                         [1,0,1,0,1,0,1],
                         [1,0,1,1,1,0,1],
                         [1,0,0,0,0,0,1],
                         [1,1,1,1,1,1,1]])
