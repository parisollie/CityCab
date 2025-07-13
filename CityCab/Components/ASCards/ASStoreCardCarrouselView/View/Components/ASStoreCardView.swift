//
//  ASStoreCardView.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 10/3/25.
//

import SwiftUI

/// Paso 11.4 Constants used within ASStoreCardView.
private enum ASStoreCardConstants {
    enum Sizes {
        static let imageHeight: CGFloat = 200
        static let favoriteButtonSize: CGFloat = 44
        static let ratingBadgeSize: CGFloat = 40
    }
}

/// Delegate protocol for ASStoreCardView to handle user interactions.
protocol ASStoreCardViewDelegate {
    func cardTapped(_ model: ASStoreModel)
    func onFavoriteToggle(_ model: ASStoreModel, isFavorite: Bool)
}

/// A card view displaying store details, including an image, name, rating, and delivery info.
struct ASStoreCardView: View {
    private let store: ASStoreModel
    private var delegate: ASStoreCardViewDelegate?
    
    @State private var isFavorite: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: ASSpacing.small) {
            ASStoreCardImageSectionView(
                backgroundImageURL: store.backgroundImageURL,
                offerText: store.offerText,
                isFavorite: $isFavorite,
                onFavoriteToggle: { isFavorite in
                    self.isFavorite = isFavorite
                    delegate?.onFavoriteToggle(store, isFavorite: self.isFavorite)
                }
            )
            ASStoreCardInfoSectionView(store: store)
        }
        .clipShape(RoundedRectangle(cornerRadius: ASRadius.medium))
        .onTapGesture { delegate?.cardTapped(store) }
    }
    
    /// Initializes an ASStoreCardView.
    /// - Parameters:
    ///   - store: The store data model.
    ///   - delegate: An optional delegate to handle interactions.
    init(
        store: ASStoreModel,
        delegate: ASStoreCardViewDelegate? = nil
    ) {
        self.store = store
        self.delegate = delegate
        self._isFavorite = State(initialValue: store.isFavorite)
    }
}

/// Image section of the store card.
struct ASStoreCardImageSectionView: View {
    let backgroundImageURL: String
    let offerText: String?
    @Binding var isFavorite: Bool
    var onFavoriteToggle: ((Bool) -> Void)?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ASAsyncImageView(source: .remote(url: URL(string: backgroundImageURL)))
                .frame(height: ASStoreCardConstants.Sizes.imageHeight)
                .clipped()
            
            HStack {
                if let offerText {
                    Text(offerText)
                        .font(.smallBold)
                        .foregroundColor(Color.light)
                        .padding(.horizontal, ASSpacing.medium)
                        .padding(.vertical, ASSpacing.extraSmall)
                        .background(Color.success)
                        .clipShape(Capsule())
                }
                Spacer()
                
                Button(action: {
                    isFavorite.toggle()
                    onFavoriteToggle?(isFavorite)
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.largeMedium)
                        .foregroundColor(isFavorite ? Color.error : .white)
                        .frame(width: ASStoreCardConstants.Sizes.favoriteButtonSize,
                               height: ASStoreCardConstants.Sizes.favoriteButtonSize)
                        .background(Color.black.opacity(0.2))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal, ASSpacing.small)
            .padding(.top, ASSpacing.small)
        }
    }
}

/// Information section of the store card, including store name, rating, and delivery info.
struct ASStoreCardInfoSectionView: View {
    let store: ASStoreModel

    var body: some View {
        VStack(alignment: .leading, spacing: ASSpacing.small) {
            HStack {
                Text(store.name)
                    .font(.h6Bold)
                    .foregroundColor(.textPrimary)
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color.grey200)
                        .frame(width: ASStoreCardConstants.Sizes.ratingBadgeSize,
                               height: ASStoreCardConstants.Sizes.ratingBadgeSize)
                    
                    Text(String(format: "%.1f", store.rating))
                        .font(.mediumBold)
                        .foregroundColor(.textPrimary)
                }
            }
            
            HStack(spacing: ASSpacing.extraSmall) {
                if store.isPremiumService {
                    Image(systemName: "crown.fill")
                        .foregroundColor(.secondary)
                        .font(.largeMedium)
                }
                
                Text("•")
                    .foregroundColor(.textSecondary)
                
                Text("\(store.deliveryFee) Delivery Fee")
                    .font(.largeRegular)
                    .foregroundColor(.textPrimary)
                
                Text("•")
                    .foregroundColor(.textSecondary)
                
                Text(store.estimatedDeliveryTime)
                    .font(.largeRegular)
                    .foregroundColor(.textSecondary)
            }
        }
        .padding(ASSpacing.medium)
        .background(.background)
    }
}

/// Preview for ASStoreCardView.
struct ASStoreCardView_Previews: PreviewProvider {
    static var previews: some View {
        ASStoreCardView(
            store: ASStoreModel(
                id: "sprouts-123",
                name: "Sprouts Farmers Market",
                logoURL: "https://example.com/logo.png",
                backgroundImageURL: "https://example.com/image.png",
                offerText: "Offers available",
                rating: 4.7,
                isPremiumService: true,
                deliveryFee: "$0.49",
                estimatedDeliveryTime: "25-45 min",
                isFavorite: false
            )
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
