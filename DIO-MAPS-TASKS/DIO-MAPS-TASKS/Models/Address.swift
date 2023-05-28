//
//  Address.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 26/05/23.
//

import Foundation
import Contacts
import CoreLocation

struct Address {
    var name: String
    var placemark: CLPlacemark
    var postalAddress: CNPostalAddress
    
    init(name: String, placemark: CLPlacemark, postalAddress: CNPostalAddress) {
        self.name = name
        self.placemark = placemark
        self.postalAddress = postalAddress
    }
}
