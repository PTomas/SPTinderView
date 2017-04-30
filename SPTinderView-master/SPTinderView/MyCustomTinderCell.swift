//
//  MyCustomTinderCell.swift
//  SPTinderView
//
//  Created by Suraj Pathak on 7/2/16.
//  Copyright © 2016 Suraj Pathak. All rights reserved.
//

import UIKit

class MyCustomTinderCell: SPTinderViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var profileView: UIImageView!
    override func awakeFromNib() {
        
       
        super.awakeFromNib()
        
        
        profileView  = UIImageView(frame:CGRect(x: 200, y: 250, width: 50, height: 50))
        profileView.image = UIImage(named:"default profile.jpg")
        self.addSubview(profileView)
        
        self.frame =  CGRect(x: 0, y: 0, width: 300, height: 400)
        profileView.clipsToBounds = true
        profileView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        imageView.contentMode = .scaleAspectFill
    }

}
