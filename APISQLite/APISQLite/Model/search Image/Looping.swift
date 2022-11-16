

import Foundation
struct Looping : Codable {
	let mp4_size : String?
	let mp4 : String?

	enum CodingKeys: String, CodingKey {

		case mp4_size = "mp4_size"
		case mp4 = "mp4"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		mp4_size = try values.decodeIfPresent(String.self, forKey: .mp4_size)
		mp4 = try values.decodeIfPresent(String.self, forKey: .mp4)
	}

}
