//
//  ASEatsTabPage.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 24/2/25.
//

import SwiftUI
import Observation

///Paso 7.3 Constants used within `ASEatsTabPage`.
private enum ASEatsTabPageConstants {
    enum Localizables {
        static let text1 = "Delivery"
        static let text2 = "Deliver Now"
        static let text3 = "Plaza Catalunya"
        static let text4 = "Search for restaurants"
        static let text5 = "Featured"
    }
    enum Images {
        static let cartSystemName = "cart"
        static let chevronSystemName = "chevron.down"
    }
    //Paso 9.6
    static let categories: [ASCategoryModel] = [
        ASCategoryModel(id: 1, source: .asset(asset: "grocery"), title: "Grocery"),
        ASCategoryModel(id: 2, source: .asset(asset: "PizzaSlice"), title: "Pizza"),
        ASCategoryModel(id: 3, source: .asset(asset: "FastFood"), title: "Fast Food"),
        ASCategoryModel(id: 4, source: .asset(asset: "Thai"), title: "Thai"),
        ASCategoryModel(id: 5, source: .asset(asset: "GameDay"), title: "Gameday")
    ]
    
    static let chipModels: [ASButtonChipModel] = [
        ASButtonChipModel(id: "1", title: "Offers", iconSource: .left(systemName: "percent")),
        ASButtonChipModel(id: "2", title: "Delivery fee", iconSource: .right(systemName: "chevron.down")),
        ASButtonChipModel(id: "3", title: "Under 30 min", iconSource: .right(systemName: "chevron.down"))
    ]
    //Paso 11.5
    static let cardModels: [ASStoreModel] = [
        ASStoreModel(
            id: "sprouts-123",
            name: "Sprouts Farmers Market",
            logoURL: "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/128289834/original/39b3cd433ae96fea7fbb1795940ffa4665d6606f/create-restaurant-promo-or-food-promotion-video.png",
            backgroundImageURL: "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/128289834/original/39b3cd433ae96fea7fbb1795940ffa4665d6606f/create-restaurant-promo-or-food-promotion-video.png",
            offerText: "Offers available",
            rating: 4.7,
            isPremiumService: true,
            deliveryFee: "$0.49",
            estimatedDeliveryTime: "25-45 min",
            isFavorite: false
        ),
        ASStoreModel(
            id: "sprouts-124",
            name: "Sprouts Farmers Market",
            logoURL: "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/128289834/original/39b3cd433ae96fea7fbb1795940ffa4665d6606f/create-restaurant-promo-or-food-promotion-video.png",
            backgroundImageURL: "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/128289834/original/39b3cd433ae96fea7fbb1795940ffa4665d6606f/create-restaurant-promo-or-food-promotion-video.png",
            offerText: "Offers available",
            rating: 4.7,
            isPremiumService: true,
            deliveryFee: "$0.49",
            estimatedDeliveryTime: "25-45 min",
            isFavorite: false
        )
    ]
}

///V-88,Paso 7.0  The main page of the Eats tab.
struct ASEatsTabPage: View {
    @State private var textFieldTextResult: String = ""
    @State private var isTextFieldFocused: Bool = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: ASSpacing.large) {
                //Paso 7.1
                DeliverNowHeaderView()
                //Paso 8.0
                searchBar
                //Paso 9.0
                categoriesCarousel
                //Paso 10.0
                chipsCarousel
                //V-92,paso 11.0
                featuredHeader
                storeCarousel
                divider
            }
        }
    }
    
    ///Paso 8.1 Search bar section.
    private var searchBar: some View {
        ASSearchBarView(
            placeholder: ASEatsTabPageConstants.Localizables.text4,
            textFieldTextResult: $textFieldTextResult,
            isTextFieldFocused: $isTextFieldFocused
        )
    }
    
    ///Paso 9.1  Categories carousel.
    private var categoriesCarousel: some View {
        ASCategoriesCarouselView(categories: ASEatsTabPageConstants.categories)
    }
    
    /// Paso 10.1,Filters carousel.
    private var chipsCarousel: some View {
        ASChipsCarouselView(models: ASEatsTabPageConstants.chipModels)
    }
    
    /// Paso 11.1 Featured section header.
    private var featuredHeader: some View {
        ASDoubleHeaderView(infoText: ASEatsTabPageConstants.Localizables.text5)
    }
    
    /// Stores carousel.
    private var storeCarousel: some View {
        ASStoreCardCarrouselView(models: ASEatsTabPageConstants.cardModels)
    }
    
    /// Divider at the bottom.
    private var divider: some View {
        ASDividerView(color: .gray)
    }
}

// MARK: - DeliverNowHeaderView
//Paso 7.2
private struct DeliverNowHeaderView: View {

    var body: some View {
        HStack {
            DeliverNowView()
            Spacer()
            HStack(spacing: ASSpacing.medium) {
                ASButtonChipView(model: ASButtonChipModel(id: "1",
                                                          title: ASEatsTabPageConstants.Localizables.text1,
                                                          iconSource: .right(systemName: ASEatsTabPageConstants.Images.chevronSystemName)))
                CartBadgeView()
            }
        }
    }
}

// MARK: - DeliverNowView
//Paso 6.4
private struct DeliverNowView: View {
 
    var body: some View {
        VStack(alignment: .leading, spacing: ASSpacing.zero) {
            Text(ASEatsTabPageConstants.Localizables.text2)
                .font(.h6Regular)
                .foregroundStyle(Color.grey700)
            HStack {
                Text(ASEatsTabPageConstants.Localizables.text3)
                    .font(.h6SemiBold)
                    .foregroundStyle(Color.dark)
                
                Image(systemName: ASEatsTabPageConstants.Images.chevronSystemName)
                    .font(.h6SemiBold)
                    .foregroundStyle(Color.dark)
            }
        }
    }
}

// MARK: - CartBadgeView
//Paso 7.5
private struct CartBadgeView: View {
    
    var body: some View {
        VStack(alignment: .trailing, spacing: ASSpacing.zero) {
            VStack {
                Text("2")
                    .font(.smallSemiBold)
                    .foregroundStyle(.white)
                    .padding(ASSpacing.extraSmall)
            }
            .background(Color.success)
            .clipShape(Circle())
            .offset(x: ASSpacing.small, y: ASSpacing.small)
            Image(systemName: ASEatsTabPageConstants.Images.cartSystemName)
                .font(.largeBold)
        }.offset(x: -ASSpacing.small, y: -ASSpacing.small)
    }
}


