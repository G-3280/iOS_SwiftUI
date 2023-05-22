//
//  MoreInfoView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/14.
//

import SwiftUI

struct MoreInfoView: View {
    
    @EnvironmentObject var userInfoViewModel: UserInfoViewModel
    @EnvironmentObject var authViewModel : AuthViewModel
    
    @State var nowMissionCount: Double = 20
    @State var totalMissionCount: Double = 20
    
    var body: some View {
        ZStack {
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 30) {
                    TopBarView
                        
                    MissionCountView
                      
                    HistoryView

                    ForEach(InfoNames.allCases, id: \.self) { name in
                        VStack(alignment: .leading) {
                            
                            Divider()
                                .padding(.bottom, 10)
                            
                            HStack(alignment: .center) {
                                Text(name.rawValue)
                                    
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.customMissionGray)
                            }
                            .padding(.horizontal, 5)
                            .padding(.bottom, -15)
                        }
                    }
                }
                .padding(.horizontal, 22)
            }
            .clipped()
            .padding(.top, 15)
            .onAppear {
                //            print(viewModel.isLoggedIn)
            }
        }
    }
    
    @ViewBuilder
    private var TopBarView: some View {
        HStack {
            Text("\(userInfoViewModel.user?.nickName ?? "") 님")
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
            
            Button {
                Task {
                    await authViewModel.logoutFirebase()
                }
            } label: {
                Text("로그아웃")
                    .font(.callout)
                    .tint(.black)
            }
        }
    }
    
    @ViewBuilder
    private var MissionCountView: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 349, height:149)
                .foregroundColor(Color.customInfoGray)
            
            VStack(alignment: .leading){
                HStack(alignment: .bottom, spacing: 5){
                    Text("\(Int(totalMissionCount))회")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("중")
                        .font(.subheadline)
                        .padding(.bottom, 1)
                        
                    
                    Text("\(Int(nowMissionCount))회")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("미션 완료!")
                        .font(.subheadline)
                        .padding(.bottom, 1)
                }
                
                HStack(alignment: .bottom, spacing: 5){
                    Text("새 캐릭터 획득까지")
                        .font(.headline)
                        .fontWeight(.regular)
                    
                    Text("\(Int(totalMissionCount - nowMissionCount))회")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, -1)
                    
                    Text("남았습니다!")
                        .font(.headline)
                        .fontWeight(.regular)
                }
                
                .padding(.bottom, 20)
                
                VStack {
                    
                    ProgressView(value: nowMissionCount, total: totalMissionCount)
                        .progressViewStyle(MissionProgressViewStyle(height: 10, value: $nowMissionCount, total: $totalMissionCount))
                       .frame(width: 310, height: 20)
                }
            }
        }
    }
    
    @ViewBuilder
    private var HistoryView: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 349, height:233)
                .foregroundColor(Color.customInfoGray)
            
            VStack(alignment: .leading){
                Text("히스토리")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    .padding(.leading, -15)
 
                HStack(spacing: 55) {
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .foregroundColor(Color(hex: "31F539"))
                            .frame(width: 54, height: 54)
                            .padding(.bottom, 15)
                        
                        Text("10개")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, -3)
                        
                        Text("미션 완료")
                            .font(.subheadline)
                    }
                    
                    VStack {
                        Image(systemName: "lanyardcard.fill")
                            .resizable()
                            .foregroundColor(Color(hex: "26EBA4"))
                            .frame(width: 50, height:60)
                            .padding(.bottom, 9)
                        
                        Text("5개")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, -3)
                                          
                        Text("확득한 카드")
                            .font(.subheadline)
                    }
                    
                    VStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .resizable()
                            .foregroundColor(Color(hex: "FF5C5C"))
                            .frame(width: 54, height: 54)
                            .padding(.bottom, 15)
                        
                        Text("7개")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, -3)
                        
                        Text("평가 완료")
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

struct MoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView()
            .environmentObject(UserInfoViewModel())
    }
}

enum InfoNames: String, CaseIterable {
    case inform = "공지사항"
    case app = "앱 평가하기"
    case errorDeclaration = "오류 신고"
    case versionInfo = "버전 정보"
    case license = "라이센스"
}
