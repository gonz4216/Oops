
import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseID = "IndexCell"  
    
    var movieImageView = MovieImageView(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(movie: Movie) {
        movieImageView.getImage(from: movie.image.original)
    }

    private func configure() {
        
        contentView.addSubview(movieImageView)
        let padding: CGFloat = 8
        
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            movieImageView.heightAnchor.constraint(equalToConstant: 250)
            
            
        ])
    }
}
