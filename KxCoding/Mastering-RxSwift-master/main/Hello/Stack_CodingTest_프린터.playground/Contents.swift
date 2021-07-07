import Foundation

var priorities1 = [2, 1, 3, 2]
var location1 = 2

var priorities2 = [1, 1, 9, 1, 1, 1]
var location2 = 0

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var priorDic: [Int:Int] = [:]
    
    print("priorities::\(priorities)")
//    print("location::\(location)")
    
    priorities.enumerated().forEach { (key,value) in
        
        priorDic.updateValue(value, forKey: key)
    }
    print(priorDic)
    
    let dicSort = priorDic.sorted(by: {$0.key < $1.key })
    print(dicSort)
    
    let maximumValue = dicSort.max { old, new in old.value < new.value}
    print("maximumValue::\(maximumValue)")
    
    dicSort.map { (key, value) in
        print("key::\(key), value::\(value)")
        
        if value == location + 1 {
            
            print(key)
        } else {
            
        }
    }
    
    return 0
}


solution(priorities2, location2)
