//
//  ProfileTabsHeaderCollectionReusableCell.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/27.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class ProfileTabsHeaderCollectionReusableCell: UICollectionReusableView {
        static let identifier = "ProfileTabsHeaderCollectionReusableCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
