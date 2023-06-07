//
//  CharacterModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/03.
//

import SwiftUI

enum Character {
    case penguin
    case redPanda
    case redFox
    case polarBear
    case turtle
    case marten
    
    init?(imageName: String) {
        switch imageName {
        case "penguin":
            self = .penguin
        case "redPanda":
            self = .redPanda
        case "redFox":
            self = .redFox
        case "PolarBear":
            self = .polarBear
        case "turtle":
            self = .turtle
        case "marten":
            self = .marten
        default:
            return nil
        }
    }
    
    var name: String {
        switch self {
        case .penguin:
            return "뽀"
        case .redPanda:
            return "차오바오"
        case .redFox:
            return "호"
        case .polarBear:
            return "고미"
        case .turtle:
            return "부기"
        case .marten:
            return "다미"
        }
    }
    
    var species: String {
        switch self {
        case .penguin:
            return "황제팽귄"
        case .redPanda:
            return "랜서판다"
        case .redFox:
            return "붉은여우"
        case .polarBear:
            return "북극곰"
        case .turtle:
            return "바다거북"
        case .marten:
            return "아기담비"
        }
    }
    
    var backColor: Color {
        switch self {
        case .penguin:
            return Color(hex: "F0D8D8")
        case .redPanda:
            return Color(hex: "CFF2C9")
        case .redFox:
            return Color(hex: "F2E9C9")
        case .polarBear:
            return Color(hex: "F2C9C9")
        case .turtle:
            return Color(hex: "C9E8F2")
        case .marten:
            return Color(hex: "DBC9F2")
        }
    }
    
    var image: String {
        switch self {
        case .penguin:
            return "penguin"
        case .redPanda:
            return "redPanda"
        case .redFox:
            return "redFox"
        case .polarBear:
            return "PolarBear"
        case .turtle:
            return "turtle"
        case .marten:
            return "marten"
        }
    }
    
    var explanation: String{
        switch self {
        case .penguin:
            return "황제펭귄(Aptenodytes forsteri)은 지구상에 생존하는 모든 펭귄들 중에서 가장 키가 크고 체중이 많이 나가는 종이다. \n서식지는 남극과 포클랜드 제도이다. 암컷과 수컷은 덩치와 깃털 무늬가 비슷하며, 성체는 최고 120cm에 몸무게는 23 ~ 45kg까지 나간다. 등은 검고 가슴 부위는 창백한 노란색을 띠고 있으며 귀 부위는 밝은 노란색이다. 다른 펭귄들과 마찬가지로 황제펭귄은 날지 못한다. 이들은 해양 생활에 적합한 유선형의 몸매와 플리퍼(flipper)로 불리는 납작한 날개를 갖고 있다."
        case .redPanda:
            return "래서판다는 영어로는 주로 '레드 판다(Red panda)'로, 간혹 '작은 판다'라는 뜻에서 '레서 판다(Lesser panda)'라고도 칭한다.\n\n곤충, 새의 알, 나무 열매, 대나무 등 이것저것 가리지 않고 잘먹는 잡식성이다.\n다 성장했을 경우 50 ~ 65cm 정도까지 자라며 꼬리도 몹시 길어서 30 ~ 60cm까지 성장한다.\n 꼬리가 긴 이유는 나무를 탈 때 무게중심을 잡기 위해서다.\n몸무게는 3 ~ 7kg. 색은 세가지 색으로 배쪽이 검은 색이고 등쪽은 짙은 적갈색. 얼굴과 귀 하얀색 바탕에 검은색 털이 섞여 있다."
        case .redFox:
            return "붉은 여우는 여우 중에서 개체 수가 가장 많은 종. 보통 여우라고 하면 이 붉은 여우를 가리킨다.\n\n수컷은 몸길이 90cm, 꼬리길이 60cm, 어깨높이 50cm, 몸무게 약 10kg. 암컷은 몸길이 60cm, 꼬리길이 30cm, 어깨높이 30cm, 몸무게 약 7kg으로 작고 아담하다.\n\n 여우 중에서는 가장 몸집이 크다.\n\n전체적인 크기의 범위는 몸길이 45 ~ 140cm, 꼬리길이 30 ~ 60cm, 어깨높이 35 ~ 55cm, 몸무게 약 3 ~ 17kg 정도다."
        case .polarBear:
            return "북극곰은 북극 지방에 서식하는 곰으로 현존하는 곰 중에서 가장 큰 곰이다.\n\n다 자란 수컷은 300 ~ 650kg 정도이며 다만 동물원 사육 시에는 야생과는 다르게 먹이가 무진장 공급되다 보니 1t에 육박하기도 한다고 한다.\n암컷의 몸무게는 150 ~ 500kg. 갓 태어난 북극곰의 새끼는 놀랍게도 900g 미만으로 인간보다 훨씬 작다."
        case .turtle:
            return "바다거북은 넓은 의미로 거북목 바다거북상과(Chelonioidea)에 속하는 모든 종들의 총칭한다.\n\n현생 해양 파충류 중 가장 수중 생활에 특화되어 있다. 팔다리는 전부 지느러미 형태로 진화되어 있으며, 이 지느러미로 천천히 헤엄친다.\n\n몸길이는 보통 상체가 1 ~ 1.2m 정도이고, 최대 1.3m까지 자랄 수 있다.\n\n물 밖에서는 몸통으로 체중을 버텨야 하며, 완전히 자란 바다거북은 자기 체중에 몸 속 장기가 눌려 상할 정도로 커지게 된다."
        case .marten:
            return "담비는 식육목 족제비과에 속하는 동물. 족제비와 상당히 비슷하게 생겼지만 족제비에 비해 귀가 다소 작은데다 뾰족하고 덩치는 2 ~ 3배가량 더 크다.\n\n크기는 종에 따라 다양하나, 보통 몸무게 1 ~ 2kg 정도이며 수컷이 암컷보다 크다.\n\n예외적으로 아시아에 서식하는 노란목도리담비의 경우 몸길이는 50 ~ 60cm이며, 몸무게는 평균 3 ~ 4kg 정도로 소형견이나 고양이와 비슷하다.\n\n주로 단독 생활을 하며 식성은 잡식성으로, 설치류나 작은 새, 열매, 곤충 등이 주식이다."
        }
    }
}
