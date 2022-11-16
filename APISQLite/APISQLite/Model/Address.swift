
import Foundation
struct Address : Codable {
	let addressLine : String?
	let adminDistrict : String?
	let countryRegion : String?
	let formattedAddress : String?
	let locality : String?
	let postalCode : String?

	enum CodingKeys: String, CodingKey {

		case addressLine = "addressLine"
		case adminDistrict = "adminDistrict"
		case countryRegion = "countryRegion"
		case formattedAddress = "formattedAddress"
		case locality = "locality"
		case postalCode = "postalCode"
	}

}
