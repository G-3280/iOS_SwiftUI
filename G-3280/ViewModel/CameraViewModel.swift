//
//  CameraViewModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/06/05.
//

import Foundation
import AVFoundation
import SwiftUI

//class CameraViewModel: ObservableObject {
//    private let model: Camera
//    private let session: AVCaptureSession
//    let cameraPreview: AnyView
//
//    @Published var isFlashOn = false
//    @Published var isSilentModeOn = false
//    
//    init() {
//        print("초기화")
//        model = Camera()
//        session = model.session
//        cameraPreview = AnyView(CameraPreview(session: session))
//    }
//    
//    func configure() {
//        model.requestAndCheckPermissions()
//        print("Camera Check")
//    }
//    
//    func switchFlash() {
//        isFlashOn.toggle()
//    }
//    
//    func switchSilent() {
//        isSilentModeOn.toggle()
//    }
//    
//    func capturePhoto() {
//        print("capturePhoto running")
//        model.capturePhoto()
//        print("[CameraViewModel]: Photo captured!")
//    }
//    
//    func changeCamera() {
//        print("[CameraViewModel]: Camera changed!")
//    }
//}
