//
//  ContentView.swift
//  Philly 250 WorkMerk
//
//  Created by WorkMerkDev on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var prompt: String = ""
    @State private var modelURL: URL? = nil
    @State private var progress: Double = 0.0
    @FocusState var focus: Bool
    var body: some View {
        ZStack {
            ARViewContainer(modelURL: $modelURL)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                TextField("Enter model details", text: $prompt)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(height: 60)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
                    .focused($focus)
                    .onAppear {
                        focus = true
                    }
                
                Button("Generate Model") {
                    MeshyAPI.shared.generate3DModel(from: prompt, progressUpdate: { progress in
                        DispatchQueue.main.async {
                            self.progress = progress
                        }
                    }) { url in
                        DispatchQueue.main.async {
                            self.modelURL = url
                        }
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                if progress > 0 && progress < 1 {
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding()
                }
            }
            .padding()
            .background(Color.black.opacity(0.7))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

