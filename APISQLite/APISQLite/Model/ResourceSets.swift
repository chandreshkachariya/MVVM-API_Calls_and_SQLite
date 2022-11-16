
import Foundation
struct ResourceSets : Codable {
	let estimatedTotal : Int?
	let resources : [Resources]?

	enum CodingKeys: String, CodingKey {

		case estimatedTotal = "estimatedTotal"
		case resources = "resources"
	}
}
