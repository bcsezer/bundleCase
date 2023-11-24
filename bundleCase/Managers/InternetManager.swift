//
//  InternetManager.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let provider = NetworkProvider<RemoteEndpoint>()
    
    private init() {}
    
    func getPackages(completion: @escaping ClosureType<[PackageEntity]>, failure: @escaping Failure) {
        provider.request(
            .getPackages,
            model: [PackageEntity].self,
            completion: completion,
            failure: failure
        )
    }
}
