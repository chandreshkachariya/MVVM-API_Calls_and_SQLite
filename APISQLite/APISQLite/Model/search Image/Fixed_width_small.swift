

import Foundation
struct Fixed_width_small : Codable {
	let height : String?
	let width : String?
	let size : String?
	let url : String?
	let mp4_size : String?
	let mp4 : String?
	let webp_size : String?
	let webp : String?

	enum CodingKeys: String, CodingKey {

		case height = "height"
		case width = "width"
		case size = "size"
		case url = "url"
		case mp4_size = "mp4_size"
		case mp4 = "mp4"
		case webp_size = "webp_size"
		case webp = "webp"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		height = try values.decodeIfPresent(String.self, forKey: .height)
		width = try values.decodeIfPresent(String.self, forKey: .width)
		size = try values.decodeIfPresent(String.self, forKey: .size)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		mp4_size = try values.decodeIfPresent(String.self, forKey: .mp4_size)
		mp4 = try values.decodeIfPresent(String.self, forKey: .mp4)
		webp_size = try values.decodeIfPresent(String.self, forKey: .webp_size)
		webp = try values.decodeIfPresent(String.self, forKey: .webp)
	}

}
