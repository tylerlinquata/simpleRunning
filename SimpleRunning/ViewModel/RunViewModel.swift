//
//  RunViewModel.swift
//  SimpleRunning
//
//  Created by Tyler Linquata on 12/22/20.
//

import Foundation
import Combine
import CoreLocation

class RunViewModel: NSObject, ObservableObject {
    @Published var seconds = 0
    @Published var distance = Measurement(value: 0, unit: UnitLength.meters)
    
    var timer: Timer?
    var locationList: [CLLocation] = []
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.seconds += 1
        }
    }
    
    deinit {
        self.timer?.invalidate()
        self.locationManager.stopUpdatingLocation()
    }
}

extension RunViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
    }
}
