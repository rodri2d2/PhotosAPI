//
//  PhotoDetailViewController.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 15/4/21.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    
    // MARK: - Class Properties
    var image: Data
    
    // MARK: - Outlets
    private lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    
    // MARK: - Lifecycle
    init(image: Data) {
        
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
}



extension PhotoDetailViewController{
    
    private func setupOutlets(){
        setupNavigationBar()
        setupPhotoImageView()
    }
    
    private func setupNavigationBar(){
        self.view.backgroundColor = .black
    }
    
    private func setupPhotoImageView(){
        self.view.addSubview(photoImageView)
        self.photoImageView.pin(to: self.view)
        self.photoImageView.image = UIImage(data: image)
    }
}
