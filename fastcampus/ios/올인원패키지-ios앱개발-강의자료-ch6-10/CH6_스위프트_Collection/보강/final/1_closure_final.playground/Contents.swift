import Cocoa


// Example 1: Cho Simple Closure

//let choSimpleClosure = {
//
//}
//
//choSimpleClosure()


// Example 2: 코드블록을 구현한 Closure

//let choSimpleClosure = {
//    print("Hello, 클로져, 코로나 하이!")
//}
//
//choSimpleClosure()


// Example 3: 인풋 파라미터를 받는 Closure

//let choSimpleClosure: (String) -> Void = { name in
//    print("Hello, 클로져, 코로나 하이! 나의 이름은 \(name) 입니다.")
//}
//
//choSimpleClosure("코로나가 제일시러")


// Example 4: 값을 리턴하는 Closure

//let choSimpleClosure: (String) -> String = { name in
//    let message = "iOS 개발 만만세, \(name)님 경제적 자유를 얻으실 거에요!"
//    return message
//}
//
//let result = choSimpleClosure("코로나가 제일시러")
//print(result)

// Example 5: Closure를 파라미터로 받는 함수 구현

//func someSimpleFunction(choSimpleClosuer: () -> Void) {
//    print("함수가 호출되었요")
//}
//
//someSimpleFunction(choSimpleClosuer: {
//    print("헬로 코로나 from closure")
//})

//func someSimpleFunction(choSimpleClosuer: () -> Void) {
//    print("함수가 호출되었요")
//    choSimpleClosuer()
//}
//
//someSimpleFunction(choSimpleClosuer: {
//    print("헬로 코로나 from closure")
//})


// Example 6: Trailing Closure


func someSimpleFunction(message: String, choSimpleClosuer: () -> Void) {
    print("함수가 호출되었요, 메시지는 \(message)")
    choSimpleClosuer()
}

someSimpleFunction(message: "로나로나 메로나, 코로나 극혐", choSimpleClosuer: {
    print("헬로 코로나 from closure")
})

someSimpleFunction(message: "로나로나 메로나, 코로나 극혐") {
    print("헬로 코로나 from closure")
}
