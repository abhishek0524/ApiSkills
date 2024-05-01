//  APISkills
//
//  Created by apple on 01/05/24.
//

import UIKit
import Alamofire
import MobileCoreServices

class APICall: NSObject {
    
    private static let AlamofireSessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 180
        let sessionManager = Alamofire.Session(configuration: configuration)
        return sessionManager
    }()
    
    class func postRequest(url:String,headerValue:HTTPHeaders = [:] ,params:Parameters? ,completionHandler: @escaping CompletionBlock) -> Void{
        
        var header:HTTPHeaders!
        
        //let header = APIHeaders().getDefaultHeaders()
        print("header....", header)
        
        //var headers = headerValue
        //let _headers : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        print("params:",params ?? "")
        
        AF.request(URL.init(string: url)!, method: .get, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print(response.result)
            
            switch response.result {
                
            case .success(_):
                if response.value != nil {
                    completionHandler(response)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
