//
//  MovieDesc.swift
//  Oops
//
//  Created by Ethan Gonsalves on 2023-03-02.
//

import UIKit

class MovieDesc: UILabel {

  
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    private func configure() {
        textColor = .white
        font = UIFont.systemFont(ofSize: 16, weight: .regular)

       
        numberOfLines = 7
         translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
    }
    
}
