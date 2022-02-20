//
//  MakeTableViewCell.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 19/02/2022.
//

import UIKit
import RxSwift
import RxCocoa
class MakeTableViewCell: UITableViewCell {
var makeName = PublishSubject<String>()
    @IBOutlet weak var makeNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
  
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setMakeName(name : String){
        makeNameLabel.text = name
    }

}
