//
//  LocalSearchTVCell.swift
//  APISQLite
//
//  Created by Chandresh Kachariya on 06/08/22.
//

import UIKit

protocol delegateLocalSearchTVCell {
    func openWebsite(indexPath: IndexPath)
    func openMap(indexPath: IndexPath)
}

class LocalSearchTVCell: UITableViewCell {

    var delegate: delegateLocalSearchTVCell?
    var indexPath: IndexPath?

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var btnViewWebsite: UIButton!
    @IBOutlet weak var btnViewMap: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(dictSearchInfo: LocalSearchInfo) {
        lblName.text = dictSearchInfo.name
    }
    
    @IBAction func btnViewWebsite(_ sender: Any) {
        if delegate != nil {
            delegate?.openWebsite(indexPath: indexPath!)
        }
    }
    
    @IBAction func btnViewMap(_ sender: Any) {
        if delegate != nil {
            delegate?.openMap(indexPath: indexPath!)
        }
    }
}
