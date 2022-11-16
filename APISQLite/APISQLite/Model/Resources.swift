
import Foundation
struct Resources : Codable {
	let __type : String?
	let name : String?
	let point : Point?
	let address : Address?
	let phoneNumber : String?
	let website : String?
	let entityType : String?
	let geocodePoints : [GeocodePoints]?

	enum CodingKeys: String, CodingKey {

		case __type = "__type"
		case name = "name"
		case point = "point"
		case address = "Address"
		case phoneNumber = "PhoneNumber"
		case website = "Website"
		case entityType = "entityType"
		case geocodePoints = "geocodePoints"
	}

}
