import Foundation
struct LocalSearch : Codable {
	let authenticationResultCode : String?
	let brandLogoUri : String?
	let copyright : String?
	let resourceSets : [ResourceSets]?
	let statusCode : Int?
	let statusDescription : String?
	let traceId : String?

	enum CodingKeys: String, CodingKey {

		case authenticationResultCode = "authenticationResultCode"
		case brandLogoUri = "brandLogoUri"
		case copyright = "copyright"
		case resourceSets = "resourceSets"
		case statusCode = "statusCode"
		case statusDescription = "statusDescription"
		case traceId = "traceId"
	}
}
