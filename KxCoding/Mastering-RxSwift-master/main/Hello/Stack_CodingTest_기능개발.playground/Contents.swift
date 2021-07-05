import Foundation

let progresses1 = [93, 30, 55]
let progresses2 = [95, 90, 99, 99, 80, 99]
let progresses3 = [70, 80, 90, 99, 50, 30]
let speeds1 = [1, 30, 5]
let speeds2 = [1, 1, 1, 1, 1, 1]
let speeds3 = [20, 10, 1, 1, 20, 40]

func fillter(_ day:[Double]) -> [Int]{
    var resultList = Array<Int>()
    var maxPoint: Double = 0.0
    for (index, item) in day.enumerated() {
        if index > 0 {
            if maxPoint >=  item {
                resultList[resultList.count - 1] += 1
            } else {
                resultList.append(1)
                maxPoint = item
            }
        } else {
            resultList.append(1)
            maxPoint = item
        }
        
    }
    return resultList
}

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let stilDay = zip(progresses, speeds).map({ceil(Double(100 - $0) / Double($1))})
    let resultCount = fillter(stilDay)
    
    return resultCount
}

print(solution(progresses3, speeds3))


func newSolution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    return zip(progresses, speeds)
        .map { (100 - $0) / $1 }
        .reduce(([], 0)) { (tuple, day) -> ([Int], Int) in
            let (list, lastMax) = tuple
            guard let lastCount = list.last else {
                return ([1], day)
            }
            if lastMax >= day {
                return (list.dropLast() + [lastCount + 1], lastMax)
            }
            return (list + [1], day)
        }.0
}

print(newSolution(progresses1, speeds1))
