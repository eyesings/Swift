import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

//MARK: -- PublishSubject
/// 구독된 순간 새로운 이벤트 수신을 알리고 싶을 때 사용
/// 해당 서브젝트가 종료되었을 때 구독자에게 종료 이벤트를 전달할 뿐만 아니라 그 이후 구독한 구독자에게도 종료 이벤트를 전달해줌.

let subject = PublishSubject<String>()

subject.onNext("Issue 1")

subject.subscribe { event in
    print(event)
}

//subject.onNext("Issue 2")
//subject.onNext("Issue 3")
//subject.on(.next("Issue 5"))
////subject.dispose()
//
//subject.onCompleted()
//
//subject.onNext("Issue 4")

//MARK: -- BehaviorSubject
/// publishSubject 와 같으나 생성하는 방식이 다름. 하나의 초기 값을 가지고 있어야 함.
/// 초기값을 가지고 있는 상태이기 때문에 초기 값으로 next 이벤트로 값이 전달되면서 시작.
/// 뷰를 가장 최신의 데이터로 미리 세팅할 때 사용

let behaviorSubject = BehaviorSubject(value: "Initial Value")

behaviorSubject.onNext("last issue")

behaviorSubject.subscribe { event in
//    print(event)
}

behaviorSubject.on(.next("issue 1"))
behaviorSubject.onNext("issue 2")
behaviorSubject.onCompleted()
behaviorSubject.onNext("issue3")

//MARK: -- ReplaySubject
/// 하나 이상의 새로운 이벤트를 버퍼에 저장하고 옵저버가 구독을 시작하면 버퍼에 있는 모든 이벤트 전달
/// 버퍼의 크기를 설정할 수 있으며,
/// 최근 값 1개 외에 더 많은 값이 필요로 할 때 사용
/// 버퍼들은 메모리가 가지고 있으며, 데이터 타입이 메모리를 크게 차지하는 값이라면 메모리 부하가 날 수 있음.

let replaySubject = ReplaySubject<String>.create(bufferSize: 2)

replaySubject.onNext("ReplaySubject Issue 1")
replaySubject.onNext("ReplaySubject Issue 2")
replaySubject.onNext("ReplaySubject Issue 3")

replaySubject.subscribe { event in
//    print(event)
}

replaySubject.onNext("ReplaySubject Issue 4")
replaySubject.onNext("ReplaySubject Issue 5")
replaySubject.onNext("ReplaySubject Issue 6")

print("Subscription 2")

replaySubject.subscribe {
//    print($0)
}


//MARK: -- Variable
/// BehaviorSubject 를 래핑하고 있으며, 현재 값을 상태로 가지고 있음.
/// complete, error 이벤트가 발생하지 않으며 variable이 해제될 때 자동으로 complete 됨
/// 1) subject, observable과 다르게 새로운 요소를 추가하기 위해서 onNext를 사용할 수 없음.
/// 2) vriable은 상태값이기 때문에 에러가 발생하지 않는 것을 보장하기 때문에 error 이벤트를 발생시킬 수 없음
/// 3) variable이 해제될 때 자동으로 complete되기 때문에 complete 이벤트를 발생시킬 수 없음
/// - 현재 값을 확인 하고 싶을 대 사용

let variable = Variable([String]())
variable.value.append("Item 1")

variable.asObservable()
    .subscribe { event in
//        print(event)
    }

variable.value.append("Item 2")

//MARK: -- BehaviorRelay

let relay = BehaviorRelay(value: ["item 1"])
//relay.accept(relay.value + ["hello Taewon"])
var value = relay.value
value.append("HelloTaewon")
value.append("Hello")

relay.accept(value)

relay.asObservable()
    .subscribe { event in
        print(event)
    }

//relay.accept(relay.value + ["Hello World"])
//value.append("Hello World")













