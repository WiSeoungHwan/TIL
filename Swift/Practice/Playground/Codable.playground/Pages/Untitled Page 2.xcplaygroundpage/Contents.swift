
import Foundation

let jsonString = """
[
{
"latitude": 30.0,
"longitude": 40.0,
"additionalInfo": {
"elevation": 50.0
}
},
{
"latitude": 60.0,
"longitude": 120.0,
"additionalInfo": {
"elevation": 20.0
}
}
]
"""


struct Coordinate {
    var latitude: Double
    var longitude: Double
    var elevation: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case additionalInfo
    }
    enum AdditionalInfoKeys: String, CodingKey {
        case elevation
    }
}

extension Coordinate: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decode(Double.self, forKey: .latitude)
        longitude = try values.decode(Double.self, forKey: .longitude)
        
        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
    }
}

extension Coordinate: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        
        var additionalInfo = container.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        try additionalInfo.encode(elevation, forKey: .elevation)
    }
}

let jsonData = jsonString.data(using: .utf8)!
do {
    let objects = try JSONDecoder().decode([Coordinate].self, from: jsonData)
    objects.forEach { print($0) }
    
    let encoded = try JSONEncoder().encode(objects.first!)
    let decoded = try JSONDecoder().decode(Coordinate.self, from: encoded)
    print("encoded :", encoded)
    print("decoded :", decoded)
} catch {
    print(error.localizedDescription)
}
