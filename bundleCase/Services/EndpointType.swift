//
//  EndpointType.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}
