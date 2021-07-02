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

let oddNumbers = BehaviorSubject(value: 1)
let evenNumbers = BehaviorSubject(value: 2)
let negativeNumbers = BehaviorSubject(value: -1)

let source = Observable.of(oddNumbers, evenNumbers, negativeNumbers)

source
    .merge()
    .subscribe { print($0)}
    .disposed(by: bag)

oddNumbers.onNext(3)
evenNumbers.onNext(4)
negativeNumbers.onNext(-2)



//let source = Observable.of(oddNumbers, evenNumbers, negativeNumbers)
//
//source
//    .merge(maxConcurrent: 2)
//    .subscribe {print($0)}
//    .disposed(by: bag)
//
//oddNumbers.onNext(3)
//evenNumbers.onNext(4)
//
//evenNumbers.onNext(6)
//oddNumbers.onNext(5)
//
//negativeNumbers.onNext(-2)
//
//oddNumbers.onCompleted()

//oddNumbers.onError(MyError.error)

//evenNumbers.onNext(8)

//evenNumbers.onCompleted()

