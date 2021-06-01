//
//  RouteToPlaceViewModel.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import Foundation


class RouteToPlaceViewModel: NSObject {
    private var dataManager: DataManager
    
    private(set) var placeRoute : PlaceRoute? {
        didSet {
            self.bindPlaceRouteToController()
        }
    }
    
    var bindPlaceRouteToController : (() -> ()) = {}
    
    init(dataManager: DataManager, placeName: String) {
        self.dataManager = dataManager
        super.init()
        callToDataManager(placeName: placeName)
    }
    
    private func callToDataManager(placeName: String){
        let queque = DispatchQueue.global(qos: .utility)
        queque.async {
            self.dataManager.callingPlaceRoute(placeName: placeName) { [weak self]
                (placeRoute) in
                self?.placeRoute = placeRoute
            }
        }
    }
}
