//
//  DetailListViewController.swift
//  TMDemoApp
//
//  Created by Interaction on 6/13/20.
//  Copyright © 2020 TechMahindra. All rights reserved.
//

import UIKit

class DetailListViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.isHidden = true
        return tableView
    }()
    lazy var label:UILabel = {
        let label = UILabel()
        label.text  = "Fetching data...."
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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

}
