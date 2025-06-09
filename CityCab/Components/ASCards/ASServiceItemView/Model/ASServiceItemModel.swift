//
//  ServiceItemModel.swift
//  Uber Ui Clone
//
//  Created by Paul F on 8/2/25.
//
import Foundation

enum ASItemSize {
    case small, big
}

struct ASServiceItemModel: Hashable {
    let id: String
    let title: String
    let image: String
    let promoText: String
    let size: ASItemSize
    
    init(id: String,
         title: String,
         image: String,
         promoText: String = "",
         size: ASItemSize = .small) {
        self.id = id
        self.title = title
        self.image = image
        self.promoText = promoText
        self.size = size
    }
}
