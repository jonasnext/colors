import SwiftUI

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

// assert("xyz".leftPadding(toLength: 2, withPad: "0") == "yz")
// assert("1".leftPadding(toLength: 2, withPad: "0") == "01")

//
// Color
//

// convert p3/… color space to srgb color, and return string in base 16

extension Color {
    func srgb16(alpha: Bool = false) -> String? {
        guard let color = cgColor,
            let colorSpace = CGColorSpace(name: CGColorSpace.sRGB),
            let srgb = color.converted(to: colorSpace, intent: .defaultIntent, options: nil),
            let components = srgb.components else { return nil }

        let c16 = components.map { String(Int(($0*255).rounded()), radix: 16).leftPadding(toLength: 2, withPad: "0") }

        let result = alpha ? "\(c16[0])\(c16[1])\(c16[2])\(c16[3])" : "\(c16[0])\(c16[1])\(c16[2])"
        return result
    }
}

// colors

extension Color {
    static let darktitanium = Color(.displayP3, red: 84 / 255, green: 78 / 255, blue: 66 / 255, opacity: 1)
    static let lighttitanium = Color(.displayP3, red: 191 / 255, green: 174 / 255, blue: 152 / 255, opacity: 1)
    static let ceramic = Color(.displayP3, red: 244 / 255, green: 244 / 255, blue: 244 / 255, opacity: 1)
    static let gold = Color(.displayP3, red: 181 / 255, green: 146 / 255, blue: 104 / 255, opacity: 1)
    static let navyblue = Color(.displayP3, red: 33 / 255, green: 67 / 255, blue: 92 / 255, opacity: 1)
    static let ivory = Color(.displayP3, red: 231 / 255, green: 226 / 255, blue: 218 / 255, opacity: 1)

    static let palepink = Color(.displayP3, red: 234 / 255, green: 213 / 255, blue: 206 / 255, opacity: 1)
    static let white = Color(.displayP3, red: 242 / 255, green: 242 / 255, blue: 242 / 255, opacity: 1)
    static let black = Color(.displayP3, red: 26 / 255, green: 26 / 255, blue: 26 / 255, opacity: 1)
    static let evergreen = Color(.displayP3, red: 88 / 255, green: 95 / 255, blue: 75 / 255, opacity: 1)
    static let mango = Color(.displayP3, red: 245 / 255, green: 189 / 255, blue: 102 / 255, opacity: 1)
    static let slate = Color(.displayP3, red: 56 / 255, green: 56 / 255, blue: 54 / 255, opacity: 1)

    static let warmgray = Color(.displayP3, red: 188 / 255, green: 179 / 255, blue: 168 / 255, opacity: 1)
    static let watermelon = Color(.displayP3, red: 184 / 255, green: 73 / 255, blue: 68 / 255, opacity: 1)
    static let red = Color(.displayP3, red: 208 / 255, green: 61 / 255, blue: 57 / 255, opacity: 1)
    static let orange = Color(.displayP3, red: 236 / 255, green: 110 / 255, blue: 48 / 255, opacity: 1)
    static let clementine = Color(.displayP3, red: 236 / 255, green: 113 / 255, blue: 83 / 255, opacity: 1)
    static let apricot = Color(.displayP3, red: 234 / 255, green: 124 / 255, blue: 89 / 255, opacity: 1)

    static let peach = Color(.displayP3, red: 213 / 255, green: 131 / 255, blue: 101 / 255, opacity: 1)
    static let papaya = Color(.displayP3, red: 239 / 255, green: 138 / 255, blue: 80 / 255, opacity: 1)
    static let kumquat = Color(.displayP3, red: 237 / 255, green: 142 / 255, blue: 92 / 255, opacity: 1)
    static let lightorange = Color(.displayP3, red: 239 / 255, green: 153 / 255, blue: 54 / 255, opacity: 1)
    static let mellowyellow = Color(.displayP3, red: 245 / 255, green: 243 / 255, blue: 192 / 255, opacity: 1)
    static let lemoncream = Color(.displayP3, red: 251 / 255, green: 234 / 255, blue: 140 / 255, opacity: 1)

