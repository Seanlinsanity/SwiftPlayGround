import UIKit

/*
 You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure and the arrival airports of one flight. Reconstruct the itinerary in order and return it.

 All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with "JFK". If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.

 For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
 You may assume all tickets form at least one valid itinerary. You must use all the tickets once and only once.

  

 Example 1:


 Input: tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
 Output: ["JFK","MUC","LHR","SFO","SJC"]
 Example 2:


 Input: tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
 Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
 Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"] but it is larger in lexical order.
  

 Constraints:

 1 <= tickets.length <= 300
 tickets[i].length == 2
 fromi.length == 3
 toi.length == 3
 fromi and toi consist of uppercase English letters.
 fromi != toi
 */

class Solution {
    // [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
    var result = [String]()
    var adjGraph = [String: [String]]()
    func findItinerary(_ tickets: [[String]]) -> [String] {
        // build graph
        for ticket in tickets {
            let from = ticket[0] // JFK
            let to = ticket[1] // MUC
            adjGraph[from] = adjGraph[from, default: []] + [to]
        }

        for (key, value) in adjGraph {
            adjGraph[key] = value.sorted()
        }

        result = ["JFK"]
        dfs("JFK", tickets.count)
        return result
    }

    @discardableResult func dfs(_ current: String, _ ticketCount: Int) -> Bool {
        if result.count == ticketCount + 1 {
            return true
        }

        if let adjList = adjGraph[current] {
            for (index, adj) in adjList.enumerated() {
                result.append(adj)
                var copyAdjList = adjList
                copyAdjList.remove(at: index)
                adjGraph[current] = copyAdjList

                if dfs(adj, ticketCount) {
                    return true
                }

                result.removeLast()
                adjGraph[current] = adjList
            }
        }

        return false
    }
}

Solution().findItinerary([["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]])
Solution().findItinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]])
