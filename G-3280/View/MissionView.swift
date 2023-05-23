//
//  MissionView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/01.
//

import SwiftUI

struct MissionView: View {
    
    @StateObject var missionViewModel = MissionViewModel()
    
    @State private var selectedMission: missionInfo = .today
    @State private var selectedMissionCategory: missionCategory = .none
    @Namespace private var missionAnimation
    @Namespace private var missionCategoryAnimation
    
    @State private var currentTime: String = ""
    
    var body: some View {
        ZStack{
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    topBar
                    
                    topMenuBar
                    
                    missionCategoryMenuBar
                }
                .padding(.horizontal, 28)
                .padding(.top, 20)
                
                List(missionViewModel.nowMission) { data in
                    MissionCardView(cardData: data)
                        .padding(.horizontal, 28)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .shadow(color: Color.customGray ,radius: 5)
                }
                .listStyle(.plain)
            }
        }
            
    }
    
    @ViewBuilder
    private var topBar: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(selectedMission == .today ? "Today" : "Weak")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "info.circle")
                        .foregroundColor(.customMissionBarGray)
                }
                
            }
            .padding(.bottom, 1)
            
            Text(currentTime)
                .foregroundColor(.customMissionBarGray)
                .onAppear {
                    currentTime = missionViewModel.getCurrentTime()
                }
        }
    }
    
    @ViewBuilder
    private var topMenuBar: some View {
        HStack {
            ForEach(missionInfo.allCases, id: \.self) { item in
                ZStack {
                    if selectedMission == item {
                        Capsule()
                            .frame(height: 40)
                            .foregroundColor(.customMissionGreen)
                            .matchedGeometryEffect(id: "info", in: missionAnimation)
                    }
                    
                    Text(item.stringValue())
                        .frame(maxWidth: .infinity/4, minHeight: 50)
                        .font(.subheadline)
                        .foregroundColor(selectedMission == item ? .black: .customMissionBarGray)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedMission = item
                        self.selectedMissionCategory = .none
                        missionViewModel.updateNowMissionForCategory(info: selectedMission, category: selectedMissionCategory)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var missionCategoryMenuBar: some View {
        HStack(spacing: 20) {
            ForEach(missionCategory.allCases, id: \.self) { item in
                ZStack {
                    if selectedMissionCategory == item {
                        Capsule()
                            .frame(width: 50, height: 40)
                            .foregroundColor(.customMissionGreen)
                            .matchedGeometryEffect(id: "category", in: missionAnimation)
                    }
                    
                    if item == .none {
                        Text(item.stringValue())
                            .foregroundColor(selectedMissionCategory == item ? .black: .customMissionGray)
                            .frame(maxWidth: 20, maxHeight: 20)
                            .padding(.horizontal)
                        
                    } else {
                        Image(selectedMissionCategory == item ? "seleted_\(item)" : "not_seleted_\(item)")
                            .resizable()
                            .frame(maxWidth: 20, maxHeight: 20)
                            .foregroundColor(selectedMissionCategory == item ? .black: .customMissionGray)
                            .padding(.horizontal)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedMissionCategory = item
                        missionViewModel.updateNowMissionForCategory(info: selectedMission, category: selectedMissionCategory)
                    }
                }
            }
        }
        .frame(maxHeight: 40)
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView()
    }
}
