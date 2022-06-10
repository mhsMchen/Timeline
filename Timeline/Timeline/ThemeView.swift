import SwiftUI

/*
Creates a selection of themes to view
lets theme equal Swift Themes

throws: body object that showcases all available themes
parameters: view
 when viewing:
    create a rounded rectangle (the corner is rounded to a radius of 4)
    fill with main color
    Label with theme.name
    label with Padding of (4)
 foreground color is the accent color
returns: ----
 */


struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            Label(theme.name, systemImage: "paintpalette")
                .padding(4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}
