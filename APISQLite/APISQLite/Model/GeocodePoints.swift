

import Foundation
struct GeocodePoints : Codable {
	let type : String?
	let coordinates : [Double]?
	let calculationMethod : String?
	let usageTypes : [String]?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case coordinates = "coordinates"
		case calculationMethod = "calculationMethod"
		case usageTypes = "usageTypes"
	}
}
