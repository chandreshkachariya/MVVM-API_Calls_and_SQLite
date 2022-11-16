

import Foundation
struct SearchImagesData : Codable {
	let type : String?
	let id : String?
	let url : String?
	let slug : String?
	let bitly_gif_url : String?
	let bitly_url : String?
	let embed_url : String?
	let username : String?
	let source : String?
	let title : String?
	let rating : String?
	let content_url : String?
	let source_tld : String?
	let source_post_url : String?
	let is_sticker : Int?
	let import_datetime : String?
	let trending_datetime : String?
	let images : Images?
	let user : User?
	let analytics_response_payload : String?
	let analytics : Analytics?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case id = "id"
		case url = "url"
		case slug = "slug"
		case bitly_gif_url = "bitly_gif_url"
		case bitly_url = "bitly_url"
		case embed_url = "embed_url"
		case username = "username"
		case source = "source"
		case title = "title"
		case rating = "rating"
		case content_url = "content_url"
		case source_tld = "source_tld"
		case source_post_url = "source_post_url"
		case is_sticker = "is_sticker"
		case import_datetime = "import_datetime"
		case trending_datetime = "trending_datetime"
		case images = "images"
		case user = "user"
		case analytics_response_payload = "analytics_response_payload"
		case analytics = "analytics"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		bitly_gif_url = try values.decodeIfPresent(String.self, forKey: .bitly_gif_url)
		bitly_url = try values.decodeIfPresent(String.self, forKey: .bitly_url)
		embed_url = try values.decodeIfPresent(String.self, forKey: .embed_url)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		rating = try values.decodeIfPresent(String.self, forKey: .rating)
		content_url = try values.decodeIfPresent(String.self, forKey: .content_url)
		source_tld = try values.decodeIfPresent(String.self, forKey: .source_tld)
		source_post_url = try values.decodeIfPresent(String.self, forKey: .source_post_url)
		is_sticker = try values.decodeIfPresent(Int.self, forKey: .is_sticker)
		import_datetime = try values.decodeIfPresent(String.self, forKey: .import_datetime)
		trending_datetime = try values.decodeIfPresent(String.self, forKey: .trending_datetime)
		images = try values.decodeIfPresent(Images.self, forKey: .images)
		user = try values.decodeIfPresent(User.self, forKey: .user)
		analytics_response_payload = try values.decodeIfPresent(String.self, forKey: .analytics_response_payload)
		analytics = try values.decodeIfPresent(Analytics.self, forKey: .analytics)
	}

}
