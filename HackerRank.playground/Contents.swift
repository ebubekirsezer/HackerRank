import Foundation

// MARK: - Compare the Triplets

func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    // Write your code here
    var alicePoint = 0
    var bobPoint = 0
    for (index, _) in a.enumerated() {
        if a[index] > b[index] {
            alicePoint += 1
        }
        else if a[index] < b[index] {
            bobPoint += 1
        } else {
            
        }
    }
    let result = [alicePoint, bobPoint]
    return result
}

// MARK: - Diagonal Difference

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    
    let arrayDimension = arr.count
    var firstSum = 0
    var secondSum = 0
    for index in 0..<arrayDimension {
        firstSum += arr[index][index]
        secondSum += arr[index][arrayDimension - index - 1]
    }
    
    let difference = abs(firstSum - secondSum)
    return difference
}

// MARK: - Plus Minus

func plusMinus(arr: [Int]) -> Void {
    var positiveNumbers: [Int] = []
    var negativeNumbers: [Int] = []
    var zeroNumbers: [Int] = []
    
    
    for item in arr {
        if item < 0 {
            negativeNumbers.append(item)
        } else if item > 0 {
            positiveNumbers.append(item)
        } else {
            zeroNumbers.append(item)
        }
    }
        
    let positiveNumberProbability = String(format: "%.6f", Double(positiveNumbers.count) / Double(arr.count))
    let negativeNumberProbability = String(format: "%.6f", Double(negativeNumbers.count) / Double(arr.count))
    let zeroNumberProbability = String(format: "%.6f", Double(zeroNumbers.count) / Double(arr.count))
    
    print("\(positiveNumberProbability)\n\(negativeNumberProbability)\n\(zeroNumberProbability)")
}

plusMinus(arr: [5, -4, 3, 2, 0])

// MARK: - Stair Case

func staircase(n: Int) -> Void {
    // Write your code here
    var itemIndex = 1
    
    for item in (1...n).reversed() {
        var stairString = ""
        for index in 1...item {
            if index != 1 {
                stairString += " "
            }
        }
        for _ in 1...itemIndex {
            stairString += "#"
        }
        print(stairString)
        itemIndex += 1
    }
}

staircase(n: 5)

// MARK: - Birthday Cake Candles

func birthdayCakeCandles(candles: [Int]) -> Int {
    // Write your code here
    
    let biggestCandle = candles.max()
    let biggestCandlesArray = candles.filter({ $0 == biggestCandle })
    
    return biggestCandlesArray.count
}

// MARK: - Time Conversion

func timeConversion(s: String) -> String {
    // Write your code here
    let isPm: Bool = s.contains("P") ? true : false
    let startIndex = s.index(s.endIndex, offsetBy: -2)
    var newTime = s
    newTime.replaceSubrange(startIndex..<s.endIndex, with: "")
    let endIndex = s.index(s.startIndex, offsetBy: 2)
    let range = s.startIndex..<endIndex
    var hour = (Int(s[range]) ?? 0)
    
    if isPm {
        hour = hour == 12 ? hour : hour + 12
    } else {
        hour = hour == 12 ? 00 : hour
    }
    newTime.replaceSubrange(range, with: "\((hour == 0 || hour < 10) ? "0\(hour)"  : "\(hour)")")
    
    return newTime
}

//MARK: - Grading Students

func gradingStudents(grades: [Int]) -> [Int] {
    // Write your code here
    var newGrades = grades
    
    for (index, grade) in newGrades.enumerated() {
        if grade >= 38 {
            let remaining = grade % 5
            
            if remaining == 3 {
                newGrades[index] = grade + 2
            } else if remaining == 4 {
                newGrades[index] = grade + 1
            }
        }
    }
    return newGrades
}

// MARK: - Number Line Jumps

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
     if (x1 > x2) {
        if (v1 >= v2) {
            return "NO"
        }
        else {
            if (x1 + v1 == x2 + v2) {
                return "YES"
            } else {
                return kangaroo(x1: x1 + v1, v1: v1, x2: x2 + v2, v2: v2)
            }
            
        }
    } else if (x2 > x1) {
        if (v2 >= v1) {
            return "NO"
        }
        else {
            if (x1 + v1 == x2 + v2) {
                return "YES"
            } else {
                return kangaroo(x1: x1 + v1, v1: v1, x2: x2 + v2, v2: v2)
            }
        }
    }
    else {
        return "NO"
    }
}

// MARK: - Breaking the Records

func breakingRecords(scores: [Int]) -> [Int] {
    // Write your code here
    var maxScoresCount = 0
    var minScoresCount = 0
    
    var myHighestScore = scores.first ?? 0
    var myLowestScore = scores.first ?? 0
    
    for score in scores {
        if myHighestScore < score {
            myHighestScore = score
            maxScoresCount += 1
        } else if myLowestScore > score {
            myLowestScore = score
            minScoresCount += 1
        } else {
            
        }
    }
    
    return [maxScoresCount, minScoresCount]
}

// MARK: - Electronics Shop

func getMoneySpent(keyboards: [Int], drives: [Int], b: Int) -> Int {
    /*
     * Write your code here.
     */
    
    var highestPrice: Int = 0
    
    for keyboardPrice in keyboards {
        for drivePrice in drives {
            if keyboardPrice + drivePrice <= b {
                if keyboardPrice + drivePrice > highestPrice {
                    highestPrice = keyboardPrice + drivePrice
                }
            }
        }
    }
    
    return (highestPrice != 0 ) ? highestPrice : -1
}

// MARK: - Append and Delete

func appendAndDelete(s: String, t: String, k: Int) -> String {
    // Write your code here
    let stringLength = s.count + t.count
    let str2 = Array(t)
    let stringLengthEven = stringLength % 2 == 0
    var sameString:String = ""
    
    if k > stringLength {
        return "Yes"
    } else {
        loop:for (index , value) in s.enumerated(){
            if index < t.count {
                if value == str2[index]{
                    sameString.append(value)
                }else{
                    break loop
                }
            }
        }
        
        let sDifference = s.count - sameString.count
        let tDiffrence = t.count - sameString.count
        let totalDifference = sDifference + tDiffrence
        
        if ((stringLengthEven && k % 2 == 0) || (!stringLengthEven && k % 2 == 1)) && (k >= totalDifference) {
            return "Yes"
        } else {
            return "No"
        }
    }
}
