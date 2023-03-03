//
//  DetailsViewController.swift
//  Oops
//
//  Created by Ethan Gonsalves on 2023-03-02.
//

import UIKit


class DetailsViewController: UIViewController {
    
    
    let shareButton = UIButton()
    let gradient = CAGradientLayer()
    var movieName = MovieLabel()
    var movieDesc = MovieDesc()
    var movieImage = MovieImageView(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGradient()
        configureMovieImage()
        configureMovieDesc()
        configureMovieName()
        configureShare()
        view.backgroundColor = .systemBackground
        
    }
    
    @objc func presentShareSheet() {
        let shareSheet = UIActivityViewController(activityItems: [
        movieName,
        movieImage,
        movieDesc
        ], applicationActivities: nil)
        present(shareSheet, animated: true)
    }
    public func configure(imageString: String, movieName: String, MovieDesc: String) {
        movieImage.getImage(from: imageString)
        self.movieName.text = movieName
        self.movieDesc.text = MovieDesc
        
    }
    
    
    func configureMovieDesc() {
        view.addSubview(movieDesc)
        
        
        NSLayoutConstraint.activate([
            movieDesc.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 70),
            movieDesc.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieDesc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            movieDesc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureMovieName(){
        
        
        view.addSubview(movieName)
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 20),
            movieName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
            
        ])
        
        
    }
    
    func configureMovieImage() {
        view.addSubview(movieImage)
        
        
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            movieImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 350),
            movieImage.widthAnchor.constraint(equalToConstant: 250)
            
            
        ])
    }
    
    func configureShare() {
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.addTarget(self, action: #selector(presentShareSheet), for: .touchUpInside)
        view.addSubview(shareButton)
        let symbolConfigure = UIImage.SymbolConfiguration(pointSize: 130, weight: .bold, scale: .large)
        let symbol = UIImage(systemName: "square.and.arrow.up.circle.fill", withConfiguration: symbolConfigure)
        shareButton.setImage(symbol, for: .normal)
        shareButton.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 3.0)
        NSLayoutConstraint.activate([
            shareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shareButton.heightAnchor.constraint(equalToConstant: 70),
            shareButton.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    
    func configureGradient() {
        
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1).cgColor,
            UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x:1, y:1)
        gradient.endPoint = CGPoint(x:1, y:0)
        self.view.layer.addSublayer(gradient)
    }
    
    
}



