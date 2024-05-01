//  APISkills
//
//  Created by apple on 01/05/24.
//

import Foundation
import Alamofire

struct APIConstant {
    
    internal static let API_VERSION = "1"
    internal static let APP_STORE_APP_ID = "1234567"
}

struct HeaderKeys {
    
    internal static let kLANGUAGE    = "lang"
    internal static let kVERSION     = "version"
    internal static let kAUTH_TOKEN   = "auth_token"
    internal static let kUSER_ID     = "userid"
    internal static let kFCM_TOKEN   = "fcm_token"
    internal static let kDEVICE_TYPE = "devicetype"
    internal static let kHeaderUSER_ID = "userid"
    internal static let kAuthorization = "Authorization"
    internal static let kDEVICE_ID   = "device_id"
    internal static let kDEVICE_TOKEN   = "device_token"
    internal static let kTIME_ZONE   = "timezone"
    internal static let kUSER_TYPE   = "usertype"
    internal static let kCURRENT_TIMEZONE = "current_time_zone"
    internal static let kCONTENT_TYPE = "Content-Type"
    internal static let kDEVICE_COUNTRY_NAME = "current_country"
    internal static let kDEVICE_LATITUDE  = "lat"
    internal static let kDEVICE_LONGITUDE = "lng"
}

extension URL {
    
    static let baseUrl = "https://jsonplaceholder.typicode.com/"
    
    enum Key {
        static let accept = "Accept"
        static let contentType = "Content-Type"
        static let authorization = "Authorization"
    }
    enum Header {
        static let JSON = "application/json"
        static let URLEncoded = "application/x-www-form-urlencoded"
    }
    enum Home {
        static let getList =  baseUrl+"posts"
    }

}

class APIHeaders: NSObject {
    func getDefaultHeaders() -> HTTPHeaders {
        
        //let timeZone = TimeZone.current.identifier
        //return TimeZone.current.abbreviation() ?? ""
        let countryCode = (NSLocale.current as NSLocale).object(forKey: .countryCode)
        let countryName = (NSLocale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode ?? "+91") ?? ""
        print(countryName)
        
        let headers : HTTPHeaders = [
            HeaderKeys.kCURRENT_TIMEZONE : "IST" ,
            HeaderKeys.kDEVICE_COUNTRY_NAME : countryName,
            HeaderKeys.kVERSION : APIConstant.API_VERSION,
            HeaderKeys.kDEVICE_TYPE : "ios" ,
            HeaderKeys.kCONTENT_TYPE:"application/json", "Accept":"application/json", "x-request-os":"ios",
        ]
        return headers;
    }
}

enum ResponseCode : Int {
    case Success = 200
    case Created = 201
    case Deleted = 204

    case AlreadyExist = 400
    case Invalid = 401
    case Block_by_admin = 403
    case Unauthorised = 412
   
    case ResendVerification = 1000
    case NoInternet = 111
}
