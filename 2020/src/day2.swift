import Foundation

// MARK: - Input

func loadInput() -> String {
  try! String(contentsOfFile: "../resources/day2.txt")
}

struct Password {
  let min: Int
  let max: Int
  let char: Character
  let password: String
}

func parse(_ input: String) -> [Password] {
  input
    .split(separator: "\n")
    .map { line in
      let parts = line.split(separator: " ")
      let minMax = parts[0].split(separator: "-")

      return Password(
        min: Int(String(minMax[0]))!,
        max: Int(String(minMax[1]))!,
        char: parts[1].first!,
        password: String(parts[2])
      )
    }
}

let parsed = parse(loadInput())

func isValid(_ password: Password) -> Bool {
  let count = password.password.filter { password.char == $0 }.count
  return count <= password.max && count >= password.min
}

func isValid2(_ password: Password) -> Bool {
  let pass = password.password

  let index = pass.index(pass.startIndex, offsetBy: password.min - 1)
  let oIndex = pass.index(pass.startIndex, offsetBy: password.max - 1)

  let first = pass[index] == password.char
  let second = pass[oIndex] == password.char

  return (first != second) && (first || second)
}

print("1st result:", parsed.filter(isValid).count)
print("2nd result:", parsed.filter(isValid2).count)
