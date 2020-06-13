//
//  DetailListViewController.swift
//  TMDemoApp
//
//  Created by Interaction on 6/13/20.
//  Copyright © 2020 TechMahindra. All rights reserved.
//

import UIKit
import SDWebImage

class DetailListViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.addSubview(self.refreshControl)
        tableView.isHidden = true
        return tableView
    }()
    lazy var label:UILabel = {
        let label = UILabel()
        label.text  = "Fetching data...."
        return label
    }()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)]
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching data...", attributes: attributes)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.addTarget(self, action:
                     #selector(self.handleRefresh),
                                 for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    var detailListViewModel:DetailListViewModel!
    var totalCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchDetails()
    }
    
    fileprivate func setupViews() {
        view.addSubview(label)
        view.addSubview(tableView)
        //Adding constraints to tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0).isActive = true
        
        //Adding constraints to label
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.height, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
    }
    
    func fetchDetails(){
        let networkOperations = NetworkOperations()
        networkOperations.fetchDetails(urlString: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") { (detailList, error) in
        
        if error != nil || detailList == nil {
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.alertMessage(message: error?.localizedDescription)
            }
            
           return
        }
        self.detailListViewModel = DetailListViewModel(detailList: detailList!)
        
        DispatchQueue.main.async {
        self.totalCount = self.detailListViewModel.detailList.rows.count
        self.refreshControl.endRefreshing()
        self.navigationItem.title = self.detailListViewModel.detailList.title
        if self.totalCount == 0{
        self.tableView.isHidden = true
        self.label.isHidden = false
        self.label.text = "No data found.."
        }else{
        self.tableView.isHidden = false
        self.label.isHidden = true
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        }
        }
        
        }
    }
    //Show alert message
    func alertMessage(message:String?){
        let alert = UIAlertController(title: "Alert", message: message ?? "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (ACTION) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
extension DetailListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.totalCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        cell.img.sd_setImage(with: URL(string: self.detailListViewModel.detailList.rows[indexPath.row].imageHref), placeholderImage: UIImage(named: "img-placeholder"))
        cell.title.text = self.detailListViewModel.detailList.rows[indexPath.row].title
        cell.detail.text = self.detailListViewModel.detailList.rows[indexPath.row].details
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func handleRefresh(){
        fetchDetails()
    }
    
}
extension DetailListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            
    }
}
