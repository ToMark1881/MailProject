//
//  PackageCell.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/26/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

import UIKit

class PackageCell: UITableViewCell {
    
    let desc: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let address: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let date: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        frame = CGRect(x: 0, y: 0, width: frame.width, height: 96)
        desc.frame = CGRect(x: 12, y: 12, width: frame.width, height: 20)
        date.frame = CGRect(x: 12, y: desc.frame.maxY + 6, width: frame.width, height: 20)
        address.frame = CGRect(x: 12, y: date.frame.maxY + 6, width: frame.width, height: 20)
        
        addSubviews(desc, address, date)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
