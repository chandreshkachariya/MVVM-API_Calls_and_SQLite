

import Foundation

class SearchViewModel {
    
    public var localSearch: LocalSearch? = nil
    public var searchImages: SearchImages? = nil

    func fetchLocalSearchResults(apikey:String, params: [String: Any]?, completion: @escaping (_ result : String) -> Void, failure: @escaping (_ result : String) -> Void) {
        
        APIManager.shared.makeRequest(url: apikey, params: params, withHttpMethod: .get) { (result: LocalSearch?) in
            if result?.statusCode ?? 0 == 200 {
                self.localSearch = nil
                self.localSearch = result
                completion(Key.API.status.success.rawValue)
            } else {
                failure("Data not found")
            }
        }
        failure: { (error) in
            if let errorValue = error as? String {
                print(errorValue)
                failure(errorValue)
            }
        }
    }
    
    func fetchSearchImagesResults(apikey:String, params: [String: Any]?, completion: @escaping (_ result : String) -> Void, failure: @escaping (_ result : String) -> Void) {
        
        APIManager.shared.makeRequest(url: apikey, params: params, withHttpMethod: .get) { (result: SearchImages?) in
            if result?.meta?.status ?? 0 == 200 {
                self.searchImages = nil
                self.searchImages = result
                completion(Key.API.status.success.rawValue)
            } else {
                failure("Data not found")
            }
        }
        failure: { (error) in
            if let errorValue = error as? String {
                print(errorValue)
                failure(errorValue)
            }
        }
    }
    
}

extension String {
    public func removeExtraSpaces() -> String {
        return self.replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil).trimmingCharacters(in: .whitespaces)
    }
}

