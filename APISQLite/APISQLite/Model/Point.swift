
import Foundation
struct Point : Codable {
	let type : String?
	let coordinates : [Double]?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case coordinates = "coordinates"
	}

}
