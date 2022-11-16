

import Foundation
struct Pagination : Codable {
	let total_count : Int?
	let count : Int?
	let offset : Int?

	enum CodingKeys: String, CodingKey {

		case total_count = "total_count"
		case count = "count"
		case offset = "offset"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		total_count = try values.decodeIfPresent(Int.self, forKey: .total_count)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		offset = try values.decodeIfPresent(Int.self, forKey: .offset)
	}

}
