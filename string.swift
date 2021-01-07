import Foundation

//
// String
//

// returns a new string formed from the receiver by either removing characters from the start,
// or by prepending as many occurrences as necessary of a given pad string

extension String {
    func leftPadding(toLength newLength: Int, withPad padString: String) -> String {
        guard count < newLength else {
            return String(suffix(newLength))
        }

        return String(repeating: padString, count: newLength - count).appending(self)
    }
}

// test

private func test() {
    assert("xyz".leftPadding(toLength: 2, withPad: "0") == "yz")
    assert("1".leftPadding(toLength: 2, withPad: "0") == "01")
    print("OK")
}
