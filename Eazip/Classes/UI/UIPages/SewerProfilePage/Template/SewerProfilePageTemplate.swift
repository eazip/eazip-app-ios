//
//  SewerProfilePageTemplate.swift
//  Eazip
//
//  Created by Marie on 02/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//
import UIKit

typealias PictureViewCellConfig = CollectionCellConfigurator<PictureViewCell, [String: Any]>
typealias DescriptionViewCellConfig = CollectionCellConfigurator<DescriptionViewCell, String>
typealias LastWorksViewCellConfig = CollectionCellConfigurator<LastWorksViewCell, [UIImage]>

class SewerProfileScreen {
    var dataSewer : SewerProfile
    
    init(data: SewerProfile) {
        self.dataSewer = data
    }
    
    func templateWithData() -> [CellConfigurator] {
        let items : [CellConfigurator] = [
            PictureViewCellConfig.init(item: ["picture": dataSewer.sewerPicture, "name": dataSewer.sewerName, "rating": dataSewer.sewerRating]),
            DescriptionViewCellConfig.init(item: dataSewer.sewerBiography),
            LastWorksViewCellConfig.init(item: dataSewer.sewerWorks as! [UIImage])
        ]
        
        return items
    }
}
