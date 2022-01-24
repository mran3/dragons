//
//  TitleInfoTableCell.swift
//  Dragon Riders
//
//  Created by Andres Acevedo on 10/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

class TitleInfoTableCell: UITableViewCell {
    let titleLabel = UILabel()
    let infoLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoLabel)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            infoLabel.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            infoLabel.leadingAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.trailingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            infoLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            infoLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
