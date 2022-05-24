//
//  NetworkingService.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import Foundation
import Alamofire

class NetworkingService {
    
    private static let sharedSession = Alamofire.Session(configuration: .default)
    
    class func homeServices(completion: (([HomeService]?, Error?)->())?) {
        let url = Constants.API.baseUrl.appendingPathComponent("api/v1/home")
        let request = NetworkingService.sharedSession.request(url, method: .get).validate()
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let result: [HomeService]? = data.decoded()
                guard let result = result else {
                    completion?(nil, NSError.standard(message: "Data error.", code: -1))
                    return
                }
                completion?(result, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
    
    class func events(completion: (([HomeService]?, Error?)->())?) {
        let url = Constants.API.baseUrl.appendingPathComponent("api/v1/events")
        let request = NetworkingService.sharedSession.request(url, method: .get).validate()
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let result: [HomeService]? = data.decoded()
                guard let result = result else {
                    completion?(nil, NSError.standard(message: "Data error.", code: -1))
                    return
                }
                completion?(result, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }

}
