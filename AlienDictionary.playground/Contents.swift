import UIKit

/*
 There is a dictionary containing words from an alien language for which we don’t know the ordering of the letters. Write a method to find the correct order of the letters in the alien language. It is given that the input is a valid dictionary and there exists an ordering among its letters.

 Example 1:

 Input: Words: ["ba", "bc", "ac", "cab"]
 Output: bac
 Explanation: Given that the words are sorted lexicographically by the rules of the alien language, so
 from the given words we can conclude the following ordering among its characters:

 1. From "ba" and "bc", we can conclude that 'a' comes before 'c'.
 2. From "bc" and "ac", we can conclude that 'b' comes before 'a'

 From the above two points, we can conclude that the correct character order is: "bac"
 Example 2:

 Input: Words: ["cab", "aaa", "aab"]
 Output: cab
 Explanation: From the given words we can conclude the following ordering among its characters:

 1. From "cab" and "aaa", we can conclude that 'c' comes before 'a'.
 2. From "aaa" and "aab", we can conclude that 'a' comes before 'b'

 From the above two points, we can conclude that the correct character order is: "cab"
 Example 3:

 Input: Words: ["ywx", "wz", "xww", "xz", "zyy", "zwz"]
 Output: ywxz
 Explanation: From the given words we can conclude the following ordering among its characters:

 1. From "ywx" and "wz", we can conclude that 'y' comes before 'w'.
 2. From "wz" and "xww", we can conclude that 'w' comes before 'x'.
 3. From "xww" and "xz", we can conclude that 'w' comes before 'z'
 4. From "xz" and "zyy", we can conclude that 'x' comes before 'z'
 5. From "zyy" and "zwz", we can conclude that 'y' comes before 'w'

 From the above five points, we can conclude that the correct character order is: "ywxz"
 */

class Solution {
    var visited = [Character: Bool]()
    var result = [Character]()
    func alienDictionary(_ words: [String]) -> String {
        // build edges
        var edges = [[Character]]()
        for index in 0..<words.count - 1 {
            let currentChars = Array(words[index])
            let nextChars = Array(words[index + 1])
            for charIndex in 0..<min(currentChars.count, nextChars.count) {
                let char1 = currentChars[charIndex]
                let char2 = nextChars[charIndex]
                if char1 != char2 {
                    edges.append([char1, char2])
                    break
                }
            }
        }

        // build graph
        var adjGraph = [Character: [Character]]()
        var chars = Set<Character>()
        for edge in edges {
            let from = edge[0]
            let to = edge[1]
            adjGraph[from] = adjGraph[from, default: []] + [to]
            visited[from] = false
            visited[to] = false
            chars.insert(from)
            chars.insert(to)
        }

        for char in chars {
            dfs(char, adjGraph)
        }

        return String(result.reversed())
    }

    func dfs(_ char: Character, _ adjGraph: [Character: [Character]]) {
        guard let isVisted = visited[char] else { return }
        if isVisted { return }

        visited[char] = true
        if let adjList = adjGraph[char] {
            for adj in adjList {
                dfs(adj, adjGraph)
            }
        }
        result.append(char)
    }

}

Solution().alienDictionary(["ba", "bc", "ac", "cab"])
Solution().alienDictionary(["cab", "aaa", "aab"])
Solution().alienDictionary(["ywx", "wz", "xww", "xz", "zyy", "zwz"])
