//
//  MissionProgressViewStyle.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/14.
//

import SwiftUI

struct MissionProgressViewStyle: ProgressViewStyle {
    
    var height: CGFloat
    @Binding var value: Double
    @Binding var total: Double
    
    func makeBody(configuration: Configuration) -> some View {
        let offset = CGFloat(value) / total
        
        return GeometryReader{ geometry in
            
            Capsule()
                .foregroundColor(Color.gray.opacity(0.3))
                .frame(height: height)
            
            Capsule()
                .foregroundColor(.customAccentGreen)
                .frame(height: height)
                .frame(width: geometry.size.width * offset + 2)
                .animation(.easeInOut, value: value)
            
            VStack{
                HStack{
                    
                    if value == total {
                        
                        Spacer()
                        
                        Text("완료!")
                            .font(.system(size: 10))
                            .foregroundColor(.customMissionBarGray)
                            .padding(.top, 8)
                            .padding(.trailing, -10)
                    } else {
                        
                        Text("\(Int(value))")
                            .font(.system(size: 10))
                            .foregroundColor(.customMissionBarGray)
                            .frame(width: CGFloat(geometry.size.width * offset + 4), height: 20, alignment: .bottomTrailing)
                        
                        Spacer()
                        
                        Text("\(Int(total))")
                            .font(.system(size: 10))
                            .foregroundColor(.customMissionBarGray)
                            .frame(width: 13, height: 20, alignment: .bottomTrailing)
                            .padding(.trailing, -7)
                    }
                }
                .padding(.trailing, 3)
            }
            .padding(.top, 10)
        }
    }
}
