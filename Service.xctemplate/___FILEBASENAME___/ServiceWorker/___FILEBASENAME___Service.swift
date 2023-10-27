//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___. All rights reserved.
//

import Alamofire
import Combine

class ___VARIABLE_serviceName___Service: ServiceType, ___VARIABLE_serviceName___ServiceProtocol {
    func ___VARIABLE_serviceName___Request(object: ___VARIABLE_serviceName___RequestDTO) -> PassthroughSubject<___VARIABLE_serviceName___ResponseDTO?, NetworkError> {
        let endpoint = ___VARIABLE_serviceName___Endpoints.request
        let url = getFullUrl(baseUrl: baseURL,
                             endPoint: endpoint.rawValue,
                             parameters: nil)
        return networkManager.processReq(url: url,
                                         method: endpoint.getMethod(),
                                         params: nil,
                                         headers: nil)
    }
}
