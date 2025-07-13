//
//  ASStoreModel.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 10/3/25.
//
import Foundation

/// Paso 11.3 Model representing a store with its details and metadata
///
/// This model conforms to Identifiable for unique identification in lists
/// and Hashable for use in collections requiring value equality
struct ASStoreModel: Identifiable, Hashable {
    // MARK: - Properties
    
    /// Unique identifier for the store
    let id: String
    
    /// Display name of the store
    let name: String
    
    /// URL string for the store's logo image
    let logoURL: String
    
    /// URL string for the store's background/hero image
    let backgroundImageURL: String
    
    /// Optional promotional text to display (special offers, etc.)
    let offerText: String?
    
    /// Customer rating of the store (typically on a scale of 0-5)
    let rating: Double
    
    /// Indicates if this store provides premium services
    let isPremiumService: Bool
    
    /// Text representation of the delivery fee (e.g., "$2.99", "Free")
    let deliveryFee: String
    
    /// Estimated delivery time in text format (e.g., "15-20 min")
    let estimatedDeliveryTime: String
    
    /// Indicates if the user has marked this store as a favorite
    /// This is a variable property as it can change based on user interaction
    var isFavorite: Bool
    
    // MARK: - Initialization
    
    /// Creates a new store model with the specified properties
    /// - Parameters:
    ///   - id: Unique identifier for the store
    ///   - name: Display name of the store
    ///   - logoURL: URL string for the store's logo image
    ///   - backgroundImageURL: URL string for the store's background/hero image
    ///   - offerText: Optional promotional text (default: nil)
    ///   - rating: Customer rating of the store (default: 0.0)
    ///   - isPremiumService: Indicates if this store provides premium services (default: false)
    ///   - deliveryFee: Text representation of the delivery fee (default: empty string)
    ///   - estimatedDeliveryTime: Estimated delivery time in text format (default: empty string)
    ///   - isFavorite: Indicates if the user has marked this store as a favorite (default: false)
    init(
        id: String,
        name: String,
        logoURL: String,
        backgroundImageURL: String,
        offerText: String? = nil,
        rating: Double = 0.0,
        isPremiumService: Bool = false,
        deliveryFee: String = "",
        estimatedDeliveryTime: String = "",
        isFavorite: Bool = false
    ) {
        self.id = id
        self.name = name
        self.logoURL = logoURL
        self.backgroundImageURL = backgroundImageURL
        self.offerText = offerText
        self.rating = rating
        self.isPremiumService = isPremiumService
        self.deliveryFee = deliveryFee
        self.estimatedDeliveryTime = estimatedDeliveryTime
        self.isFavorite = isFavorite
    }
    
    // MARK: - Hashable Conformance
    
    /// Hashes the essential properties of the store model
    /// - Parameter hasher: The hasher to use when combining the components
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    /// Compares two store models for equality
    /// - Parameters:
    ///   - lhs: The left-hand side store model to compare
    ///   - rhs: The right-hand side store model to compare
    /// - Returns: True if the store models are equal, false otherwise
    static func == (lhs: ASStoreModel, rhs: ASStoreModel) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Helper Extensions

extension ASStoreModel {
    /// Creates a sample store model for previews and testing
    /// - Returns: A pre-populated ASStoreModel instance
    static func sample() -> ASStoreModel {
        return ASStoreModel(
            id: "sample-1",
            name: "Sample Store",
            logoURL: "sample_logo",
            backgroundImageURL: "sample_background",
            offerText: "20% off your first order!",
            rating: 4.5,
            isPremiumService: true,
            deliveryFee: "$1.99",
            estimatedDeliveryTime: "15-25 min"
        )
    }
    
    /// Creates an array of sample store models for previews and testing
    /// - Parameter count: Number of sample models to create
    /// - Returns: An array of pre-populated ASStoreModel instances
    static func samples(count: Int = 3) -> [ASStoreModel] {
        var samples: [ASStoreModel] = []
        
        for i in 1...count {
            samples.append(
                ASStoreModel(
                    id: "sample-\(i)",
                    name: "Sample Store \(i)",
                    logoURL: "sample_logo_\(i)",
                    backgroundImageURL: "sample_background_\(i)",
                    offerText: i % 2 == 0 ? "Special offer!" : nil,
                    rating: Double(3 + (i % 3)) / 2.0 + 2.5,
                    isPremiumService: i % 3 == 0,
                    deliveryFee: i % 3 == 0 ? "Free" : "$\(i).99",
                    estimatedDeliveryTime: "\(10 + (i * 5))-\(20 + (i * 5)) min",
                    isFavorite: i % 4 == 0
                )
            )
        }
        
        return samples
    }
}
