//
//  AppConstants.swift
//  Olympic
//
//  Created by MacBook on 09/03/2023.
// Wahab
//Changing Number 1

import Foundation
enum AppConstants {
     
    enum api {
        static let baseHostUrl = "https://ocs-test-backend.onrender.com/"
        static let games = "games/"
        static let athletes = "athletes/"
        static let results  = "results/"
        static let photo  = "photo/"
    }
    
    enum keys {
        static let contentType = "Content-Type"
        static let jsonContentType = "application/json"
        static let acceptType = "Accept"
        static let authorization = "Authorization"
        static let host = "Host"
    }
    
    enum httpMethod {
        static let post = "POST"
        static let get = "GET"
        static let delete = "DELETE"
        static let put = "PUT"
    }
    
    enum MedalScore {
        static let gold = 5
        static let silver = 3
        static let bronze = 1
    }
    
}
