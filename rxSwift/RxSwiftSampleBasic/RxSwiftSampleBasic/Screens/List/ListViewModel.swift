//
//  ListViewModel.swift
//  RxSwiftSampleBasic
//
//  Created by Kim Tae won on 2021/02/13.
//

import Foundation
import RxSwift

protocol ListViewModelInputs {
    var fetchTrigger        : PublishSubject<Void>  { get }
    var reachedBottomTrigger: PublishSubject<Void>  { get }
}

protocol ListViewModelOutputs {
    var navigationBarTitle  : Observable<String>    { get }
    var isLoading           : Observable<Bool>      { get }
    var error               : Observable<NSError>   { get }
    
}

protocol ListViewModelType {
    var inputs  : ListViewModelInputs{ get }
    var outputs : ListViewModelOutputs { get }
}

final class ListViewModel: ListViewModelType, ListViewModelInputs, ListViewModelOutputs {
    
    var inputs: ListViewModelInputs { return self }
    var outputs: ListViewModelOutputs { return self }
    
    // MARK: Inputs
    var fetchTrigger = PublishSubject<Void>()
    var reachedBottomTrigger = PublishSubject<Void>()
    
    // MARK: Outputs
    var navigationBarTitle: Observable<String>
    var isLoading: Observable<Bool>
    var error: Observable<NSError>
    
//    private let searchAction: Action<Int,
    private let disposeBag = Disposables()
    
    init(language: String) {
        
    }
    
}
