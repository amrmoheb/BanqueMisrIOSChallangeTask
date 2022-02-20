//
//  ModelsTableViewCell.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 20/02/2022.
//

import UIKit

class ModelsTableViewCell: UITableViewCell {

    @IBOutlet weak var modelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setModelName(name: String) {
        modelName.text = name
    }
}
