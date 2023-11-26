//
//  LiveTextInteractionView.swift
//  LiveTextInteractionDemo
//
//  Created by Rehnuma Reza on 26/11/23.
//

import SwiftUI

struct LiveTextInteractionView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView(content: {
            LiveTextInteraction(imageName: "1")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Cancel")
                        })
                    }
                })
                .interactiveDismissDisabled(true)
        })
    }
}

#Preview {
    LiveTextInteractionView()
}
