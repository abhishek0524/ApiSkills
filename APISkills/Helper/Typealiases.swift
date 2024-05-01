//  APISkills
//
//  Created by apple on 01/05/24.
//

import Foundation
import UIKit
import Alamofire

typealias StrAny = [String:Any]
typealias StrAnyOpnl = [String:Any]?
typealias ArrayType = [[String:Any]]
typealias CompletionBlock = (_ dataResponse:AFDataResponse<Any>) -> Void
typealias CompletionBlockUpload = (_ dataResponse:AFDataResponse<Any>?, _ error:String?) -> Void

typealias CompletionVoid = (_ success:Bool, _ error:String?) -> Void
typealias Defaults = UserDefaults
typealias Storyboard = UIStoryboard
typealias TableCell = UITableViewCell
typealias Font = UIFont
typealias Color = UIColor
typealias CollectionCell = UICollectionViewCell
//typealias ResponseStatus = (type: ResponseType, description: String)
typealias CompletionMessage = (_ success:Bool) -> Void
typealias CompletionValue = (_ success:String) -> Void
typealias CompletionImage = (_ url:String) -> Void
typealias CompletionData = (_ data: StrAny) -> Void
typealias CompletionArray = (_ data: AnyHashable) -> Void

