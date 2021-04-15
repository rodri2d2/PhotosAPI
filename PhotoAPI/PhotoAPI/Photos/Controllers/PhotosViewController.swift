//
//  PhotosViewController.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 15/4/21.
//

import UIKit

class PhotosViewController: UIViewController {
    
    
    // MARK: - Class properties
    let viewModel: PhotosViewModel
    
    // MARK: - Outlets
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate   = self
        view.dataSource = self
        view.register(PhotosCell.self, forCellWithReuseIdentifier: "cell")
        return view
    }()
    
    // MARK: - Lifecycle
    init(viewModel: PhotosViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        
        self.viewModel.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.viewWasLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupOutlets()
    }
}

















// MARK: - Extension for Outlets setup and styling
extension PhotosViewController {
    
    private func setupOutlets(){
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupNavigationBar(){
        self.title = viewModel.album.title
    }
    
    private func setupCollectionView(){
        self.view.addSubview(collectionView)
        collectionView.pin(to: self.view)
    }
    
}

















// MARK: - Extension for UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        if let cellViewModel = viewModel.cellViewModel(at: indexPath){
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PhotosCell{
                cell.viewModel = cellViewModel
                return cell
            }
            
        }
        
        fatalError()
    }
}

// MARK: - Extension for UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            didSelectPhoto(indexPath: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width  =  (view.frame.size.width / 3) - 3
        let height =  width
        let size = CGSize(width: width, height: height)
    
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

















// MARK: - Class functionalities
extension  PhotosViewController{
    
    
    private func didSelectPhoto(indexPath: IndexPath){

        /*
         
            In this case better implement Coordinator Pattern
         
         */
            
    
       let photoCell = viewModel.cellViewModel(at: indexPath)
        if let imageData = photoCell?.photoData  {
            let vc = PhotoDetailViewController(image: imageData)
            present(vc, animated: true, completion: nil)
        }

    }
    
}

















extension PhotosViewController: PhotosViewModelDelegate{
    func didFinishLoadPhotos() {
        collectionView.reloadData()
    }
}
