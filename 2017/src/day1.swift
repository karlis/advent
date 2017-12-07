import Foundation

func loadInput() -> String {
  return try! String(contentsOfFile: "../resources/day1.txt")
}

func parse(_ input: String) -> [Int] {
  return Array(input).flatMap { Int(String($0)) }
}

func sumMatching(input: [Int], distance: Int) -> Int {
  var sum = 0
  for index in 0...(input.count-1) {
    let digit = input[index]
    guard digit == input[(index+distance)%input.count] else { continue }
    sum += digit
  }
  return sum
}

let input = loadInput()

print("1:",sumMatching(input: parse(input), distance: 1))
print("2:",sumMatching(input: parse(input), distance: input.count/2))
