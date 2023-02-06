//
//  Request.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2023/02/06.
//

import UIKit
import Alamofire
import Toaster

class Request {
    
    static var baseUrl : String {
        get {
            return Constant.API.url
        }
    }
//    let token = UserDefaults.standard.string(forKey: "loginSession")
//    let jsonHeader: HTTPHeaders = ["Content-Type":"application/json", "Accept":"application/json", "Authorization" : "eyJraWQiOiJJVVwvdUlvd24rMGVVSW1ZdU5ROXAxdGtvSGRPOFN2XC9qa2xXMENoOVd0Mms9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIxZmQ2N2I5MC1iMzRhLTRkNDktOGMzMi1iZjQzNzVhZGFkZmUiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmFwLW5vcnRoZWFzdC0yLmFtYXpvbmF3cy5jb21cL2FwLW5vcnRoZWFzdC0yX2RLbEllRjV2SCIsInBob25lX251bWJlcl92ZXJpZmllZCI6dHJ1ZSwiY3VzdG9tOmdyb3VwIjoiR1IwMTAxIiwiY29nbml0bzp1c2VybmFtZSI6Ijk4MjllMDc4LTg5ZWUtNDVlOC1iZTI4LWE1N2MyMDFjZGIxZSIsImN1c3RvbTpkaWNvZGUiOiJpbXBfMTkyNzg5NjU5ODUyIiwib3JpZ2luX2p0aSI6IjRjYTM2OWMwLWEwZDAtNDk1OS04ZTQxLWZkZWM2ZjI2ZjJhNiIsImN1c3RvbTpnZW5kZXIiOiJtYWxlIiwiYXVkIjoiN2MwMXUzNDZsMXIwYjQ2ZzYwdDR2azJoMGUiLCJjdXN0b206c2l0ZSI6ImlvcyIsInRva2VuX3VzZSI6ImlkIiwiYXV0aF90aW1lIjoxNjc0NzAxNzY4LCJuYW1lIjoi7Zmp64-Z66-8Iiwibmlja25hbWUiOiLsnbTruajsjansnYAg7Ja066aw7J207KeRIOybkOyepSIsImN1c3RvbTpiaXJ0aGRheSI6IjE5ODctMTItMjFUMTU6MDA6MDAuMDAwKzAwOjAwIiwicGhvbmVfbnVtYmVyIjoiKzgyMTA4MjgwNjIxNSIsImN1c3RvbTpocCI6Iis4MjEwODI4MDYyMTUiLCJleHAiOjE2NzU3NTMyMTEsImN1c3RvbTpyb2xlIjoiVVNSIiwiaWF0IjoxNjc1NjY2ODExLCJqdGkiOiI2MWU2NjA2NC04OWJhLTQxYmYtOTE1Ni1iZmYzYWNmNjIyMTgiLCJlbWFpbCI6InNsenpsZUBuYXZlci5jb20ifQ.bQ1dk660GLJVN0Qn8CrU5FnoojbD8zzlIE1KSID7aU6xhMI5319c18aB94x6a14WMUrWv8pvz1UR1qqdcrHC8JTVjWt3cu39nHysI66qEQ1Baenej9x4d15rK65nSSLlETbzNDoxIfFOwJrG6Dtlskcrmgp3yIL0QBm24AhlkF-MPSNr73gbYz9LAZdnBHoGYAYEawK3uECTa399ZD9EYe0oxji1VzUfnvrS2wSJmtiBjKqjylWf-ejX0WZO7yYIxy0RB8cRSpO4v1wzAAisYgz0WCs1kI6qfcvvzHHgnlmC8p8gOrRfNl55Ampsc0TUN6MfGPEElkIBIz8Y607L5g"]
//    func test() -> HTTPHeaders {
//
//
//        return jsonHeader
//    }
    static private func handleError(_ response: DataResponse<Any, AFError>) -> ErrorModel? {
        if let result = response.data {

            if let error = try? JSONDecoder().decode(ErrorModel.self, from: result) {
                
//                if !ignoreMessages.contains(error.message) {
//                    // 4040 (미니플레이어 종료시)
//                    error.code == 4040 || error.code == 100000 ?
//                        print(error.code, error.message,"find_is") :
//                        Toast(text: error.message).show()
//                }
                return error
            }
      
        }
        
       // Toast(text: "ToastDisconnect".localized()).show()
        return nil
    }
    
