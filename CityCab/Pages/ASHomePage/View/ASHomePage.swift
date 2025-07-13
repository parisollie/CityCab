//
//  ASHomePage.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 24/2/25.
//

import SwiftUI

//V-83,Paso 3.0
private enum ASHomePageConstants {
    //Modelos para cada pestaña
    enum TabModels {
        static let modelTab1: ASTabModel = ASTabModel(id: "1",
                                                      title: "Rides",
                                                      image: .asset(asset: "car_icon"),
                                                      primaryColor: .black,
                                                      isSelected: true)
        static let modelTab2: ASTabModel = ASTabModel(id: "2",
                                                      title: "Eats",
                                                      image: .asset(asset: "food_icon"),
                                                      primaryColor: .black,
                                                      isSelected: false)
    }
}

private enum TabState {
    case rides, eats
}

//Paso 3.1
struct ASHomePage: View {
    @State private var tabState: TabState = .rides
    
    var body: some View {
     
        ScrollView(showsIndicators: false) {
            ASDoubleTabSelectionView(modelTab1: ASHomePageConstants.TabModels.modelTab1,
                                     modelTab2: ASHomePageConstants.TabModels.modelTab2,
                                     delegate: self)
            switch tabState {
                case .rides:
                    //paso 3.3
                    ASHomeTabPage()
                       .padding(.top)
                case .eats:
                    ASEatsTabPage()
                        .padding(.top)
            }
        }.padding(.horizontal, 16)
    }
}

extension ASHomePage: ASDoubleTabSelectionViewDelegate {
    func didSelectTab1(_ tab1Model: ASTabModel) {
        tabState = .rides
    }
    
    func didSelectTab2(_ tab2Model: ASTabModel) {
        tabState = .eats
    }
}

#Preview {
    ASHomePage()
}


