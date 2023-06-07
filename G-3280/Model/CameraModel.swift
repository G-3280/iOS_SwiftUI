//
//  CameraModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/06/05.
//

import Foundation
import AVFoundation
import UIKit

class Camera: NSObject, ObservableObject {
    var session = AVCaptureSession()
    var videoDeviceInput: AVCaptureDeviceInput!
    let output = AVCapturePhotoOutput()
    
    var photoData = Data(count: 0)
    
    // 카메라 셋업 과정을 담당하는 함수, positio
    func setUpCamera() {
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                for: .video, position: .back) {
            do { // 카메라가 사용 가능하면 세션에 input과 output을 연결
                session.beginConfiguration()
                videoDeviceInput = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(videoDeviceInput) {
                    session.addInput(videoDeviceInput)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                    output.isHighResolutionCaptureEnabled = true
                    output.maxPhotoQualityPrioritization = .quality
                    session.commitConfiguration()
                }
                
                DispatchQueue.global(qos: .userInitiated).async {
                    self.session.startRunning() // 세션 시작
                    
                    if self.session.isRunning {
                        print("세션 동작중")
                    } else {
                        print("동작 실패")
                    }
                }
                
            } catch {
                print(error) // 에러 프린트
            }
        }
    }
    
    func requestAndCheckPermissions() {
        
        print("카메라 권한 상태")
        // 카메라 권한 상태 확인
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            // 권한 요청
            AVCaptureDevice.requestAccess(for: .video) { [weak self] authStatus in
                if authStatus {
                    DispatchQueue.main.async {
                        self?.setUpCamera()
                    }
                }
            }
        case .restricted:
            break
        case .authorized:
            // 이미 권한 받은 경우 셋업
            setUpCamera()
        default:
            // 거절했을 경우
            print("Permession declined")
        }
    }
    
    func capturePhoto() {
        
        print("Capture Setting")
        
        // 사진 옵션 세팅
        let photoSettings = AVCapturePhotoSettings()
        
        // 세션이 실행 중이지 않은 경우 세션 시작
            if !self.session.isRunning {
                self.session.startRunning()
            }

            // 세션 실행 상태 확인 후 사진 캡처
            if self.session.isRunning {
                self.output.capturePhoto(with: photoSettings, delegate: self)
            } else {
                print("session 실행중 아님")
            }
        

//        if self.session.isRunning {
//            self.output.capturePhoto(with: photoSettings, delegate: self)
//        } else {
//            print("session 실행중 아님")
//        }
        
        
        print("[Camera]: Photo's taken")
    }
    
    func savePhoto(_ imageData: Data) {
        guard let image = UIImage(data: imageData) else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        // 사진 저장하기
        print("[Camera]: Photo's saved")
    }
}

// ✅ extension 추가
extension Camera: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, willBeginCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return print("\(String(describing: error))")}
        self.savePhoto(imageData)
        
        print("[CameraModel]: Capture routine's done")
    }
}
