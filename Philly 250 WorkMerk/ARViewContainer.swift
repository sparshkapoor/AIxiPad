//
//  ARViewContainer.swift
//  Philly 250 WorkMerk
//
//  Created by WorkMerkDev on 6/18/24.
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelURL: URL?

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.automaticallyConfigureSession = true
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelURL = modelURL {
            loadModel(url: modelURL, into: uiView)
        }
    }

    private func loadModel(url: URL, into arView: ARView) {
        guard let modelEntity = try? ModelEntity.loadModel(contentsOf: url) else { return }
        let anchorEntity = AnchorEntity(world: [0, 0, -0.5])
        anchorEntity.addChild(modelEntity)
        arView.scene.addAnchor(anchorEntity)
    }
}

