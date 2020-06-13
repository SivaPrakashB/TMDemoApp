//
//  TableCell.swift
//  TMDemoApp
//
//  Created by Interaction on 6/11/20.
//  Copyright © 2020 TechMahindra. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    var img:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    var title:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 17.0)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 2
        return label
    }()
    var detail:UILabel = {
         let label = UILabel()
         label.font = UIFont(name: "Avenir-Light", size: 13.0)
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
         return label
     }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(img)
        contentView.addSubview(title)
        contentView.addSubview(detail)
        img.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        detail.translatesAutoresizingMaskIntoConstraints = false
        //Adding constraints to img
        NSLayoutConstraint(item: img, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: img, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: img, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: img, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: img, attribute: NSLayoutConstraint.Attribute.width, multiplier: 9/16, constant: 0).isActive = true
        
        //Adding constraints to titleLabel
        NSLayoutConstraint(item: title, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item:contentView , attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem:title, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: title, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: img, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 8).isActive = true
        //Adding constraints to detailLabel
        NSLayoutConstraint(item: detail, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: contentView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: detail, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: detail, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: title, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: contentView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: detail, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 25).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
