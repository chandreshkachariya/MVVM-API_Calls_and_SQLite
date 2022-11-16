//
//  ViewController.swift
//  APISQLite
//
//  Created by Chandresh Kachariya on 06/08/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    /***************IBOutlet*****************/
    @IBOutlet weak var tblView: UITableView!

    /***************Variables*****************/
    private var viewModel = SearchViewModel()
    var marrLocalSearchData : NSMutableArray = NSMutableArray()
    private let reuseIdentifier = "LocalSearchTVCell"
    private let refreshControl = UIRefreshControl()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initSetup()
        if ModelManager.getInstance().deleteAllSearchData() {
            print("All records were deleted.")
        }
        getLocalSearchData()
        
    }
    
    //Use this method for default initialization
    func initSetup() {
        ///Setup Tableview
        tblView.estimatedRowHeight = 44
        tblView.dataSource = self
        tblView.delegate = self
        tblView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tblView.tableFooterView = UIView.init()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tblView.addSubview(refreshControl)
    }
    
    //MARK: @IBAction
    @IBAction func btnViewImages(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewImagesVC") as? ViewImagesVC {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    //MARK: Other methods
    func getLocalSearchData() {
        refreshControl.beginRefreshing()
        marrLocalSearchData = NSMutableArray()
        marrLocalSearchData = ModelManager.getInstance().getAllLocalSearchData()
        if marrLocalSearchData.count == 0{
            requestLocalSearchResults()
        }
        refreshControl.endRefreshing()
        tblView.reloadData()
    }
    
    func addLocalSearchData() {
        let resourceSets = viewModel.localSearch?.resourceSets
        let resources: [Resources] = resourceSets?[0].resources ?? []
        for item in resources {
            let localSearchInfo: LocalSearchInfo = LocalSearchInfo()
            localSearchInfo.name = item.name ?? "Not found"
            
            let coordinates: [Double] = item.point?.coordinates ?? []
            if coordinates.count == 2 {
                localSearchInfo.latitude = "\(coordinates[0])"
                localSearchInfo.longitude = "\(coordinates[1])"
            }
            
            localSearchInfo.fulladdress = item.address?.formattedAddress ?? "Not found"
            localSearchInfo.website = item.website ?? "Not found"
            localSearchInfo.phonenumber = item.phoneNumber ?? "Not found"
            
            let isInserted = ModelManager.getInstance().addLocalSearchData(localSearchInfo: localSearchInfo)
            if isInserted {
                print("Record Inserted successfully.")
            } else {
                print("Error in inserting record.")
            }
        }
        getLocalSearchData()
    }
}


// MARK: - UITableView delegate datasource methods
extension ViewController: delegateLocalSearchTVCell {
    func openWebsite(indexPath: IndexPath) {
        let urlSting = (marrLocalSearchData[indexPath.row] as! LocalSearchInfo).website
        if let url = URL(string: urlSting), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func openMap(indexPath: IndexPath) {
        let lat = (marrLocalSearchData[indexPath.row] as! LocalSearchInfo).latitude
        let long = (marrLocalSearchData[indexPath.row] as! LocalSearchInfo).longitude
        
        let urlSting = "https://www.google.com/maps/@\(lat),\(long),15z"
        if let url = URL(string: urlSting), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        getLocalSearchData()
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marrLocalSearchData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocalSearchTVCell
        cell.setupData(dictSearchInfo: marrLocalSearchData[indexPath.row] as! LocalSearchInfo)
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - API Methods
extension ViewController {
    //Use this method for call api
    private func requestLocalSearchResults() {
        
        var params: [String: Any] = [:]
        params["query"] = "hospital"
        params["userLocation"] = "47.602038,-122.333964"
        params["key"] = "AthpKc52wjrCVUd51hK2qrPCe7OE4BP8rfkzsYHlWDBZdAopJH7af7uptSgIb7qs"
        
        viewModel.fetchLocalSearchResults(apikey: "https://dev.virtualearth.net/REST/v1/LocalSearch/", params: params) { status in
            self.refreshControl.endRefreshing()
            switch status {
            case Key.API.status.success.rawValue:
                DispatchQueue.main.async { [self] in
                    print("Success")
                    print("Total search:- \(viewModel.localSearch?.statusCode ?? 0)")
                    addLocalSearchData()
                }
            case Key.API.status.unauthorized.rawValue:
                print("Unauthorized")
            default:
                print(status)
            }
        } failure: { (error) in
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                print("Data not found")
            }
            print(error)
        }
    }
}
