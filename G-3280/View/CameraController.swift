//
//  CameraController.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/06/05.
//

import Foundation
import AVFoundation
import UIKit

class CameraController: NSObject, ObservableObject {
    private let session = AVCaptureSession()
    private var videoDeviceInput: AVCaptureDeviceInput?
    private let photoOutput = AVCapturePhotoOutput()

    var previewLayer: AVCaptureVideoPreviewLayer? {
        return AVCaptureVideoPreviewLayer(session: session)
    }

    @Published var capturedImage: UIImage?

    override init() {
        super.init()
        setupCamera()
    }

    private func setupCamera() {
        
        print("setup 중")
        session.beginConfiguration()

        guard let videoDevice = AVCaptureDevice.default(for: .video) else {
            print("Failed to access the camera.")
            return
        }

        do {
            let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice)

            if session.canAddInput(videoDeviceInput) {
                session.addInput(videoDeviceInput)
                self.videoDeviceInput = videoDeviceInput
            }

            if session.canAddOutput(photoOutput) {
                session.addOutput(photoOutput)
            }

            session.commitConfiguration()
            DispatchQueue.global().async {
                print("session 시작")
                self.session.startRunning()
            }
        } catch {
            print("Failed to set up the camera: \(error)")
        }
    }

    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
}

extension CameraController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation(), let image = UIImage(data: imageData) {
            capturedImage = image
        }
    }
}
