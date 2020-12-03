import Foundation

// MARK: - Input

func loadInput() -> String {
  try! String(contentsOfFile: "../resources/day3.txt")
}

func parse(_ input: String) -> [String] {
  input.split(separator: "\n").map { String($0) }
}

let parsed = parse(loadInput())

struct Move {
  let down: Int
  let right: Int
}

// MARK: - Find

func find(_ input: [String], move: Move) -> Int {
  var trees = 0
  var currentCoordinate = 0

  for (index, line) in input.enumerated() {
    // skip first always
    if index == 0 || index % move.down > 0 {
      continue
    }

    currentCoordinate = (currentCoordinate + move.right) % (line.count)

    if line[line.index(line.startIndex, offsetBy: currentCoordinate)] == "#" {
      trees += 1
    }
  }
  return trees
}

func find2(_ input: [String]) -> Int {
  let moves = [
    Move(down: 1, right: 1),
    Move(down: 1, right: 3),
    Move(down: 1, right: 5),
    Move(down: 1, right: 7),
    Move(down: 2, right: 1),
  ]

  return moves
    .map { find(input, move: $0) }
    .reduce(1, *)
}

// MARK: - Result

print("1st:", find(parsed, move: Move(down: 1, right: 3)))
print("2nd:", find2(parsed))
