import Foundation

// MARK: - Input

func loadInput() -> String {
  try! String(contentsOfFile: "../resources/day1.txt")
}

func parse(_ input: String) -> [Int] {
  input
    .split(separator: "\n")
    .compactMap { Int($0) }
}

let parsed = Set(parse(loadInput()))

// MARK: - Search

func find(_ input: Set<Int>, sum: Int, count: Int) -> Int? {
  guard count >= 0, sum >= 0 else { return nil }

  var mod = input
  guard let x = mod.popFirst() else { return nil }

  if sum - x ==  0, count == 0 {
    return x
  }

  // Level deeper
  if let r = find(mod, sum: sum - x, count: count - 1) {
    return x * r
  }

  // Next item from set
  return find(mod, sum: sum, count: count)
}

print("First result:", find(parsed, sum: 2020, count: 1) ?? 0)
print("Second result:", find(parsed, sum: 2020, count: 2) ?? 0)
