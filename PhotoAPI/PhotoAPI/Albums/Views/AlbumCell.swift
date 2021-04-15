//
//  AlbumCell.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    // MARK: - Class properties
    var viewModel: AlbumCellViewModel? {
        didSet{
            guard let viewModel = self.viewModel else { return }
            viewModel.delegate = self
            albumTitleLabel.text = viewModel.titleText
        }
    }
    
    // MARK: - Outlets
    private lazy var superContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var albumTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textColor = .white
        view.numberOfLines = 2
        view.textAlignment = .left
        view.lineBreakMode = .byTruncatingTail
        view.adjustsFontSizeToFitWidth = false
        return view
    }()
    
    
    private lazy var albumImageView: UIImageView = {
       let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var textContainerView: UIView = {
        let view = UIView(frame: CGRect(x: .zero, y: .zero, width: self.contentView.frame.width, height: 150))
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
        self.albumImageView.image = nil
        self.albumTitleLabel.text = nil
        setupTextContainerView()
    }
}
















// MARK: - Extension for Outlets setup and styling
extension AlbumCell{
    
    private func setupOutlets(){
        setupSuperContainerView()
        setupAlbumImageView()
        setupTextContainerView()
        setupTitleLabel()
    }
    
    private func setupSuperContainerView(){
        self.contentView.addSubview(superContainerView)
        superContainerView.pin(to: self.contentView)
        superContainerView.layer.cornerRadius = CGFloat(50)
    }
    
    //Image View
    private func setupAlbumImageView(){
        
        self.superContainerView.addSubview(albumImageView)
        albumImageView.pin(to: superContainerView)
    }
    
    //textContainerView
    private func setupTextContainerView(){
        self.superContainerView.addSubview(textContainerView)
        textContainerView.minimumSafetyConstraintBottom(on: contentView, withBottom: 0, leading: 0, trailing: 0)
        textContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        let gradient = getGradient()
        textContainerView.layer.addSublayer(gradient)

    }
    
    private func getGradient() -> CAGradientLayer{
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = [UIColor.textContainerGradientTop.cgColor,
                           UIColor.textContainerGradientBottom.cgColor
        ]
        gradient.frame = textContainerView.frame
        return gradient
    }
    
    
    //Album Title Label
    private func setupTitleLabel(){
        self.textContainerView.addSubview(albumTitleLabel)
        albumTitleLabel.minimumSafetyConstraintTop(on: textContainerView, withTop: 64, leading: 16, trailing: 16)
    }
    
    

    

    
    

    
}

















extension AlbumCell: AlbumCellViewModelDelegate{
    func didFinishLoadImage() {
        if let image = viewModel?.imageData{
            albumImageView.image = UIImage(data: image)
        }
    }
}
