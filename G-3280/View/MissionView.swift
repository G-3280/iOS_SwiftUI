//
//  MissionView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/01.
//

import SwiftUI
import FirebaseStorage
import HidableTabView

struct MissionView: View {
    
    @StateObject var missionViewModel = MissionViewModel()
    
    @State private var selectedMissionCategory: missionCategory = .today
    @State private var selectedMissionType: missionType = .none
    @Namespace private var missionAnimation
    @Namespace private var missionCategoryAnimation
    
    @State private var showingConfirmation = false
    
    @State private var currentTime: String = ""
    @State var stack: [Int] = []
    
    @State private var showCamera = false
    @State private var selectedUIImage: UIImage? = nil
    
    var body: some View {
        NavigationStack(path: $missionViewModel.stack) {
            ZStack{
                Color.customBackGray
                    .edgesIgnoringSafeArea(.all)

                VStack(alignment: .center) {
                    VStack {
                        topBar
                        
                        topMenuBar
                        
                        missionCategoryMenuBar
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 20)
                    
                    if missionViewModel.isLoading {
                        LoadingView()
                    } else if !(missionViewModel.nowMission.isEmpty) {
                        List(missionViewModel.nowMission) { data in
                            MissionCardView(cardData: data)
                                .frame(width: 341, height: 87)
                                .padding(.horizontal, 28)
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .shadow(color: Color.customGray ,radius: 5)
                                .onTapGesture {
                                    showingConfirmation = true
                                    missionViewModel.selectedMissionDocumentID = data.documentID
                                }
                                .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                                    Button {
                                        showCamera = true
                                        UITabBar.toogleTabBarVisibility()
                                    } label: {
                                        Text("사진 촬영")
                                    }
                                    Button("취소", role: .cancel) { }
                                } message: {
                                    Text("미션 인증을 하시겠습니까?")
                                }
                                .fullScreenCover(isPresented: $showCamera) {
                                    ImagePicker(selectedImage: $missionViewModel.selectedImage)
                                        .ignoresSafeArea()
                                }
                        }
                        .listStyle(.plain)
                        .refreshable {
                            Task {
                                await missionViewModel.fetchMissions()
                            }
                            
                            missionViewModel.updateNowMissionForCategory(category: selectedMissionCategory, type: selectedMissionType)
                        }
                        
                    } else {
                        NotFoundDataView()
                            .padding(.bottom, 100)
                    }
                }
                .onAppear {
                    currentTime = missionViewModel.getCurrentTime()
//                    UITabBar.toogleTabBarVisibility()
                }
            }
        }.navigationDestination(for: Int.self) { int in
            if missionViewModel.isImageUpLoading {
                MissionCompletedView(stack: $missionViewModel.stack)
            } else {
                LoadingView()
                    .transition(.move(edge: .trailing))
            }
        }
        
    }

    @ViewBuilder
    private var topBar: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(selectedMissionCategory == .today ? "Today" : "Weak")
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
        }
    }
    
    @ViewBuilder
    private var topMenuBar: some View {
        HStack {
            ForEach(missionCategory.allCases, id: \.self) { item in
                ZStack {
                    if selectedMissionCategory == item {
                        Capsule()
                            .frame(height: 40)
                            .foregroundColor(.customMissionGreen)
                            .matchedGeometryEffect(id: "info", in: missionAnimation)
                    }
                    
                    Text(item.stringValue())
                        .frame(maxWidth: .infinity/4, minHeight: 50)
                        .font(.subheadline)
                        .foregroundColor(selectedMissionCategory == item ? .black: .customMissionBarGray)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedMissionCategory = item
                        self.selectedMissionType = .none
                        missionViewModel.updateNowMissionForCategory(category: selectedMissionCategory, type: selectedMissionType)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var missionCategoryMenuBar: some View {
        HStack(spacing: 20) {
            ForEach(missionType.allCases, id: \.self) { item in
                ZStack {
                    if selectedMissionType == item {
                        Capsule()
                            .frame(width: 50, height: 40)
                            .foregroundColor(.customMissionGreen)
                            .matchedGeometryEffect(id: "category", in: missionAnimation)
                    }
                    
                    if item == .none {
                        Text(item.stringValue())
                            .foregroundColor(selectedMissionType == item ? .black: .customMissionGray)
                            .frame(maxWidth: 20, maxHeight: 20)
                            .padding(.horizontal)
                        
                    } else {
                        Image(selectedMissionType == item ? "seleted_\(item)" : "not_seleted_\(item)")
                            .resizable()
                            .frame(maxWidth: 20, maxHeight: 20)
                            .foregroundColor(selectedMissionType == item ? .black: .customMissionGray)
                            .padding(.horizontal)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedMissionType = item
                        missionViewModel.updateNowMissionForCategory(category: selectedMissionCategory, type: selectedMissionType)
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
