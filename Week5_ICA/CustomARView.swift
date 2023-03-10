//
//  CustomARView.swift
//  Week5_ICA
//
//  Created by Alex Spoon on 3/2/23.
//

import RealityKit
import ARKit

class CustomARView: ARView {
    
    var DefaultConfiguration: ARWorldTrackingConfiguration {
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        let config = ARWorldTrackingConfiguration()
        
        config.detectionImages = referenceImages
        
        //Adding occlusion
        config.frameSemantics.insert(.personSegmentationWithDepth)
        config.sceneReconstruction = .mesh
        self.environment.sceneUnderstanding.options = .occlusion
        
        return config
    }
    
    required init (frame frameRect: CGRect)
    {
        super.init(frame: frameRect)
        configure()
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        session.run(DefaultConfiguration)
    }
}
