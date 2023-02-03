//
//  APIError.swift
//  MindValleyTask
//
//  Created by Amr on 02/02/2023.
//

import Foundation

enum APIError: Error {
    
    case noInternetConnection
    case badRequest
    case unAuthenticated
    case serverError
    case decodingFailed
    case unknown
    
}
