//
//  ListDetailVC.swift
//  APISkills
//
//  Created by apple on 01/05/24.
//

import UIKit

class ListDetailVC: UIViewController {

    
    @IBOutlet weak var lblId:UILabel!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblBody:UILabel!
    
    var listDetail:[ListModel] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if listDetail.count > 0 {
            lblId.text = "\(listDetail[0].id ?? 0)"
            lblTitle.text = listDetail[0].title ?? ""
            lblBody.text = listDetail[0].body ?? ""
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