    static func gets(route: String, param: Parameters, completion: @escaping (_ data: Data?) -> Void, exception: @escaping (_ error: ErrorModel) -> Void = { error in }) {
        
        var url: String = Constant.API.url + route
        let jsonHeader: HTTPHeaders = ["Content-Type":"application/json", "Accept":"application/json", "Authorization" : "eyJraWQiOiJJVVwvdUlvd24rMGVVSW1ZdU5ROXAxdGtvSGRPOFN2XC9qa2xXMENoOVd0Mms9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIxZmQ2N2I5MC1iMzRhLTRkNDktOGMzMi1iZjQzNzVhZGFkZmUiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmFwLW5vcnRoZWFzdC0yLmFtYXpvbmF3cy5jb21cL2FwLW5vcnRoZWFzdC0yX2RLbEllRjV2SCIsInBob25lX251bWJlcl92ZXJpZmllZCI6dHJ1ZSwiY3VzdG9tOmdyb3VwIjoiR1IwMTAxIiwiY29nbml0bzp1c2VybmFtZSI6Ijk4MjllMDc4LTg5ZWUtNDVlOC1iZTI4LWE1N2MyMDFjZGIxZSIsImN1c3RvbTpkaWNvZGUiOiJpbXBfMTkyNzg5NjU5ODUyIiwib3JpZ2luX2p0aSI6IjRjYTM2OWMwLWEwZDAtNDk1OS04ZTQxLWZkZWM2ZjI2ZjJhNiIsImN1c3RvbTpnZW5kZXIiOiJtYWxlIiwiYXVkIjoiN2MwMXUzNDZsMXIwYjQ2ZzYwdDR2azJoMGUiLCJjdXN0b206c2l0ZSI6ImlvcyIsInRva2VuX3VzZSI6ImlkIiwiYXV0aF90aW1lIjoxNjc0NzAxNzY4LCJuYW1lIjoi7Zmp64-Z66-8Iiwibmlja25hbWUiOiLsnbTruajsjansnYAg7Ja066aw7J207KeRIOybkOyepSIsImN1c3RvbTpiaXJ0aGRheSI6IjE5ODctMTItMjFUMTU6MDA6MDAuMDAwKzAwOjAwIiwicGhvbmVfbnVtYmVyIjoiKzgyMTA4MjgwNjIxNSIsImN1c3RvbTpocCI6Iis4MjEwODI4MDYyMTUiLCJleHAiOjE2NzU3NTMyMTEsImN1c3RvbTpyb2xlIjoiVVNSIiwiaWF0IjoxNjc1NjY2ODExLCJqdGkiOiI2MWU2NjA2NC04OWJhLTQxYmYtOTE1Ni1iZmYzYWNmNjIyMTgiLCJlbWFpbCI6InNsenpsZUBuYXZlci5jb20ifQ.bQ1dk660GLJVN0Qn8CrU5FnoojbD8zzlIE1KSID7aU6xhMI5319c18aB94x6a14WMUrWv8pvz1UR1qqdcrHC8JTVjWt3cu39nHysI66qEQ1Baenej9x4d15rK65nSSLlETbzNDoxIfFOwJrG6Dtlskcrmgp3yIL0QBm24AhlkF-MPSNr73gbYz9LAZdnBHoGYAYEawK3uECTa399ZD9EYe0oxji1VzUfnvrS2wSJmtiBjKqjylWf-ejX0WZO7yYIxy0RB8cRSpO4v1wzAAisYgz0WCs1kI6qfcvvzHHgnlmC8p8gOrRfNl55Ampsc0TUN6MfGPEElkIBIz8Y607L5g"]
        
        let alamo = AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: jsonHeader).validate(statusCode: 200..<300)
        alamo.responseJSON { [self] response in
            
            switch response.result {
                case .success:
                completion(response.data)
                   
                    print("Api 호출")
                    return

                default:
                    if let error = handleError(response) {
                        print("Api 호출실패")
                        exception(error)
                    }
                return
            }
            
        }
        
        
    }
    
}
