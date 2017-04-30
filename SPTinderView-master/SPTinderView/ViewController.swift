//
//  ViewController.swift
//  SPTinderView
//
//  Created by Suraj Pathak on 3/2/16.
//  Copyright © 2016 Suraj Pathak. All rights reserved.
//

import UIKit



class MyTinderCell: SPTinderViewCell {
    let titleLabel: UILabel = UILabel(frame: CGRect.zero)
    let imageView: UIImageView = UIImageView(frame: CGRect.zero)
    let profileView: UIImageView = UIImageView(frame: CGRect.zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required init(reuseIdentifier: String) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 400))
        self.backgroundColor = UIColor.white
        titleLabel.frame = CGRect(x: 0, y: self.frame.height - 50, width: self.frame.width, height: 50)
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 50)
        profileView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor.lightGray
        self.addSubview(profileView)
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.cornerRadius = 6.0
    }
}

class ViewController: UIViewController {
    @IBOutlet var tinderView: SPTinderView!
    @IBOutlet var composeButton: UIBarButtonItem!
    //let newViewController = MessageController()
    let cellIdentifier = "MyTinderCell"
    var cellCount = 6
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tinderView.frame = self.view.frame
        tinderView.registerClass(MyTinderCell.self, forCellReuseIdentifier: cellIdentifier)
        tinderView.dataSource = self
        tinderView.delegate = self
        tinderView.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.red
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "REFREASH", style: .done, target: self, action: #selector (ViewController.onReload))
        let yesButton = UIButton(frame: CGRect(x: 300, y: 580, width: 100, height: 100))
        yesButton.setImage(#imageLiteral(resourceName: "yes.jpg"), for: .normal)
        yesButton.addTarget(self, action: #selector(getter: tinderView), for: .touchUpInside)
        self.view.addSubview(yesButton)
        let noButton = UIButton(frame: CGRect(x: 20, y: 580, width: 100, height: 100))
        noButton.setImage(#imageLiteral(resourceName: "no.jpg"), for: .normal)
        noButton.addTarget(self, action: #selector(getter: tinderView), for: .touchUpInside)
        self.view.addSubview(noButton)
        //composeButton = UIBarButtonItem(title: "Messages", style: .done, target: self, action: #selector (navigationController?.pushViewController(newViewController, animated: true)))
        
        //let MessageController = self.storyboard?.instantiateViewControllerWithIdentifier("MessageController") as? MessageController
        //self.navigationController?.pushViewController(MessageController.swift!, animated: true)
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onReload() {
        cellCount += 1
        tinderView.reloadData()
    }
}

extension ViewController: SPTinderViewDataSource, SPTinderViewDelegate{
    
    func numberOfItemsInTinderView(_ view: SPTinderView) -> Int {
        return cellCount
    }
    
    func tinderView(_ view: SPTinderView, cellAt index: Int) -> SPTinderViewCell? {
        if let cell = tinderView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MyTinderCell {
            cell.profileView.image = TinderModel.spesificImage()
            cell.titleLabel.text = "Dev No: \(index+1)"
            cell.imageView.image = TinderModel.randomImage()
            return cell
        }
        return nil
    }
    
    func tinderView(_ view: SPTinderView, didMoveCellAt index: Int, towards direction: SPTinderViewCellMovement) {
        print("\(direction)")
        var imageViewR : UIImageView
        imageViewR  = UIImageView(frame:CGRect(x: 160, y: 300, width: 100, height: 100))
        imageViewR.image = UIImage(named:"yes.jpg")
        self.view.addSubview(imageViewR)
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when) {
        imageViewR.isHidden = true
        }
    }
}
