import Foundation

var clothes1 = [["bluesunglasses", "eyewear"],["yellowhat", "headgear"],  ["green_turban", "headgear"]]
var clothes2 = [["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]]



func solution(_ clothes:[[String]]) -> Int {
    
    let types = clothes.compactMap({$0.last})
    print("types::\(types)")
    let typeSet = Set(types)
    print("typeSet::\(typeSet)")
    let categories = Array(typeSet)
    print("categories::\(categories)")
    
    let counts = categories.map ({ category -> Int in
        
        print("category::\(category)")
        return clothes.filter({$0.last == category}).count + 1
    })
    print("counts::\(counts)")
    
    let resultCount = counts.reduce(1, {$0 * $1}) - 1
    print("resultCount::\(resultCount)")
    return 0
//    var cloDic = [String:[String]]()
//
//    for clo in clothes {
//
//        if cloDic[clo[1]] != nil {
//            cloDic[clo[1]]?.append(clo[0])
//        } else {
//            cloDic[clo[1]] = [clo[0]]
//        }
//
//    }
//
//    let count = cloDic.mapValues { $0.count}.values
//    let resultCount = count.reduce(1){$0*($1+1)} - 1
//
//    return resultCount
}

print(solution(clothes1))
