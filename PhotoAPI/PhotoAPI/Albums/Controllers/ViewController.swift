//
//  ViewController.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 13/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Class properties
    let viewModel: AlbumViewModel!

    // MARK: - Outlets
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate   = self
        view.dataSource = self
        view.register(AlbumCell.self, forCellWithReuseIdentifier: "cell")
        return view
    }()
    
    private lazy var topContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var albumCoutView: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textColor = .yellow
        return view
    }()
    
    // MARK: - Lifecycle
    init(viewModel: AlbumViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        //
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
    
    // MARK: - Outlets setup and styling
    private func setupOutlets(){
        setupNavigationController()
        setupCollectionView()
        setupTopContainerView()
    }
}


















// MARK: - Extension for Outlets setup and styling
extension ViewController {
    
    
    //Navigation controller
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func setupNavigationController(){
        self.title = "Albums"
        
 
    
        setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.largeTitleTextAttributes  = [.foregroundColor: UIColor.white]
    }
    
    //CollectionView
    private func setupCollectionView(){
        self.view.addSubview(collectionView)
        collectionView.constraintFourPoints(on: self.view, withTop: 200, bottom: 16, leading: 16, trailing: 16)
    }
    
    //Top Container view
    private func setupTopContainerView(){
        self.view.addSubview(topContainerView)
        topContainerView.minimumSafetyConstraintTop(on: self.view, withTop: 16, leading: 16, trailing: 16)
        topContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //
        setupAlbumCountView()
    }
    
    private func setupAlbumCountView(){
        self.topContainerView.addSubview(albumCoutView)
        albumCoutView.minimumSafetyConstraintTop(on: topContainerView, withTop: 16, leading: 16, trailing: 32)
    }
    
}
















// MARK: - Extension for UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        
        if let cellViewModel = viewModel.cellViewModel(at: indexPath){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AlbumCell{
                cell.viewModel = cellViewModel
                self.albumCoutView.text = "Album \(indexPath.row + 1) of \(viewModel.numberOfItems())"
                return cell
            }
        }
        
        fatalError()
    }
}

// MARK: - Extension for UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width  =  self.view.bounds.width - 32
        let height = self.view.bounds.height * 0.7 //60% of
        let size = CGSize(width: width, height: height)
    
        return size
    }
    
}

















extension ViewController: AlbumViewModelDelegate{
    func didFinishLoad() {
        self.collectionView.reloadData()
    }
}
