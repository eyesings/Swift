import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()


// - ignorElements
/// next 한 이벤트들에 대해 전부 무시
/// .completed, .error 이벤트만 반응
/// Obserable 에서 emit 되는 element 에 대해 관심이 없고 완료되는 것들에 대해서 혹은 error 에 대해 처리하고 싶을 때 사용

let strikes = PublishSubject<String>()

strikes
    .ignoreElements()
    .subscribe { _ in
        print("[Subscription is called]")
    }.disposed(by: disposeBag)

strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes.onCompleted()


// - elementAt
/// 원하는 위치의 element 만 받아오고 나머지를 무시하는 형태로 만들고 싶을 때
let strikesElement = PublishSubject<String>()

strikesElement
    .elementAt(2)
    .subscribe(onNext: { element in
        print("You ar out ==> \(element)")
    }).disposed(by: disposeBag)

strikesElement.onNext("A")
strikesElement.onNext("B")
strikesElement.onNext("C")
strikesElement.onNext("D")

// - filter
/// 조건에 맞는 element 만 방출되고 나머지는 무시되는 형태

Observable.of(1,2,3,4,5,6,7,8)
    .filter { $0 % 9 == 0}
    .subscribe(onNext: {
        print($0)
    })

// - skip
/// n번째 위치의 아이템까지 스킵하며 이후의 것들에 대해 subscrive 하는 연산자

Observable.of("A", "B", "C", "D", "E", "F")
    .skip(6)
    .subscribe(onNext: {
        print("skip::\($0)")
    })

// - skipWhile
/// 클로저로 Bool 형 반환의 조건을 적어주고 해당 조건이 만족될 때 까지 계속해서 무시
Observable.of(2,3,4,5,6,7,7,8)
    .skipWhile { $0 % 4 != 0}
    .subscribe(onNext: {
        $0
//        print("skipWhile::\($0)")
    }).disposed(by: disposeBag)

// - skipUntil
/// 다른 trigger Observable element가 방출될 때 까지 Observable의 요소를 계속해서 싀킵
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject
    .skipUntil(trigger)
    .subscribe(onNext: {
        $0
//        print("skipUntil::\($0)")
    }).disposed(by: disposeBag)

subject.onNext("A")
subject.onNext("B")
trigger.onNext("X")
trigger.onNext("XXX")
subject.onNext("CCC")

// - take
/// take는 skip의 정반대 개념. skip은 처음 발생하는 n개의 이벤트를 무시하는 기능이었다면, take는 처음 발생하는 n개의 이벤트만 받고 나머지는 무시.

//Observable.of(1,2,3,4,5,6,7)
//    .take(2)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)


// - takeWhile
/// takeWhile은 skipWhile과 유사. takeWhile에는 클로져가 전달되고, 이 클로져는 이벤트의 Element를 검사. 검사를 통과한 이벤트는 전달.

//Observable.of(2,4,6,8,10)
//    .takeWhile{ $0 % 2 == 0}
//    .subscribe(onNext: {
//        print($0)
//    })

// - takeUntil
/// takeUntil은 skipUntil과 유사. takeUntil Operator에는 두 개의 시퀀스가 등장. 데이터 스트림을 발생시키는 시퀀스와, trigger의 역할을 하는 시퀀스다.

let subjectTakeUntil = PublishSubject<String>()
let triggerTakeUntil = PublishSubject<String>()

subjectTakeUntil.takeUntil(triggerTakeUntil)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subjectTakeUntil.onNext("1")
subjectTakeUntil.onNext("2")
triggerTakeUntil.onNext("X")
subjectTakeUntil.onNext("4")























































