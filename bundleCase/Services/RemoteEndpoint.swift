//
//  RemoteEndpoint.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//

import Foundation

enum RemoteEndpoint {
    case getPackages
    case getPackagesSources(id: String)
}

extension RemoteEndpoint: EndpointType {
    var baseURL: URL {
        switch self {
        case .getPackages, .getPackagesSources:
            guard let url = URL(string: URLs.baseUrl) else { fatalError("baseURL could not be configured.")}
            return url
        }
    }
    
    var path: String {
        switch self {
        case .getPackages:
            return ""
        case .getPackagesSources(let id):
            return id
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getPackages:
            return .get
        case .getPackagesSources:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getPackages:
            return .requestParameters(
                bodyEncoding: .urlEncoding,
                urlParameters: .none
            )
        case .getPackagesSources:
            return .requestParameters(
                bodyEncoding: .urlEncoding,
                urlParameters: .none
            )
        }
    }
}
