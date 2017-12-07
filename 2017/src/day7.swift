import Foundation

func loadInput() -> String {
  return try! String(contentsOfFile: "../resources/day7.txt")
}

func matches(for regex: String, in text: String) -> [String] {
  guard let regex = try? NSRegularExpression(pattern: regex) else { return [] }
  let results = regex.matches(
    in: text,
    range: NSRange(text.startIndex..., in: text))
  return results.map {
    String(text[Range($0.range, in: text)!])
  }
}

class Node {
  let id: String
  var weigth: Int = 0
  var nodes: [Node] = []
  var parent: Node?

  init(id: String) {
    self.id = id
  }

  func addChild(node: Node) {
    nodes.append(node)
  }

//  var totalWeight: Int {
//    ley weights = nodes.forEach{ $0.totalWeight }
//    guard !weights.isEmpty else { return weigth }
//
//    let balance = weights.max()! - weights.min()!
//    if balance != 0 {
//		// found node with a unbalanced child
//    }
//    return n.values.reduce(0, +) + weigth
//  }
}

func parse(_ input: String) -> [String: Node] {
  var nodes: [String: Node] = [:]
  input
    .split(separator: "\n")
    .forEach { substring in
      var split: [String] = matches(for: "\\w+", in: String(substring))
      guard
        let rootId = split.first,
        let weigth = Int(split[1])
      else { return }

      let node = nodes[rootId] ?? Node(id: rootId)
      node.weigth = weigth
      nodes[rootId] = node

      Array(split.dropFirst(2)).forEach { id in
        let child = nodes[id] ?? Node(id: id)
        child.parent = node
        node.addChild(node: child)
        nodes[id] = child
      }
  }
  return nodes
}

// Find root node.
func findParent(node: Node) -> Node {
  guard let p = node.parent else { return node }
  return findParent(node: p)
}


let parsed = parse(loadInput())
let root = findParent(node: parsed.first!.value)
print(root.id)
