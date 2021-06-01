//
//  GroupsViewModel.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import Foundation

class GroupsViewModel: NSObject {
    private var dataManager: DataManager
    
    private(set) var groupsArray : [Group]? {
        didSet {
            self.bindGroupsToController()
        }
    }
    
    
    var bindGroupsToController : (() -> ()) = {}
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init()
        callToDataManager()
    }
    
    private func callToDataManager(){
        let queque = DispatchQueue.global(qos: .utility)
        queque.async {
            self.dataManager.callingGroupsList { [weak self]
                (groups) in
                self?.groupsArray = groups
            }
        }
    }
}
