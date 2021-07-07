//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by RadCns_KIM_TAEWON on 2021/07/06.
//

import Foundation
import RxSwift


protocol MemoStorageType {
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[MemoSectionModel]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
