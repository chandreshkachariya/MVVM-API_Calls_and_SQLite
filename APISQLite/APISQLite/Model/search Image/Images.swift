

import Foundation
struct Images : Codable {
	let original : Original?
	let downsized : Downsized?
	let downsized_large : Downsized_large?
	let downsized_medium : Downsized_medium?
	let downsized_small : Downsized_small?
	let downsized_still : Downsized_still?
	let fixed_height : Fixed_height?
	let fixed_height_downsampled : Fixed_height_downsampled?
	let fixed_height_small : Fixed_height_small?
	let fixed_height_small_still : Fixed_height_small_still?
	let fixed_height_still : Fixed_height_still?
	let fixed_width : Fixed_width?
	let fixed_width_downsampled : Fixed_width_downsampled?
	let fixed_width_small : Fixed_width_small?
	let fixed_width_small_still : Fixed_width_small_still?
	let fixed_width_still : Fixed_width_still?
	let looping : Looping?
	let original_still : Original_still?
	let original_mp4 : Original_mp4?
	let preview : Preview?
	let preview_gif : Preview_gif?
	let preview_webp : Preview_webp?
	let ImagesStill : ImagesStill?

	enum CodingKeys: String, CodingKey {

		case original = "original"
		case downsized = "downsized"
		case downsized_large = "downsized_large"
		case downsized_medium = "downsized_medium"
		case downsized_small = "downsized_small"
		case downsized_still = "downsized_still"
		case fixed_height = "fixed_height"
		case fixed_height_downsampled = "fixed_height_downsampled"
		case fixed_height_small = "fixed_height_small"
		case fixed_height_small_still = "fixed_height_small_still"
		case fixed_height_still = "fixed_height_still"
		case fixed_width = "fixed_width"
		case fixed_width_downsampled = "fixed_width_downsampled"
		case fixed_width_small = "fixed_width_small"
		case fixed_width_small_still = "fixed_width_small_still"
		case fixed_width_still = "fixed_width_still"
		case looping = "looping"
		case original_still = "original_still"
		case original_mp4 = "original_mp4"
		case preview = "preview"
		case preview_gif = "preview_gif"
		case preview_webp = "preview_webp"
		case ImagesStill = "ImagesStill"
	}

}
