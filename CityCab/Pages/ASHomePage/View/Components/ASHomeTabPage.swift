//
//  HomeTabPage.swift
//  Uber Ui Clone
//
//  Created by Paul F on 8/2/25.
//

import SwiftUI

private enum ASHomeTabPageConstants {
    enum Localizables {
        static let text1 = "Where to?"
        static let text2 = "Suggestions"
        static let text3 = "See All"
    }
    
    static let rideHistoryMock: [ASRideHistoryModel] = [
        ASRideHistoryModel(id: "1",
                           address: "Plaza Catalunya",
                           city: "Barcelona"),
        ASRideHistoryModel(id: "2",
                           address: "Sants station",
                           city: "Barcelona")
    ]
    
    static let services: [ASServiceItemModel] = [
        ASServiceItemModel(id: "1",
                           title: "Ride",
                           image: "car_icon"),
        ASServiceItemModel(id: "2",
                           title: "2-Wheels",
                           image: "two_wheels"),
        ASServiceItemModel(id: "3",
                           title: "Rental Cars",
                           image: "rental",
                           promoText: "Promo"),
        ASServiceItemModel(id: "4",
                           title: "Reserve",
                           image: "calendar_icon")
    ]
    
    static let banners: [ASBannerModel] = [
        ASBannerModel(title: "40% off your next 3 restaurant orders.",
                      titleColor: .white,
                      ctaText: "Redeem now",
                      ctaStyle: .arrow(labelColor: .white),
                      image: .asset(asset: "food_image"),
                      backgroundColor: .brownColor,
                      action: {}),
        ASBannerModel(title: "50% off your next breakfast order.",
                      titleColor: .white,
                      ctaText: "Redeem now",
                      ctaStyle: .arrow(labelColor: .white),
                      image: .asset(asset: "breakfast"),
                      backgroundColor: .blueColor,
                      action: {})
    ]
}

struct ASHomeTabPage: View {

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: ASSpacing.small) {
                ASWhereToTextView(text: ASHomeTabPageConstants.Localizables.text1)
                ASRideHistoryListView(rideHistory: ASHomeTabPageConstants.rideHistoryMock)
                ASSuggestionsView(items: ASHomeTabPageConstants.services)
                ASBannersCarrouselListView(bannerList: ASHomeTabPageConstants.banners)
                    .padding(.top)
            }
        }.padding(.horizontal)
    }
}

private struct ASWhereToTextView: View {
    let text: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.h6Medium)
                    .foregroundStyle(Color.grey800)
                Text(text)
                    .font(.h6SemiBold)
                    .foregroundStyle(Color.grey800)
                Spacer()
            }.padding()
             .padding(.vertical,4)
        }.background(Color.grey250)
            .clipShape(.rect(cornerRadius: ASRadius.extraLarge))
         
    }
}

private struct ASSuggestionsView: View {
    let items: [ASServiceItemModel]
    
    var body: some View {
        VStack {
            ASDoubleHeaderView(infoText: ASHomeTabPageConstants.Localizables.text2,
                               actionText: ASHomeTabPageConstants.Localizables.text3)
            LazyHStack {
                ForEach(items, id: \.self) { item in
                    ASServiceItemView(model: item)
                }
            }
        }
    }
}

#Preview {
    ASHomeTabPage()
}


