//
//  ListService.swift
//  APISkills
//
//  Created by apple on 01/05/24.
//

import UIKit

class ListService: NSObject {
    
    func apiForGetListDetails(callBack:@escaping (_ user: [ListModel]?,_ error:String?,_ status:String) -> Void)  {
        APICall.postRequest(url: URL.Home.getList, params: nil) { (dataResponse) in
            do{
                let apiData = try JSONSerialization.data(withJSONObject: dataResponse.value ?? "", options: .prettyPrinted)
                let response = try JSONDecoder().decode([ListModel].self, from: apiData)
                
                if response.count == 0 {
                    callBack(response,"Data not Found","error")
                } else {
                    //Save Data to user defaults
                    callBack(response,nil,"success")
                }
            }catch(let errorUser){
                callBack(nil,errorUser.localizedDescription, "fail")
            }
        }
    }

}
