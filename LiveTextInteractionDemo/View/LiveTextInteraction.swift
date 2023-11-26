//
//  LiveTextInteraction.swift
//  LiveTextInteractionDemo
//
//  Created by Rehnuma Reza on 26/11/23.
//

import SwiftUI
import VisionKit

@MainActor
struct LiveTextInteraction: UIViewRepresentable {
    var imageName: String
    var imageView = LiveTextImageView()
    var analyzer =  ImageAnalyzer()
    var interaction = ImageAnalysisInteraction()
    
    func makeUIView(context: Context) -> some UIView {
        imageView.image = UIImage(named: imageName)
        imageView.addInteraction(interaction)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        Task {
            let configuration = ImageAnalyzer.Configuration([.text])
            
            guard let image = imageView.image else { return }
            
            let analysis = try? await analyzer.analyze(image, configuration: configuration)
            
            if let analysis = analysis {
                interaction.analysis = analysis
                interaction.preferredInteractionTypes = .textSelection
            }
        }
    }
}

class LiveTextImageView: UIImageView {
    
    //Use the intrinsic content size to change the default imageSize
    //  so that we can change the size in our SwiftUI View
    override var intrinsicContentSize: CGSize {
        .zero
    }
}
