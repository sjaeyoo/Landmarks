

import SwiftUI




extension RectangleCornerRadii {
    public init(cornerRadius: CGFloat) {
        self.init(topLeading: cornerRadius, bottomLeading: cornerRadius, bottomTrailing: cornerRadius, topTrailing: cornerRadius)
    }
}
