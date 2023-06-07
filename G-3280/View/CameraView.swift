//
//  CameraView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/06/02.
//

import SwiftUI

struct CameraView: View {
    @StateObject private var cameraController = CameraController()
    @State private var capturedImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    @State private var isShowingActivityIndicator = false
    @Binding var stack: [Int]

    var body: some View {
        ZStack {
            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                CameraPreview(cameraController: cameraController)
            }

            VStack {
                Spacer()

                Button(action: {
                    isShowingImagePicker = true
                }) {
                    Text("Retake Photo")
                }
                .padding()
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
                .padding(.bottom, 20)

                Button(action: {
                    processCapturedImage()
                }) {
                    Text("Use Photo")
                }
                .padding()
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
            }
            .padding()
            .opacity(capturedImage != nil ? 1 : 0)
        }
        .sheet(isPresented: $isShowingImagePicker) {
//            ImagePicker(isShown: $isShowingImagePicker, image: $capturedImage)
//            ImagePicker(selectedImage: $capturedImage)
        }
        .overlay(
            Group {
                if isShowingActivityIndicator {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        )
                }
            }
        )
    }

    func processCapturedImage() {
        guard let image = capturedImage else { return }

        isShowingActivityIndicator = true

        // Process the captured image here

        // For demonstration purposes, we simulate image processing with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isShowingActivityIndicator = false
        }
    }
//    @ObservedObject var cameraViewModel = CameraViewModel()
//    @Binding var stack: [Int]
//
//    var body: some View {
//        ZStack {
//            cameraViewModel.cameraPreview
//                .ignoresSafeArea()
//                .onAppear {
//                    cameraViewModel.configure()
//                }
//
//            VStack {
//                GeometryReader { geometry in
//                    HStack(alignment: .bottom,spacing: 0) {
//                        Color.clear
//                            .frame(width: geometry.size.width/3)
//                        Button(action: {
//                            print("촬영 버튼 실행")
//                            cameraViewModel.capturePhoto()
//                        }) {
//                            Circle()
//                                .stroke(lineWidth: 5)
//                                .frame(width: 75, height: 75)
//                                .padding()
//                        }
//                        .frame(width: geometry.size.width/3)
//
//                        Button(action: {
//                            cameraViewModel.changeCamera()
//                        }) {
//                            Image(systemName: "arrow.triangle.2.circlepath.camera")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 50, height: 50)
//
//                        }
//                        .frame(width: 75, height: 75)
//                        .padding()
//                        .frame(width: geometry.size.width/3)
//                    }
//                }
//            }
//        }.onAppear {
//            print("Camera View load")
//        }
//    }
}

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
