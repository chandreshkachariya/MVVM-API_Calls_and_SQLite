

import Foundation
struct Downsized_small : Codable {
	let height : String?
	let width : String?
	let mp4_size : String?
	let mp4 : String?

	enum CodingKeys: String, CodingKey {

		case height = "height"
		case width = "width"
		case mp4_size = "mp4_size"
		case mp4 = "mp4"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		height = try values.decodeIfPresent(String.self, forKey: .height)
		width = try values.decodeIfPresent(String.self, forKey: .width)
		mp4_size = try values.decodeIfPresent(String.self, forKey: .mp4_size)
		mp4 = try values.decodeIfPresent(String.self, forKey: .mp4)
	}

}
