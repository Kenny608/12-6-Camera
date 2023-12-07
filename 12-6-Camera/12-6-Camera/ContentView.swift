//
//  ContentView.swift
//  12-6-Camera
//
//  Created by Kenny Luchau on 12/6/23.
//

import SwiftUI
struct ContentView: View {
    @State private var showSheet = false
    @State private var image = UIImage()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var body: some View {
        VStack {
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
            HStack {
                Button(action: {
                    showSheet = true
                    sourceType = .photoLibrary
                }) {
                    Text("Photo library")
                        .font(.title2)
                }
                Spacer()
                Button(action: {
                    showSheet = true
                    sourceType = .camera
                }) {
                    Text("Camera")
                        .font(.title2)
                }
            }.padding()
        }.sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: sourceType, chosenImage: $image)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
