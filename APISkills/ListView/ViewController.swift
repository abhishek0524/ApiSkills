//
//  ViewController.swift
//  APISkills
//
//  Created by apple on 01/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblVW:UITableView!
    @IBOutlet weak var spinner:UIActivityIndicatorView!
    
    var listData:[ListModel] = []
    
    var isLoadingData = false
    var currentPage = 1
    let pageSize = 10
    var listCount = 0
    
    
    private lazy var presenter = {
        return ListPresenter(self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        presenter.apiForGetList()
        
        spinner.isHidden = false
        
        let nibNameList = String(describing: ListTVC.self)
        tblVW?.register(UINib(nibName: nibNameList, bundle: nil), forCellReuseIdentifier: nibNameList)
        
        
    }
    
    func loadMoreData() {
            isLoadingData = true
            fetchData(page: currentPage) { newData in
                self.listCount = newData
                self.isLoadingData = false
                self.currentPage += 1
                self.spinner.isHidden = true
                self.tblVW.reloadData()
            }
        }
        
        // Function to fetch data (mock function, replace with your data fetching logic)
        func fetchData(page: Int, completion: @escaping (Int) -> Void) {
            // Simulate network delay
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                // Replace the following line with your data fetching logic
                var newData = (self.listData.count / 10) * self.currentPage
                if newData >= self.listData.count
                {
                    newData = self.listData.count
                }
                
                // Call the completion handler with the fetched data
                DispatchQueue.main.async {
                    completion(newData)
                }
            }
        }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTVC") as! ListTVC
        
        cell.lblId.text = "\(listData[indexPath.row].id ?? 0)"
        cell.lblTitle.text = listData[indexPath.row].title ?? ""
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            
            if offsetY > contentHeight - scrollView.frame.height - 50 { // 50 is a buffer value
                if !isLoadingData {
                    self.spinner.isHidden = false
                    loadMoreData()
                }
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var listId = listData[indexPath.row].id
        let vc:ListDetailVC = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "ListDetailVC") as! ListDetailVC
        vc.listDetail = listData.filter{
            $0.id == listId
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

extension ViewController: ListView
{
    func successfullyResult(data: [ListModel]) {
        print("Data",data)
        listData = data
        
        loadMoreData()
        //tblVW.reloadData()
        
    }
    
    func resultFailed(status: String) {
        
    }
    
}

