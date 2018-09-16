//: Playground - noun: a place where people can play

import UIKit

/*There are N rooms and you start in room 0.  Each room has a distinct number in 0, 1, 2, ..., N-1, and each room may have some keys to access the next room.

Formally, each room i has a list of keys rooms[i], and each key rooms[i][j] is an integer in [0, 1, ..., N-1] where N = rooms.length.  A key rooms[i][j] = v opens the room with number v.

Initially, all the rooms start locked (except for room 0).

You can walk back and forth between rooms freely.

Return true if and only if you can enter every room.

Example 1:

Input: [[1],[2],[3],[]]
Output: true
Explanation:
We start in room 0, and pick up key 1.
We then go to room 1, and pick up key 2.
We then go to room 2, and pick up key 3.
We then go to room 3.  Since we were able to go to every room, we return true.
Example 2:

Input: [[1,3],[3,0,1],[2],[0]]
Output: false
Explanation: We can't enter the room with number 2.
*/

func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    var keyDict = [Int: Bool]()
    
    visitNewRooms(keys: rooms[0], rooms: rooms, keyDict: &keyDict)
    
    print(keyDict)
    if keyDict[0] != nil && Array(keyDict.keys).count == rooms.count {
        return true
    }else if keyDict[0] == nil && Array(keyDict.keys).count == rooms.count - 1 {
        return true
    }else{
        return false
    }
    
}

func visitNewRooms(keys: [Int], rooms: [[Int]], keyDict: inout [Int: Bool]){
    for key in keys {
        print("key:", key)
        if keyDict[key] == nil {
            keyDict[key] = true
            print("newKey:", key)
            visitNewRooms(keys: rooms[key], rooms: rooms, keyDict: &keyDict)
        }
    }
}

print(canVisitAllRooms([[1,3], [3,0,1,5], [4], [2], [], []]))






