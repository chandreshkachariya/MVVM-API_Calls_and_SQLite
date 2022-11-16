

import Foundation
struct SearchImages : Codable {
	let data : [SearchImagesData]?
	let pagination : Pagination?
	let meta : Meta?

	enum CodingKeys: String, CodingKey {

		case data = "data"
		case pagination = "pagination"
		case meta = "meta"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		data = try values.decodeIfPresent([SearchImagesData].self, forKey: .data)
		pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
		meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
	}

}
