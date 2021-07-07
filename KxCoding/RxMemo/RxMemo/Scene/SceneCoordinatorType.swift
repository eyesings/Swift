//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by RadCns_KIM_TAEWON on 2021/07/06.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
    
}
