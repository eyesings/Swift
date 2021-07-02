import Foundation

let progresses1 = [93, 30, 55]
let progresses2 = [95, 90, 99, 99, 80, 99]
let speeds1 = [1, 30, 5]
let speeds2 = [1, 1, 1, 1, 1, 1]

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var resultDayList = Array<Int>()
    var hightList = Array<Int>()
    
    //100 - 93 = 7 / 1 = 7
    //100 - 30 = 70 / 30 = 3
    //100 - 55 = 45 / 5 = 9
    /*
     
     if 7 > 3 {
        test = 7
        testPoint
     }
     
     */
    
    print("progresses::\(progresses)")
    print("speeds::\(speeds)")
    
    let stilDay = zip(progresses, speeds).map({ceil(Double(100 - $0) / Double($1))})
    print("stilDay::\(stilDay)")
//    stilDay.enumerated().forEach {
//
//    }
    
    //배열 앞뒤 비교로 검색
    
    let count = stilDay.count
    print("count::\(count)")
    
    
    
    
    return []
}

solution(progresses1, speeds1)
