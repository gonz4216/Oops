//
//  Oops
//
//  Created by Ethan Gonsalves on 2023-03-02.
//

import UIKit

class BackgroundImage: UIImageView {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
     
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: "movie")
        
    }
}
