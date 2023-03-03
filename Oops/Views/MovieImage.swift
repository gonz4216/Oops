//
//  MovieImage.swift
//  Oops
//
//  Created by Ethan Gonsalves on 2023-03-02.
//

import UIKit

class MovieImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentMode = .scaleAspectFit
        layer.cornerRadius = 20
        clipsToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
    
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.masksToBounds = false
        
    }

}
