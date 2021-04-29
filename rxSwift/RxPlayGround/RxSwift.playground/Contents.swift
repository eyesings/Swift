import UIKit
import PlaygroundSupport
import RxSwift


let disposeBag = DisposeBag()

let rect = CGRect(x: 0, y: 0, width: 600, height: 600)
let view = UIView(frame: rect)
view.backgroundColor = UIColor.orange

//PlaygroundPage.current.liveView = view

// Observable
let observable = Observable.just(1)

observable.subscribe { event in
    switch event {
    case .next(let value):
        print("just_next::\(value)")
    case .error(let error):
        print("just_error::\(error)")
    case .completed:
        print("just_completed")
    
    }
}.disposed(by: disposeBag)

let observable2 = Observable.of("test1", "test2", "test3")

observable2.subscribe { event in
    switch event {
    case .next(let value):
        print("of_next::\(value)")
    case .error(let error):
        print("of_error::\(error)")
    case .completed:
        print("of_Completed")
    
    }
}.disposed(by: disposeBag)

let observable3 = Observable.of([1,2,3])

observable3.subscribe { event in
//    if let element = event.element {
////        print(element)
//    }
}

let observable4 = Observable.from([1,2,3,4,5])

let subscription4 = observable4.subscribe(onNext: { element in
    print(element)
})

subscription4.dispose()

Observable.of("A", "B", "C")
    .subscribe { event in
        print("observer_of::\(event)")
    }.disposed(by: disposeBag)

Observable<Int>.create { observer in
    observer.onNext(10)
    observer.onCompleted()
    observer.onNext(0)
    return Disposables.create()
}.subscribe { event in
    switch event {
    case .next(let value):
        print("create_next::\(value)")
    case .error(let error):
        print("create_error::\(error)")
    case .completed:
        print("create_completed")
    }
}.disposed(by: disposeBag)


func checkArrayObservable(items: [Int]) -> Observable<Int> {
    return Observable<Int>.create { observer -> Disposable in
        
        for item in items {
            if item == 0 {
                observer.onError(NSError(domain: "Error", code: 0, userInfo: nil))
                break
            }
            
            observer.onNext(item)
            
            sleep(1)
        }
        
        observer.onCompleted()
        
        return Disposables.create()
    }
}
 
checkArrayObservable(items: [4, 3, 1, 5, 2])
    .subscribe { event in
        switch event {
        case .next(let value):
            print("check_next::\(value)")
        case .error(let error):
            print("check_error::\(error)")
        case .completed:
            print("check_completed")
        
        }
    }.disposed(by: disposeBag)


Observable<Int>.interval(2, scheduler: MainScheduler.instance)
    .take(12)
    .subscribe { (value) in
        print("interval_value::\(value)")
    } onError: { (Error) in
        print("interval_Error:;\(Error)")
    } onCompleted: {
        print("interval_onCompleted")
    } onDisposed: {
        print("interval_onDisposed")
    }


















