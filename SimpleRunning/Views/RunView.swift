//
//  RunView.swift
//  SimpleRunning
//
//  Created by Tyler Linquata on 12/22/20.
//

import SwiftUI

struct RunView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var runViewModel = RunViewModel()
    @State var showingAlert = false
    
    var body: some View {
        VStack {
            Text("Distance:")
            Text("Time: \(runViewModel.seconds)")
            Text("Pace:")
            Button(action: {
                self.showingAlert = true
                self.runViewModel.pauseTimer()
            }, label: {
                Text("Stop")
            })
            .alert(isPresented: $showingAlert, content: {
                Alert(
                    title: Text("End run?"),
                    message: Text("Do you wish to end your run?"),
                    primaryButton: .default(Text("Save"), action: endRun),
                    secondaryButton: .cancel(Text("Cancel"), action: resumeRun)
                )
            })
        }
        .onAppear(perform: {
            self.runViewModel.startTimer()
        })
    }
    
    private func resumeRun() {
        self.runViewModel.startTimer()
    }
    
    private func endRun() {
        self.runViewModel.endRun()
        self.mode.wrappedValue.dismiss()
    }
}

struct RunView_Previews: PreviewProvider {
    static var previews: some View {
        RunView()
    }
}
