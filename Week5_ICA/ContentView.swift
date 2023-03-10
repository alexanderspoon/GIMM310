//
//  ContentView.swift
//  Week5_ICA
//
//  Created by Alex Spoon on 2/9/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    
    @State var materialState: Bool = false;
    @State var materialState2: Bool = false;

    func makeUIView(context: Context) -> CustomARView {
        
        let arView = CustomARView(frame: .zero)
        
        context.coordinator.arView = arView
        
        arView.session.delegate = context.coordinator

        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadNotification()
        
        boxAnchor.actions.someBehavior.onAction = handleTapOnEntity(_:)
        boxAnchor.actions.someBehavior2.onAction = handleTapOnEntity2(_:)

        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        context.coordinator.boxScene = boxAnchor
        return arView
        
    }
    
    func handleTapOnEntity(_ entity: Entity?) {
        guard let entity = entity else { return }
      
        var modelEntity = entity.children[0] as? ModelEntity
        
        if materialState == false {
            modelEntity?.model?.materials = [SimpleMaterial(color: UIColor.red, isMetallic: true)]
            materialState = true
        } else {
            modelEntity?.model?.materials = [SimpleMaterial(color: UIColor.green, isMetallic: true)]
            materialState = false
        }
        
    }
    
    func handleTapOnEntity2(_ entity: Entity?) {
        guard let entity = entity else { return }
        var modelEntity2 = entity.children[0] as? ModelEntity
        
        print(materialState2)
        if materialState2 == false {
            modelEntity2?.model?.materials = [SimpleMaterial(color: UIColor.red, isMetallic: true)]
            materialState2 = true
        } else {
            modelEntity2?.model?.materials = [SimpleMaterial(color: UIColor.green, isMetallic: true)]
            materialState2 = false
        }
    }
    
    
    
    func updateUIView(_ uiView: CustomARView, context: Context) {}
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
}




class Coordinator: NSObject, ARSessionDelegate
{
    
    weak var arView: CustomARView?
    weak var boxScene: Experience.Notification?
    
    override init() {
        super.init()
    }
    
    func Update() {
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Timer fired!")
        }
        
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            
            if anchor.name == "duck" {
                //If anchor from Asset's name is duck, do whatever
                
                //Creating a new anchor on top of image anchor
                let anchorEntity = AnchorEntity(world: anchor.transform)
                
                //Add experience onto the anchor
                let boxAnchor = try! Experience.loadNotification()
                anchorEntity.addChild(boxAnchor)
                arView!.scene.anchors.append(boxAnchor)

            }
        }
    }
}
