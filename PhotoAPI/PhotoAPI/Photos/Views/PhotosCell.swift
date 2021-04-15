//
//  PhotosCell.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 15/4/21.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    
    
    // MARK: - Class properties
    var viewModel: PhotoCellViewModel?{
        didSet{
            guard let viewModel = self.viewModel else { return }
            viewModel.delegate = self
            
            if let image = viewModel.photoData{
                photoImageView.image = UIImage(data: image)
            }
        }
    }
    
    
    // MARK: - Outlets
    private lazy var mainContainer: UIView = {
       let view = UIView()
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        return view
    }()
    
        
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupOutlets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.photoImageView.image = nil
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupOutlets()
    }
}
















// MARK: - Extension for Outlets setup and styling
extension PhotosCell{
    
    private func setupOutlets(){
        setupMainContainer()
        setupPhotoImageView()
    }
    
    private func setupMainContainer(){
        self.contentView.addSubview(mainContainer)
        self.mainContainer.pin(to: contentView)
        mainContainer.layer.cornerRadius = CGFloat(30)
    }
    
    private func setupPhotoImageView(){
        self.mainContainer.addSubview(photoImageView)
        photoImageView.pin(to: mainContainer)
    }
    
}

















// MARK: - Extension for PhotoCellViewModelDelegate
extension PhotosCell: PhotoCellViewModelDelegate{
    func didDownloadImage() {
        if let image = viewModel?.photoData{
            photoImageView.image = UIImage(data: image)
            setNeedsLayout()
        }
    }
}
