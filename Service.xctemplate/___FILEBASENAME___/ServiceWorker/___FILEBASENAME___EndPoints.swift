//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___. All rights reserved.
//

import Alamofire

enum ___VARIABLE_serviceName___Endpoints: String, Endpoints {
    case request

    func getMethod() -> HTTPMethod {
        switch self {
        case .request: return .get
        }
    }

    func getValue() -> String {
        switch self {
        case .request: return ""
        }
    }
}
