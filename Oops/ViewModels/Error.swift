//
//  Error.swift
//  Oops
//
//  Created by Ethan Gonsalves on 2023-03-01.
//
 

import Foundation
 

enum MovieError: String, Error {
    case invalidUrlLink     = "This link created an invalid request. Please try again"
    case unableToComplete   = "Unable to complete request. Please check your internet connection"
    case invalidResponse    = "Invalid response from server. Please try again"
    case invalidData        = "The data received from server was invalid. Please try again."
}
