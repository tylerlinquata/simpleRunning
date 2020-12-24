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
    @Published var pace = 0.0
    
    private var timer: Timer?
    private var locationsList: [CLLocation] = []
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.seconds += 1
        }
    }
    
    func pauseTimer() {
        self.timer?.invalidate()
    }
    
    func endRun() {
        self.timer?.invalidate()
        self.locationManager.stopUpdatingLocation()
        self.seconds = 0
    }
}

extension RunViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for newLocation in locations {
            let secondsSinceLocationUpdate = newLocation.timestamp.timeIntervalSinceNow
            guard newLocation.horizontalAccuracy < 20 && abs(secondsSinceLocationUpdate) < 10 else {
                continue
            }
            
            if let lastLocation = locationsList.last {
                let delta = newLocation.distance(from: lastLocation)
                distance = distance + Measurement(value: delta, unit: UnitLength.meters)
            }
            
            locationsList.append(newLocation)
        }
    }
}
