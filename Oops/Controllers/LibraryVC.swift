 

import UIKit


enum Section {
    case main
}
protocol LibraryVCDelegate: AnyObject {
    func didGetMovie(moiveImg: String)
}
 
class LibraryVC: UIViewController, UICollectionViewDelegate{
    
 
   weak var movieDelegate: LibraryVCDelegate?
     
//    var hasMoreMovies = true
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Movie>!
    
    var listOfIndexes: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        navigationController?.navigationBar.prefersLargeTitles = true
        configureCollectionView()
        configureDataSource()
        addMovie()
        getMovieDetails()
        
    }
    func addMovie() {
               let closeButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMovieOnTap))
               closeButton.tintColor = .systemBlue
               navigationItem.rightBarButtonItem = closeButton
           }
    @objc func addMovieOnTap() {
        
           }
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColoumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
    }
    
    func createThreeColoumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 150)
        return flowLayout
    }
    
    func configureDataSource() {
         
        dataSource = UICollectionViewDiffableDataSource<Section, Movie>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
             
            cell.backgroundColor = .systemBackground
             cell.set(movie: itemIdentifier)
            cell.layer.cornerRadius = 20
            
            return cell
        })
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movieName = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
   
        movieDelegate?.didGetMovie(moiveImg: movieName.image.original)

        let detailsVC = DetailsViewController()
            
        detailsVC.configure(imageString: movieName.image.original, movieName: movieName.name, MovieDesc: movieName.summary)
        navigationController?.pushViewController(detailsVC, animated: true)
        
     
        
        
       
    }
    
    
    
    func updateData(on listOfIndexes: [Movie]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.main])
        snapshot.appendItems(listOfIndexes)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }

    
    func getMovieDetails() {
        
        NetworkManager.shared.fetchMovie { [weak self] result in
            guard let self = self else {return} // memory leak
            
            switch result {
            
            case .success(let indexOfRM):

                self.listOfIndexes = indexOfRM
               
                
                self.updateData(on: self.listOfIndexes)
                
            case .failure(_):
                print("error, network call is not working")
            }
        }
    }
   
}





 
