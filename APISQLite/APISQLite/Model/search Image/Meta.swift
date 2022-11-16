

import Foundation
struct Meta : Codable {
	let status : Int?
	let msg : String?
	let response_id : String?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case msg = "msg"
		case response_id = "response_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		msg = try values.decodeIfPresent(String.self, forKey: .msg)
		response_id = try values.decodeIfPresent(String.self, forKey: .response_id)
	}

}
