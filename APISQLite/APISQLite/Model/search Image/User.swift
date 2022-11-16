

import Foundation
struct User : Codable {
	let avatar_url : String?
	let banner_image : String?
	let banner_url : String?
	let profile_url : String?
	let username : String?
	let display_name : String?
	let description : String?
	let instagram_url : String?
	let website_url : String?
	let is_verified : Bool?

	enum CodingKeys: String, CodingKey {

		case avatar_url = "avatar_url"
		case banner_image = "banner_image"
		case banner_url = "banner_url"
		case profile_url = "profile_url"
		case username = "username"
		case display_name = "display_name"
		case description = "description"
		case instagram_url = "instagram_url"
		case website_url = "website_url"
		case is_verified = "is_verified"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		avatar_url = try values.decodeIfPresent(String.self, forKey: .avatar_url)
		banner_image = try values.decodeIfPresent(String.self, forKey: .banner_image)
		banner_url = try values.decodeIfPresent(String.self, forKey: .banner_url)
		profile_url = try values.decodeIfPresent(String.self, forKey: .profile_url)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		instagram_url = try values.decodeIfPresent(String.self, forKey: .instagram_url)
		website_url = try values.decodeIfPresent(String.self, forKey: .website_url)
		is_verified = try values.decodeIfPresent(Bool.self, forKey: .is_verified)
	}

}
