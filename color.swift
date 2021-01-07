import SwiftUI

//
// Color
//

// convert p3/… to srgb, and return string in base 16

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
