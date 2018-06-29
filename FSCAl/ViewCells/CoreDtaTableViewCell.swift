//
//  CoreDtaTableViewCell.swift
//  FSCAl
//
//  Created by Admin on 29/06/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CoreDtaTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setPhotoCellWith(photo: Photo) {
        
        DispatchQueue.main.async {
            self.lbl.text = photo.title
            if let url = photo.image {
                self.img.loadImageUsingCacheWithURLString(url, placeHolder: UIImage(named: "placeholder"))
            }
        }
    }
}
