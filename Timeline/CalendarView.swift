import SwiftUI

//Called after event calendar button is clicked, does nothing so far
struct MeetingView: View {
    @Binding var club: clubFoundation
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(club.theme.mainColor)
            
        }
    }
}
