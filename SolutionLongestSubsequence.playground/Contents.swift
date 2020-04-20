import Foundation

public func longestSubsequence(_ array: [Int]) -> Int {
    
    let sortedArray = array.sorted(by: <)
    var subsequences = [Int : [Int]]()
    
    var firstSubsequenceElement = 0
    var previousElement = -1
    var currentSequence = [Int]()
    
    for (_, element) in sortedArray.enumerated() {
        if previousElement + 1 == element {
            previousElement = element
            currentSequence.append(element)
            subsequences[firstSubsequenceElement] = currentSequence
        }
        else {
            firstSubsequenceElement = element
            previousElement = element
            currentSequence.removeAll()
            currentSequence.append(element)
            subsequences[element] = currentSequence
        }
    }
    
    guard let longestSubsequence = subsequences.values.sorted(by: { $0.count > $1.count }).first else {
        return 1
    }
    
    print("Longest Subsequence.count: \(longestSubsequence.count)")
    print(longestSubsequence)
    
    return longestSubsequence.count
}

let subseqArray = [54,43,87,2,89,5,90,6,7,10,88,91]
longestSubsequence(subseqArray)


/*
 
 Output:
 Longest Subsequence.count: 5
 [87, 88, 89, 90, 91]
 
 */
