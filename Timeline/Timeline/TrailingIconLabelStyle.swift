import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    /* Creates a body based on the label, and is displayed
    
    throws: hstack with objects based on label
    parameters:
        configuration : configuration
    returns: ---- */
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
