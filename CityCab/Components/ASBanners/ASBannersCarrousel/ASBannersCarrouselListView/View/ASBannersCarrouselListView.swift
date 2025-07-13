//
//  BannersCarrouselListView.swift
//  Uber Ui Clone
//
//  Created by Paul F on 8/2/25.
//

import SwiftUI

//Paso 6.1
struct ASBannersCarrouselListView: View {
    let bannerList: [ASBannerModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(bannerList, id: \.self) { model in
                    ASBannerView(model: model)
                }
            }
        }
    }
}


