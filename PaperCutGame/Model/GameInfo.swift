//
//  GameInfo.swift
//  PaperCutGame
//
//  Created by Beking on 1/14/24.
//

import SwiftUI

struct GameInfo: Identifiable {
    var id = UUID().uuidString
    var round: Int
    var difficulty: String
    var paperImage: String
    var mainImage: String
    var optionImages: [String]
    var correctAnswer: Int
}

var GameInfos : [GameInfo] = [
    GameInfo(round: 1, difficulty: "★☆☆", paperImage: "round1/foldpaper", mainImage: "round1/main", optionImages: ["round1/option1", "round1/option2", "round1/option3"], correctAnswer: 0),
    GameInfo(round: 2, difficulty: "★★☆", paperImage: "round2/foldpaper", mainImage: "round2/main", optionImages: ["round2/option1", "round2/option2", "round2/option3"], correctAnswer: 1),
    GameInfo(round: 3, difficulty: "★★★", paperImage: "round3/foldpaper", mainImage: "round3/main", optionImages: ["round3/option1", "round3/option2", "round3/option3"], correctAnswer: 2),
    GameInfo(round: 4, difficulty: "★★★", paperImage: "round4/foldpaper", mainImage: "round4/main", optionImages: ["round4/option1", "round4/option2", "round4/option3"], correctAnswer: 1)
]


