//
//  RideHistoryView.swift
//  Uber Ui Clone
//
//  Created by Paul F on 8/2/25.
//

import SwiftUI

/// A view displaying a single ride history entry with an icon, address, and city.
struct ASRideHistoryView: View {
    let ride: ASRideHistoryModel
    
    var body: some View {
        VStack(spacing: ASSpacing.extraSmall) {
            HStack(alignment: .top, spacing: ASSpacing.medium) {
                rideIcon
                rideDetails
                Spacer()
            }
        }
        .padding(.vertical, ASSpacing.small)
    }
    
    /// Icon representing ride history.
    private var rideIcon: some View {
        Image(systemName: "clock.fill")
            .font(.h6Medium)
            .foregroundColor(.textPrimary)
    }
    
    /// Displays ride details including address and city.
    private var rideDetails: some View {
        VStack(alignment: .leading, spacing: ASSpacing.extraSmall) {
            Text(ride.address)
                .font(.h6SemiBold)
                .foregroundColor(.grey800)
            
            Text(ride.city)
                .font(.largeRegular)
                .foregroundColor(.grey500)
            
            ASDividerView(color: Color.grey100)
        }
    }
}

// MARK: - Preview
#Preview {
    ASRideHistoryView(
        ride: ASRideHistoryModel(id: "1", address: "Plaza Catalunya", city: "Barcelona")
    )
}
