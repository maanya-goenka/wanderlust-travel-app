//
//  ChoiceCollectionViewCell.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/8/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class ChoiceCollectionViewCell: UICollectionViewCell {
    var choiceImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        choiceImage = UIImageView(frame: .zero)
        choiceImage.translatesAutoresizingMaskIntoConstraints = false
        choiceImage.contentMode = .scaleToFill
        choiceImage.clipsToBounds = true
        contentView.addSubview(choiceImage)
        
        setupConstraints()
        
    }
    
    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            if isSelected {
                backgroundColor = .blue
            } else {
                backgroundColor = .white
            }
            setNeedsDisplay()
        }
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            choiceImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            choiceImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            choiceImage.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            choiceImage.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant:  -5)
            ])
    }
    
    func configure(for choice: Choice){
        choiceImage.image = choice.filterImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
