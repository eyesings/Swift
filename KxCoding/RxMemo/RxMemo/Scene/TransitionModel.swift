//
//  TransitionModel.swift
//  RxMemo
//
//  Created by RadCns_KIM_TAEWON on 2021/07/06.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
