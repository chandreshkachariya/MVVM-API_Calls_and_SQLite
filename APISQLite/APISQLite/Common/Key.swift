
import Foundation

struct Key  {
    struct API {
        enum status: String {
            case success
            case unauthorized
            case interServerError
            case dataNotFound
        }
    }
}
