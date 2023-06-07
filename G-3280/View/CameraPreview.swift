//
//  CameraPreviewView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/06/02.
//

import UIKit
import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var cameraController: CameraController

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        guard let previewLayer = cameraController.previewLayer else {
            return view
        }

        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.bounds

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        guard let previewLayer = cameraController.previewLayer else {
            return
        }

        previewLayer.frame = uiView.bounds
    }
    
//    class VideoPreviewView: UIView {
//        override class var layerClass: AnyClass {
//             AVCaptureVideoPreviewLayer.self
//        }
//
//        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
//            return layer as! AVCaptureVideoPreviewLayer
//        }
//    }
//
//    let session: AVCaptureSession
//    func makeUIView(context: Context) -> VideoPreviewView {
//        let view = VideoPreviewView()
//
//        view.backgroundColor = .black
//        view.videoPreviewLayer.videoGravity = .resizeAspectFill
//        view.videoPreviewLayer.cornerRadius = 0
//        view.videoPreviewLayer.session = session
//        view.videoPreviewLayer.connection?.videoOrientation = .portrait
//
//        return view
//    }
//
//    func updateUIView(_ uiView: VideoPreviewView, context: Context) {
//
//    }
}
