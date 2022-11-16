//
//  ViewImagesVC.swift
//  APISQLite
//
//  Created by Chandresh Kachariya on 06/08/22.
//

import UIKit
import SDWebImage
import SDWebImageWebPCoder

class ViewImagesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    /***************Variables*****************/
    private var viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "View Images"
        
        requestLocalSearchResults()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "ViewImagesCVCell", bundle: nil), forCellWithReuseIdentifier: "ViewImagesCVCell")
    }
    
    // MARK: - UICollectionView

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.searchImages?.data?.count ?? 0
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewImagesCVCell", for: indexPath as IndexPath) as! ViewImagesCVCell
        
        let webpUrlString = viewModel.searchImages?.data?[indexPath.row].images?.original?.webp ?? ""
        
        let webPCoder = SDImageWebPCoder.shared
        SDImageCodersManager.shared.addCoder(webPCoder)
        guard let webpURL = URL(string: webpUrlString)  else {return cell}
        DispatchQueue.main.async {
            cell.imgView.sd_setImage(with: webpURL)
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - API Methods
extension ViewImagesVC {
    //Use this method for call api
    private func requestLocalSearchResults() {
        
        var params: [String: Any] = [:]
        params["api_key"] = "zkO0WivfBA8I5i4mLOpuW8WZIZMImzI5"
        params["q"] = "dog"
        params["limit"] = "50"
        params["offset"] = "0"
        params["rating"] = "g"
        params["lang"] = "e"

        viewModel.fetchSearchImagesResults(apikey: "https://api.giphy.com/v1/gifs/search", params: params) { status in

            switch status {
            case Key.API.status.success.rawValue:
                DispatchQueue.main.async { [self] in
                    print("Success")
                    print("Total search:- \(viewModel.searchImages?.meta?.status ?? 0)")
                    self.collectionView.reloadData()
                }
            case Key.API.status.unauthorized.rawValue:
                print("Unauthorized")
            default:
                print(status)
            }
        } failure: { (error) in
            DispatchQueue.main.async {

                print("Data not found")
            }
            print(error)
        }
    }
}