    static let yellow = Color(.displayP3, red: 226 / 255, green: 204 / 255, blue: 70 / 255, opacity: 1)
    static let pollen = Color(.displayP3, red: 246 / 255, green: 210 / 255, blue: 110 / 255, opacity: 1)
    static let canaryyellow = Color(.displayP3, red: 249 / 255, green: 223 / 255, blue: 98 / 255, opacity: 1)
    static let flashlight = Color(.displayP3, red: 244 / 255, green: 236 / 255, blue: 77 / 255, opacity: 1)
    static let flash = Color(.displayP3, red: 228 / 255, green: 241 / 255, blue: 85 / 255, opacity: 1)
    static let green = Color(.displayP3, red: 159 / 255, green: 223 / 255, blue: 80 / 255, opacity: 1)

    static let spearmint = Color(.displayP3, red: 156 / 255, green: 230 / 255, blue: 149 / 255, opacity: 1)
    static let mint = Color(.displayP3, red: 186 / 255, green: 234 / 255, blue: 164 / 255, opacity: 1)
    static let beryl = Color(.displayP3, red: 217 / 255, green: 241 / 255, blue: 193 / 255, opacity: 1)
    static let seafoam = Color(.displayP3, red: 217 / 255, green: 241 / 255, blue: 221 / 255, opacity: 1)
    static let turquoise = Color(.displayP3, red: 169 / 255, green: 211 / 255, blue: 205 / 255, opacity: 1)
    static let lightblue = Color(.displayP3, red: 127 / 255, green: 193 / 255, blue: 217 / 255, opacity: 1)

    static let surfblue = Color(.displayP3, red: 62 / 255, green: 130 / 255, blue: 179 / 255, opacity: 1)
    static let blue = Color(.displayP3, red: 85 / 255, green: 178 / 255, blue: 244 / 255, opacity: 1)
    static let royalblue = Color(.displayP3, red: 117 / 255, green: 170 / 255, blue: 231 / 255, opacity: 1)
    static let cerulean = Color(.displayP3, red: 158 / 255, green: 195 / 255, blue: 228 / 255, opacity: 1)
    static let lilac = Color(.displayP3, red: 179 / 255, green: 164 / 255, blue: 219 / 255, opacity: 1)
    static let mistblue = Color(.displayP3, red: 179 / 255, green: 184 / 255, blue: 168 / 255, opacity: 1)

    static let azure = Color(.displayP3, red: 137 / 255, green: 152 / 255, blue: 159 / 255, opacity: 1)
    static let northernblue = Color(.displayP3, red: 122 / 255, green: 154 / 255, blue: 155 / 255, opacity: 1)
    static let stormgray = Color(.displayP3, red: 111 / 255, green: 149 / 255, blue: 150 / 255, opacity: 1)
    static let cactus = Color(.displayP3, red: 113 / 255, green: 136 / 255, blue: 129 / 255, opacity: 1)
    static let pacificgreen = Color(.displayP3, red: 55 / 255, green: 124 / 255, blue: 153 / 255, opacity: 1)
    static let bluecobalt = Color(.displayP3, red: 84 / 255, green: 123 / 255, blue: 154 / 255, opacity: 1)

    static let alaskanblue = Color(.displayP3, red: 100 / 255, green: 108 / 255, blue: 130 / 255, opacity: 1)
    static let darkteal = Color(.displayP3, red: 67 / 255, green: 113 / 255, blue: 143 / 255, opacity: 1)
    static let bluehorizon = Color(.displayP3, red: 53 / 255, green: 101 / 255, blue: 153 / 255, opacity: 1)
    static let deepnavy = Color(.displayP3, red: 96 / 255, green: 112 / 255, blue: 149 / 255, opacity: 1)
    static let linenblue = Color(.displayP3, red: 90 / 255, green: 106 / 255, blue: 145 / 255, opacity: 1)
    static let denimblue = Color(.displayP3, red: 99 / 255, green: 130 / 255, blue: 164 / 255, opacity: 1)

    static let midnightblue = Color(.displayP3, red: 69 / 255, green: 77 / 255, blue: 114 / 255, opacity: 1)
    static let oceanblue = Color(.displayP3, red: 118 / 255, green: 135 / 255, blue: 193 / 255, opacity: 1)
    static let delftblue = Color(.displayP3, red: 94 / 255, green: 117 / 255, blue: 185 / 255, opacity: 1)
    static let indigo = Color(.displayP3, red: 90 / 255, green: 98 / 255, blue: 159 / 255, opacity: 1)
    static let purple = Color(.displayP3, red: 147 / 255, green: 125 / 255, blue: 239 / 255, opacity: 1)
    static let ultraviolet = Color(.displayP3, red: 109 / 255, green: 87 / 255, blue: 183 / 255, opacity: 1)

