//
//  ServiceItemView.swift
//  Uber Ui Clone
//
//  Created by Paul F on 8/2/25.
//

import SwiftUI

private enum ASServiceItemViewConstants {
    enum Sizes {
        static let imageSizeSmall: CGFloat = 70
        static let imageSizeBig: CGFloat = 80
    }
}

struct ASServiceItemView: View {
    let model: ASServiceItemModel

    var body: some View {
        VStack {
            Image(model.image)
                .resizable()
                .scaledToFit()
                .frame(width: model.size == .small ? ASServiceItemViewConstants.Sizes.imageSizeSmall : ASServiceItemViewConstants.Sizes.imageSizeBig,
                       height: model.size == .small ? ASServiceItemViewConstants.Sizes.imageSizeSmall : ASServiceItemViewConstants.Sizes.imageSizeBig)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(model.title)
                .font(.mediumMedium)
                .foregroundColor(.black)
        }
        .padding(.horizontal, model.size == .small ? 8 : 16)
        .padding(.vertical, model.size == .small ? 8 : 16)
        .background(Color.grey250)
        .clipShape(.rect(cornerRadius: 18))
        .overlay(alignment: .top) {
            if !model.promoText.isEmpty {
                Text(model.promoText)
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.success)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .offset(y:-8)
            }
        }
    }
}

#Preview {
    ASServiceItemView(model: ASServiceItemModel(
        id: "1",
        title: "Ride",
        image: "car_icon",
        promoText: "Promo"))
}

