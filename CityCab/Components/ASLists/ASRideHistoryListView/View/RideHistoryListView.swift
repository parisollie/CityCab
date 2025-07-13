//
//  RideHistoryListView.swift
//  Uber Ui Clone
//
//  Created by Paul F on 8/2/25.
//

import SwiftUI

///Paso 4.1 A list view displaying a collection of ride history entries.
struct ASRideHistoryListView: View {
    let rideHistory: [ASRideHistoryModel]
    
    var body: some View {
        VStack(spacing: ASSpacing.small) {
            ForEach(rideHistory, id: \.self) { ride in
                ASRideHistoryView(ride: ride)
                    .padding(.horizontal, ASSpacing.medium)
            }
        }
        .padding(.vertical, ASSpacing.medium)
    }
}

// MARK: - Preview
#Preview {
    ASRideHistoryListView(
        rideHistory: [
            ASRideHistoryModel(id: "1", address: "Santa Fe", city: "CDMX"),
            ASRideHistoryModel(id: "2", address: "Parque la Mexicana", city: "CDMX")
        ]
    )
}

