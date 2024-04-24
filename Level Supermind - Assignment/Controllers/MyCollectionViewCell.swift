//
//  MyCollectionViewCell.swift
//  Level Supermind - Assignment
//
//  Created by Ameya Chorghade on 24/04/24.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var blueHEading: UILabel!
    @IBOutlet weak var subheadinglbl: UILabel!
    @IBOutlet weak var thirdLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func ConfigCell(data:DataSet) {
        
        imgView.image = data.image
        blueHEading.text = data.heading
        subheadinglbl.text = data.subheading1
        thirdLbl.text = data.subheading2
    }

}
