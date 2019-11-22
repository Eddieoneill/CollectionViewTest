//
//  ViewController.swift
//  UICollectionView
//
//  Created by Edward O'Neill on 11/20/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

struct CustomData {
    var title: String
    var image: UIImage
    var url: String
}

class ViewController: UIViewController {
    
    let data = [
        CustomData(title: "test1", image: #imageLiteral(resourceName: "valya-polishchuk-nmFtns_cbbU-unsplash"), url: "maxcode.io/courses"),
        CustomData(title: "test2", image: #imageLiteral(resourceName: "sincerely-media-0LKJVPJtDnQ-unsplash"), url: "maxcode.io/courses"),
        CustomData(title: "test3", image: #imageLiteral(resourceName: "jed-villejo-ZlnDr_5FgHQ-unsplash"), url: "maxcode.io/courses"),
        CustomData(title: "test4", image: #imageLiteral(resourceName: "anton-levin-P8prss71psk-unsplash"), url: "maxcode.io/courses"),
        CustomData(title: "test4", image: #imageLiteral(resourceName: "bruno-cervera-TVmskAtKQlQ-unsplash"), url: "maxcode.io/courses"),
        CustomData(title: "test4", image: #imageLiteral(resourceName: "Image from iOS"), url: "maxcode.io/courses"),
        CustomData(title: "test4", image: #imageLiteral(resourceName: "insung-yoon-YWS9jxfkYTw-unsplash"), url: "maxcode.io/courses"),
        CustomData(title: "test4", image: #imageLiteral(resourceName: "riley-UznvSv-TjNg-unsplash"), url: "maxcode.io/courses"),
        CustomData(title: "test5", image: #imageLiteral(resourceName: "johannes-plenio-Tuv7CxNlW1o-unsplash"), url: "maxcode.io/courses")
    ]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
//        view.backgroundColor = .white
//        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, constant: 0.5).isActive = true
        
        if traitCollection.userInterfaceStyle == .light {
            collectionView.backgroundColor = .white
            view.backgroundColor = .white
        } else {
            collectionView.backgroundColor = .black
            view.backgroundColor = .black
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if traitCollection.userInterfaceStyle == .light {
            collectionView.backgroundColor = .white
            view.backgroundColor = .white
        } else {
            collectionView.backgroundColor = .black
            view.backgroundColor = .black
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    
    
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "jed-villejo-ZlnDr_5FgHQ-unsplash")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
