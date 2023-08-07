import UIKit

/*
 Given an m x n grid of characters board and a string word, return true if word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

  

 Example 1:


 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 Output: true
 Example 2:


 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
 Output: true
 Example 3:


 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
 Output: false
  

 Constraints:

 m == board.length
 n = board[i].length
 1 <= m, n <= 6
 1 <= word.length <= 15
 board and word consists of only lowercase and uppercase English letters.
 */

class Solution {
    var visited = [[Bool]]()
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let chars = Array(word)
        let rows = board.count
        let columns = board[0].count
        for row in 0..<rows {
            for column in 0..<columns {
                visited = Array(repeating: Array(repeating: false, count: columns), count: rows)
                if dfs(0, row, column, rows, columns, board, chars) {
                    return true
                }
            }
        }
        return false
    }

    func dfs(
        _ index: Int,
        _ row: Int,
        _ column: Int,
        _ rows: Int,
        _ columns: Int,
        _ board: [[Character]],
        _ chars: [Character]
    ) -> Bool {
        if row < 0 || row >= rows || column < 0 || column >= columns {
            return false
        }

        if visited[row][column] { return false }

        if chars[index] != board[row][column] {
            return false
        }

        if index == chars.count - 1 { return true }

        visited[row][column] = true
        if dfs(index + 1, row - 1, column, rows, columns, board, chars) ||
           dfs(index + 1, row + 1, column, rows, columns, board, chars) ||
           dfs(index + 1, row, column - 1, rows, columns, board, chars) ||
           dfs(index + 1, row, column + 1, rows, columns, board, chars) {
            return true
        }
        visited[row][column] = false
        return false
    }
}

Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")
Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE")
Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB")
