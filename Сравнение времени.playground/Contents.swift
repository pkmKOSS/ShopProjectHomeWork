import Foundation

let stringX = "фывафыв афыва>asdasdasd<\\a>фывафыва"


extension NSAttributedString {
func getAhchorFromURL() -> String? {
    let regexForStringWithAnchor = ">[A-z]*<.a>"
    let regexForAnchor = ">.*<"
    guard self.string.contains("<\\a>") else { return nil }
    let stringWithAnchor = self.string.matchesWithRegex(for: regexForStringWithAnchor).first
    let anchor = stringWithAnchor?.matchesWithRegex(for: regexForAnchor).first
    return anchor
}
}

extension String {
    func matchesWithRegex(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(
                in: self,
                range: NSRange(self.startIndex..., in: self))
            return results.map {
                guard let range = Range($0.range, in: self) else { return "" }
                return String(self[range])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

let x = NSAttributedString(string: stringX)


x.getAhchorFromURL()

