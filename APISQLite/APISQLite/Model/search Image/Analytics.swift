

import Foundation
struct Analytics : Codable {
	let onload : Onload?
	let onclick : Onclick?
	let onsent : Onsent?

	enum CodingKeys: String, CodingKey {

		case onload = "onload"
		case onclick = "onclick"
		case onsent = "onsent"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		onload = try values.decodeIfPresent(Onload.self, forKey: .onload)
		onclick = try values.decodeIfPresent(Onclick.self, forKey: .onclick)
		onsent = try values.decodeIfPresent(Onsent.self, forKey: .onsent)
	}

}
