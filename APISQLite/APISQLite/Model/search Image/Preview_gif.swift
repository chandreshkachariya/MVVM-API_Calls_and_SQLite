

import Foundation
struct Preview_gif : Codable {
	let height : String?
	let width : String?
	let size : String?
	let url : String?

	enum CodingKeys: String, CodingKey {

		case height = "height"
		case width = "width"
		case size = "size"
		case url = "url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		height = try values.decodeIfPresent(String.self, forKey: .height)
		width = try values.decodeIfPresent(String.self, forKey: .width)
		size = try values.decodeIfPresent(String.self, forKey: .size)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}

}
