//
//  LocationView.swift
//  SimpleRunning
//
//  Created by Tyler Linquata on 12/22/20.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        VStack {
            Text("Your location is:")
            HStack {
                Text("Latitude: \(locationViewModel.userLatitude)")
                Text("Longitude: \(locationViewModel.userLongitude)")
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
