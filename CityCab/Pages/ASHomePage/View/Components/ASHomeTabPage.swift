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
    
    //paso 4.6
    static let rideHistoryMock: [ASRideHistoryModel] = [
        ASRideHistoryModel(id: "1",
                           address: "Santa Fé",
                           city: "CDMX"),
        ASRideHistoryModel(id: "2",
                           address: "Parque La Mexicana",
                           city: "CDMX")
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
    //Paso 5.6
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
        //V-84,paso 3.4
        ScrollView(showsIndicators: false) {
            VStack(spacing: ASSpacing.small) {
                //El searchbar
                ASWhereToTextView(text: ASHomeTabPageConstants.Localizables.text1)
                //Paso 4.0
                ASRideHistoryListView(rideHistory: ASHomeTabPageConstants.rideHistoryMock)
                //Paso 5.0
                ASSuggestionsView(items: ASHomeTabPageConstants.services)
                //Paso 6.0
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

//paso 5.1
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


