//
//  ProfileInfoHeaderCollectionReusableCellCollectionReusableView.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/27.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileImageHeaderDidTapPostsButton(_ header: ProfileInfoHeaderCollectionReusableCell)
    func profileImageHeaderDidTapFollowingsButton(_ header: ProfileInfoHeaderCollectionReusableCell)
    func profileImageHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableCell)
    func profileImageHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableCell)
}

final class ProfileInfoHeaderCollectionReusableCell: UICollectionReusableView {
    
    static let identifier = "ProfileInfoHeaderCollectionReusableCell"
    
    public var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Your Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joe smith"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the first account!"
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: -init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addActions()
        clipsToBounds = true
        backgroundColor = .systemBackground
    }
    
    private func addActions() {
        postsButton.addTarget(self,
                              action: #selector(didTapPostsButton),
                              for: .touchUpInside)
        followersButton.addTarget(self,
                                  action: #selector(didTapFollowersButton),
                                  for: .touchUpInside)
        followingButton.addTarget(self,
                                  action: #selector(didTapFollowingButton),
                                  for: .touchUpInside)
        editProfileButton.addTarget(self,
                                    action: #selector(didTapEditProfileButton),
                                    for: .touchUpInside)
    }
    
    private func addSubviews() {
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width / 4
        profilePhotoImageView.frame = CGRect(x: 5,
                                             y: 5,
                                             width: profilePhotoSize,
                                             height: profilePhotoSize)
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize / 2.0
        
        let buttonHeight = profilePhotoSize / 2
        let countButtonWidth = (width - 10 - profilePhotoSize) / 3
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight).integral
        followersButton.frame = CGRect(x: postsButton.right,
                                       y: 5,
                                       width: countButtonWidth,
                                       height: buttonHeight).integral
        followingButton.frame = CGRect(x: followersButton.right,
                                       y: 5,
                                       width: countButtonWidth,
                                       height: buttonHeight).integral
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right,
                                         y: 5 + buttonHeight,
                                         width: countButtonWidth * 3,
                                         height: buttonHeight).integral
        nameLabel.frame = CGRect(x: 5,
                                 y: profilePhotoImageView.bottom + 5,
                                 width: width - 10,
                                 height: 50).integral
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(x: 5,
                                y: nameLabel.bottom + 5,
                                width: width - 10,
                                height: bioLabelSize.height).integral
    }
    
    // MARK: - Action
    
    @objc func didTapPostsButton() {
        delegate?.profileImageHeaderDidTapPostsButton(self)
    }
    
    @objc func didTapFollowersButton() {
        delegate?.profileImageHeaderDidTapFollowersButton(self)
    }
    
    @objc func didTapFollowingButton() {
        delegate?.profileImageHeaderDidTapFollowingsButton(self)
    }
    
    @objc func didTapEditProfileButton() {
        delegate?.profileImageHeaderDidTapEditProfileButton(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
