//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import RxSwift

let bag = DisposeBag()

enum MyError: Error {
   case error
}

//startwith, behabisubject
let greetings = PublishSubject<String>()
let languages = PublishSubject<String>()
let cenger = BehaviorSubject<String>(value: "cenger")


Observable.combineLatest(greetings, cenger, languages) { lhs, chs, rhs in
    return "\(lhs)- \(chs) - \(rhs)"
}
.subscribe { print($0)}
.disposed(by: bag)

greetings.onNext("A")
languages.onNext("1")

greetings.onNext("B")
greetings.onNext("C")
languages.onNext("2")

//let test = BehaviorSubject<String>(value: "Test1")
//
//Observable.combineLatest(greetings, languages, test) { lhs,cent, rhs -> String in
//    return  "\(lhs) \(cent) \(rhs)"
//}
//.startWith("start go")
//.subscribe { print($0)}
//.disposed(by: bag)
//
//greetings.onNext("1")
//languages.onNext("A")
//test.onNext("swift test")
//
//greetings.onNext("Hello")
//languages.onNext("RX Swift")
//
//greetings.onCompleted()
////greetings.onError(MyError.error)
//languages.onNext("UI")
//
//languages.onCompleted()
//









//Observable.combineLatest(greetings, languages) { lhs, rhs in
//    return "\(lhs) \(rhs)"
//}
//.subscribe {print($0)}
//.disposed(by: bag)
//
//greetings.onNext("Hi")
//languages.onNext("World")
////languages.onNext("Swift")
//
//greetings.onNext("Hello")
//languages.onNext("RxSwift")
//
////greetings.onCompleted()
//greetings.onError(MyError.error)
//languages.onNext("SwiftUI")
//languages.onCompleted()



