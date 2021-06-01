//
//  AboutPlaceViewModel.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import Foundation

class AboutPlaceViewModel: NSObject {
    private var dataManager: DataManager
    
    private(set) var placeDescription : PlaceDescription? {
        didSet {
            self.bindPlaceDescriptionToController()
        }
    }
    
    private(set) var placeImages : [String]? {
        didSet {
            self.bindPlaceImagesToController()
        }
    }
    
    
    var bindPlaceDescriptionToController : (() -> ()) = {}
    var bindPlaceImagesToController : (() -> ()) = {}
    
    init(dataManager: DataManager, placeName: String) {
        self.dataManager = dataManager
        super.init()
        callToDataManager(placeName: placeName)
    }
    
    private func callToDataManager(placeName: String){
        let queque = DispatchQueue.global(qos: .utility)
        queque.async {
            self.dataManager.callingPlaceDescription(placeName: placeName) { [weak self]
                (placeDescription) in
                self?.placeDescription = placeDescription
                let imagesArray = placeDescription.placePhotos.components(separatedBy: ",")
                self?.placeImages = imagesArray
            }
        }
    }
}
