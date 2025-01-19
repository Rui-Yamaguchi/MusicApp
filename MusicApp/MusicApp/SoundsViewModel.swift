//
//  SoundsViewModel.swift
//  MusicApp
//
//  Created by ヤマグチルイ on 2025/01/19.
//

import Foundation
import SwiftUI

class SoundsViewModel: ObservableObject {
    @Published var sounds = [
        "DJのスクラッチ1",
        "ちゃんちゃん♪1",
        "ちゃんちゃん♪2",
        "ドラムロール",
        "パフ",
        "ラッパのファンファーレ",
        "ロールの閉め",
        "金額表示",
    ]
    
    func getRandomSound() -> String {
        return sounds.randomElement() ?? ""
    }
}
