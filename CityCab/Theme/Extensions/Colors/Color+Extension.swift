//
//  AppColors.swift
//  ASUberDSPackage
//
//  Created by Paul F on 4/2/25.
//
import SwiftUI

//Paso 1.1, cambiamos la hextension del color hexadecimal ya que swift no permite hexa
extension Color {
    /// Initialize `Color` from a hexadecimal string (supports `#RRGGBB` and `#RRGGBBAA` formats)
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Remove `#` prefix if it exists
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgbValue)
        
        let r, g, b, a: Double
        
        switch hexSanitized.count {
        case 6: // #RRGGBB (No Alpha)
            r = Double((rgbValue >> 16) & 0xFF) / 255.0
            g = Double((rgbValue >> 8) & 0xFF) / 255.0
            b = Double(rgbValue & 0xFF) / 255.0
            a = 1.0 // Default alpha
            
        case 8: // #RRGGBBAA (Includes Alpha)
            r = Double((rgbValue >> 24) & 0xFF) / 255.0
            g = Double((rgbValue >> 16) & 0xFF) / 255.0
            b = Double((rgbValue >> 8) & 0xFF) / 255.0
            a = Double(rgbValue & 0xFF) / 255.0
            
        default: // Invalid format
            r = 0
            g = 0
            b = 0
            a = 1
        }
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }
}

extension Color {
    static let brownColor = Color(hex: "#530811")
    static let blueColor = Color(hex: "#266EF1")
}


