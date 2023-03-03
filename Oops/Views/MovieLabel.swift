//
//  MovieLabel.swift
//  Oops
//
//  Created by Ethan Gonsalves on 2023-03-02.
//

import UIKit

class MovieLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     
    private func configure() {
        textColor = .white
        font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        adjustsFontForContentSizeCategory = true
        
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
    }
    
}
