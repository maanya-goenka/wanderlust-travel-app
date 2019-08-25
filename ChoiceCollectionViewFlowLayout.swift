//
//  ChoiceCollectionViewFlowLayout.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/8/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class ChoiceCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    let edgeInset: CGFloat = 8
    let itemHeight: CGFloat = 100
    let itemWidth: CGFloat = 100
    
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: itemWidth, height: itemHeight)
        minimumLineSpacing = edgeInset
        minimumInteritemSpacing = edgeInset
        scrollDirection = .horizontal
        sectionInset = .zero
    }


}
