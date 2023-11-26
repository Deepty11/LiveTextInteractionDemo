//
//  ContentView.swift
//  LiveTextInteractionDemo
//
//  Created by Rehnuma Reza on 26/11/23.
//

import SwiftUI
import VisionKit

struct ContentView: View {
    @State private var deviceSupportLiveText = false
    @State private var showDeviceDeviceCapacityAlert = false
    @State private var showLiveTextView = false
    
    var body: some View {
        Button(action: {
            if deviceSupportLiveText {
                showLiveTextView = true
            } else {
                showDeviceDeviceCapacityAlert = true
            }
        }, label: {
            Text("Pick an Image")
                .foregroundStyle(Color.white)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
        })
        .alert("Live text unavailable", isPresented: $showDeviceDeviceCapacityAlert, actions: {})
        .sheet(isPresented: $showLiveTextView) {
            LiveTextInteractionView()
        }
        .onAppear {
            deviceSupportLiveText = ImageAnalyzer.isSupported
        }
    }
}

#Preview {
    ContentView()
}
