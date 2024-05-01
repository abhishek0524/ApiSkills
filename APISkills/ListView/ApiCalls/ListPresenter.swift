//
//  ListPresenter.swift
//  APISkills
//
//  Created by apple on 01/05/24.
//

import UIKit

protocol ListView:NSObject {
    func successfullyResult(data:[ListModel])
    func resultFailed(status:String)
}

class ListPresenter: NSObject {
    
    weak private var delegate:ListView?
    private lazy var service = {
        return ListService()
    }()
    init(_  delegate:ListView) {
        self.delegate = delegate
    }
}

extension ListPresenter
{
    func apiForGetList() {
        service.apiForGetListDetails { (info, error, statusCode) in
            guard error == nil   else{
                self.delegate?.resultFailed(status: "Result not Found")
                return
            }
            self.delegate?.successfullyResult(data: info!)
        }
    }
}
