//
//  FilterCollectionViewCell.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/6/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    var filterNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        filterNameLabel = UILabel()
        filterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        filterNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        filterNameLabel.textAlignment = .center
        contentView.addSubview(filterNameLabel)
        isSelected = false
        setupConstraints()
        
    }
    
    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            if isSelected {
                backgroundColor = .blue
                filterNameLabel.textColor = .white
            } else {
                backgroundColor = .lightGray
                filterNameLabel.textColor = .white
            }
            setNeedsDisplay()
        }
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            filterNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            filterNameLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            filterNameLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            filterNameLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    
    func configure(for filter: Filter){
        filterNameLabel.text = filter.filterTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
