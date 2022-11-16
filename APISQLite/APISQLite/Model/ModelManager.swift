
import UIKit

let sharedInstance = ModelManager()

class ModelManager: NSObject {
    
    var database: FMDatabase? = nil

    class func getInstance() -> ModelManager
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "apisqldemo.db"))
        }
        return sharedInstance
    }
    
    func addLocalSearchData(localSearchInfo: LocalSearchInfo) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO localsearch (name, latitude, longitude, fulladdress, website, phonenumber, additionalinfo) VALUES (?, ?, ?, ?, ?, ?, ?)", withArgumentsIn: [localSearchInfo.name, localSearchInfo.latitude, localSearchInfo.longitude, localSearchInfo.fulladdress, localSearchInfo.website, localSearchInfo.phonenumber, localSearchInfo.additionalinfo])
        sharedInstance.database!.close()
        return isInserted
    }
    
    func deleteAllSearchData() -> Bool {
        sharedInstance.database!.open()
        let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM localsearch", withArgumentsIn: nil)
        sharedInstance.database!.close()
        return isDeleted
    }
   
    func getAllLocalSearchData() -> NSMutableArray {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM localsearch", withArgumentsIn: nil)
        let marrLocalSearchInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let studentInfo : LocalSearchInfo = LocalSearchInfo()
                studentInfo.id = resultSet.string(forColumn: "id")
                studentInfo.name = resultSet.string(forColumn: "name")
                studentInfo.latitude = resultSet.string(forColumn: "latitude")
                studentInfo.longitude = resultSet.string(forColumn: "longitude")
                studentInfo.fulladdress = resultSet.string(forColumn: "fulladdress")
                studentInfo.website = resultSet.string(forColumn: "website")
                studentInfo.phonenumber = resultSet.string(forColumn: "phonenumber")
                studentInfo.additionalinfo = resultSet.string(forColumn: "additionalinfo")

                marrLocalSearchInfo.add(studentInfo)
            }
        }
        sharedInstance.database!.close()
        return marrLocalSearchInfo
    }
}
