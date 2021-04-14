//
//  AlbumCell.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    // MARK: - Class properties
    var viewModel: AlbumCellViewModel?{
        didSet{
            guard let viewModel = self.viewModel else { return }
            albumTitleLabel.text = viewModel.titleText
        }
    }
    
    
    // MARK: - Outlets
    private lazy var albumTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.lineBreakMode = .byTruncatingTail
        view.adjustsFontSizeToFitWidth = false
        return view
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupOutlets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
















// MARK: - Extension for Outlets setup and styling
extension AlbumCell{
    
    private func setupOutlets(){
        setupTitleLabel()
    }
    
    
    //Album Title Label
    private func setupTitleLabel(){
        self.contentView.addSubview(albumTitleLabel)
        albumTitleLabel.pin(to: self.contentView)
    }
    
}
