//
//  TinderViewController.swift
//  SPTinderView
//
//  Created by Suraj Pathak on 10/2/16.
//  Copyright © 2016 Suraj Pathak. All rights reserved.
//

import UIKit

class TinderViewController: UIViewController {
    let cellIdentifier = "MyCustomTinderCell"
    @IBOutlet var tinderView: SPTinderView!
    @IBOutlet weak var UR: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tinderView.frame = self.view.frame
        tinderView.registerNib(UINib(nibName: "MyCustomTinderCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tinderView.dataSource = self
        tinderView.delegate = self
        tinderView.backgroundColor = UIColor.white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TinderViewController: SPTinderViewDataSource, SPTinderViewDelegate {
    func numberOfItemsInTinderView(_ view: SPTinderView) -> Int {
        return 100
    }
    
    func tinderView(_ view: SPTinderView, cellAt index: Int) -> SPTinderViewCell? {
        if let cell = tinderView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MyCustomTinderCell {
            cell.profileView.image = TinderModel.spesificImage()
            cell.imageView.image = TinderModel.randomImage()
            cell.titleLabel.text = "Dev No: \(index+1)"
            return cell
        }
        return nil
    }
    
    func tinderView(_ view: SPTinderView, didMoveCellAt index: Int, towards direction: SPTinderViewCellMovement) {
        print("\(direction)")
        var imageViewR : UIImageView
        imageViewR  = UIImageView(frame:CGRect(x: 200, y: 100, width: 50, height: 50))
        imageViewR.image = UIImage(named:"no.jpg")
        self.view.addSubview(imageViewR)
        let when = DispatchTime.now() + 1 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
        imageViewR.isHidden = true
        }
    }
}

        /*if let SPTinderViewCellMovement = SPTinderViewCellMovement.self as? Int, SPTinderViewCell.cellMovementChange == SPTinderViewCellMovement.left {
            var imageViewR : UIImageView
            imageViewR  = UIImageView(frame:CGRect(x: 200, y: 100, width: 50, height: 50))
            imageViewR.image = UIImage(named:"no.jpg")
            self.view.addSubview(imageViewR)
            let when = DispatchTime.now() + 1 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
            imageViewR.isHidden = true
            }
        }
        else{
            var imageViewR : UIImageView
            imageViewR  = UIImageView(frame:CGRect(x: 200, y: 100, width: 50, height: 50))
            imageViewR.image = UIImage(named:"yes.jpg")
            self.view.addSubview(imageViewR)
            let when = DispatchTime.now() + 1 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
            imageViewR.isHidden = 
                
                
                true
            }
        }
    }
}*/
       
