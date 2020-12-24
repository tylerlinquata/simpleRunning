//
//  RunView.swift
//  SimpleRunning
//
//  Created by Tyler Linquata on 12/22/20.
//

import SwiftUI

struct RunView: View {
    @ObservedObject var runViewModel = RunViewModel()
    
    var body: some View {
        VStack {
            Text("Distance:")
            Text("Time: \(runViewModel.seconds)")
            Text("Pace:")
            Button(action: {}, label: {
                Text("Stop")
            })
        }
        .onAppear(perform: {
            runViewModel.startTimer()
        })
        .onDisappear(perform: {
            runViewModel.stopTimer()
        })
    }
}

struct RunView_Previews: PreviewProvider {
    static var previews: some View {
        RunView()
    }
}
