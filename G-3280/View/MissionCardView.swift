//
//  MissionCardView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/12.
//

import SwiftUI

struct MissionCardView: View {
    
    var cardData: Mission
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack{
                    Image("seleted_\(cardData.type)")
                        .resizable()
                        .frame(width:20, height: 20)
                    
                    Text("\(cardData.title)")
                        .foregroundColor(.customMissionGray)
                        .font(.subheadline)
                }
                
                Text(cardData.description)
                    .font(.headline)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: true, vertical: false)
            }
            
            Spacer()
            
            if cardData.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .foregroundColor(.customMissionGreen)
                    .frame(width: 40, height: 40)
            } else {
                EmptyView()
                    .frame(width: 40, height: 40)
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

//struct MissionCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MissionCardView(cardData: missionData[1])
//    }
//}
