import UIKit

let rawStr = """
{
    "name" : "Stephen Curry",
    "id" : 30,
    "nba" : {
      "western" : {"name": "Gloden State Warriors"}
    }
}
"""

struct Team: Codable {
    var name: String
}

public struct Player: Codable {
    var name: String
    var id: Int
    var team: Team

    enum CodingKeys: String, CodingKey {
      case name, id, league = "nba"
    }
    
    enum ConferenceKeys: CodingKey {
        case western
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)
        
        let giftContainer = try container
              .nestedContainer(keyedBy: ConferenceKeys.self, forKey: .league)
        team = try giftContainer.decode(Team.self, forKey: .western)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)

        var giftContainer = container.nestedContainer(keyedBy: ConferenceKeys.self, forKey: .league)
        try giftContainer.encode(team, forKey: .western)
    }
    
}


let stringData = rawStr.data(using: .utf8)!

let decoder = JSONDecoder()
let encoder = JSONEncoder()

let james = try decoder.decode(Player.self, from: stringData)
print("curry: ", james)
let data = try! encoder.encode(james)
let encodedString = String(data: data, encoding: .utf8)!
print("jsonString: ", encodedString)
let employee = try decoder.decode(Player.self, from: data)
print("decode player: ", employee)
