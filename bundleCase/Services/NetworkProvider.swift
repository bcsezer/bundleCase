//
//  NetworkProvider.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//

import Foundation

typealias NetworkProviderCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> Void
typealias ClosureType<T> = (_ result: T) -> Void
typealias Failure = ((_ error: String) -> Void)

protocol NetworkRouter {
    associatedtype EndPoint: EndpointType
    func request(_ target: EndPoint, completion: @escaping NetworkProviderCompletion)
    func cancel()
}

class NetworkProvider<EndPoint: EndpointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ target: EndPoint, completion: @escaping NetworkProviderCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: target)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        }catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from target: EndPoint) throws -> URLRequest {
        let url = URL(string: target.baseURL.absoluteString.appending(target.path))
        
        var request = URLRequest(url: url ?? target.baseURL,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 20.0)
        
        request.httpMethod = target.httpMethod.rawValue
        do {
            switch target.task {
            case .request:
                request.addValue("Content-Type", forHTTPHeaderField: "application/json")
                request.addValue("TR", forHTTPHeaderField: "language")
                request.addValue("TR", forHTTPHeaderField: "country")
                request.addValue("9aa43dab-d2ca-4dc1-b374-afb462b3b8e5", forHTTPHeaderField: "DeviceToken")
                request.addValue("IOS", forHTTPHeaderField: "Platform")
                
            case .requestParameters(let bodyEncoding,
                                    let urlParameters):
                try self.configureParameters(bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyEncoding: RemoteEncoder,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
}

extension NetworkProvider {
    func request<T: Codable>(_ target: EndPoint,
                               model: T.Type,
                               completion: @escaping ClosureType<T>,
                               failure: @escaping Failure) {
        
        return request(target, completion: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    let result = self.handleNetworkResponse(response)
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            failure(NetworkResponse.noData.rawValue)
                            return
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode(model.self, from: responseData)
                            completion(apiResponse)
                        }catch {
                            failure(NetworkResponse.unableToDecode.rawValue)
                        }
                    case .failure(let networkFailureError):
                        failure(networkFailureError)
                    }
                } else {
                    failure(NetworkResponse.noData.rawValue)
                }
            }
        })
    }
    
    private enum Result<String>{
        case success
        case failure(String)
    }
    
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
