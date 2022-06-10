import SwiftUI

/* Creates functionality for ThemeView file (allows user input for each theme)

throws: Picker method within another body object, for each theme within the global theme var
parameters: View
returns: ---- */


//Default themes selector for xcode
struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
    }
}