    static let lavendergray = Color(.displayP3, red: 134 / 255, green: 133 / 255, blue: 161 / 255, opacity: 1)
    static let lavender = Color(.displayP3, red: 174 / 255, green: 155 / 255, blue: 165 / 255, opacity: 1)
    static let pinksand = Color(.displayP3, red: 244 / 255, green: 195 / 255, blue: 172 / 255, opacity: 1)
    static let lightpink = Color(.displayP3, red: 233 / 255, green: 178 / 255, blue: 172 / 255, opacity: 1)
    static let vintagerose = Color(.displayP3, red: 233 / 255, green: 174 / 255, blue: 166 / 255, opacity: 1)
    static let grapefruit = Color(.displayP3, red: 242 / 255, green: 180 / 255, blue: 145 / 255, opacity: 1)

    static let pink = Color(.displayP3, red: 235 / 255, green: 101 / 255, blue: 104 / 255, opacity: 1)
    static let electricpink = Color(.displayP3, red: 234 / 255, green: 91 / 255, blue: 88 / 255, opacity: 1)
    static let pinkcitrus = Color(.displayP3, red: 221 / 255, green: 91 / 255, blue: 79 / 255, opacity: 1)
    static let neonpink = Color(.displayP3, red: 233 / 255, green: 77 / 255, blue: 68 / 255, opacity: 1)
    static let dragonfruit = Color(.displayP3, red: 224 / 255, green: 87 / 255, blue: 126 / 255, opacity: 1)
    static let hibiscus = Color(.displayP3, red: 231 / 255, green: 60 / 255, blue: 92 / 255, opacity: 1)

    static let pomegranate = Color(.displayP3, red: 206 / 255, green: 60 / 255, blue: 95 / 255, opacity: 1)
    static let plum = Color(.displayP3, red: 137 / 255, green: 70 / 255, blue: 76 / 255, opacity: 1)
    static let rosered = Color(.displayP3, red: 169 / 255, green: 54 / 255, blue: 71 / 255, opacity: 1)
    static let camellia = Color(.displayP3, red: 185 / 255, green: 78 / 255, blue: 72 / 255, opacity: 1)
    static let flamingo = Color(.displayP3, red: 198 / 255, green: 134 / 255, blue: 112 / 255, opacity: 1)
    static let camel = Color(.displayP3, red: 175 / 255, green: 144 / 255, blue: 103 / 255, opacity: 1)

    static let walnut = Color(.displayP3, red: 168 / 255, green: 135 / 255, blue: 104 / 255, opacity: 1)
    static let stone = Color(.displayP3, red: 171 / 255, green: 153 / 255, blue: 131 / 255, opacity: 1)
    static let antiquewhite = Color(.displayP3, red: 208 / 255, green: 183 / 255, blue: 151 / 255, opacity: 1)
    static let cream = Color(.displayP3, red: 249 / 255, green: 228 / 255, blue: 187 / 255, opacity: 1)
    static let softwhite = Color(.displayP3, red: 219 / 255, green: 209 / 255, blue: 188 / 255, opacity: 1)
    static let pebble = Color(.displayP3, red: 170 / 255, green: 156 / 255, blue: 143 / 255, opacity: 1)

    static let cocoa = Color(.displayP3, red: 152 / 255, green: 142 / 255, blue: 139 / 255, opacity: 1)
    static let coastalgray = Color(.displayP3, red: 126 / 255, green: 110 / 255, blue: 98 / 255, opacity: 1)
    static let darkolive = Color(.displayP3, red: 140 / 255, green: 140 / 255, blue: 120 / 255, opacity: 1)
    static let khaki = Color(.displayP3, red: 137 / 255, green: 126 / 255, blue: 92 / 255, opacity: 1)
    static let pinegreen = Color(.displayP3, red: 98 / 255, green: 124 / 255, blue: 103 / 255, opacity: 1)
    static let cyprusgreen = Color(.displayP3, red: 100 / 255, green: 110 / 255, blue: 90 / 255, opacity: 1)

    static let rosegold = Color(.displayP3, red: 225 / 255, green: 168 / 255, blue: 137 / 255, opacity: 1)
    static let yellowgold = Color(.displayP3, red: 205 / 255, green: 168 / 255, blue: 130 / 255, opacity: 1)
}
