//
import UIKit

class MovieImageView: UIImageView {

 
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        layer.cornerRadius = 5
        clipsToBounds = true
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func getImage(from urlString: String) {
       
                
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {return}
            
            if error != nil {return}
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
