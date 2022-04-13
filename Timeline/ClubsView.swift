import SwiftUI
import AVFoundation

//Class that creates a visual of all club
struct CardView: View {
    let club: clubFoundation
    
    //Variable to access sound effects
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    //Create UI to show each club
    var body: some View {
        VStack(alignment: .leading) {
            Text(club.title)
                .accessibilityAddTraits(.isHeader)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(club.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(club.attendees.count) Members")
                Spacer()
                Label("Room \(club.roomNum)", systemImage: "house")
                    .accessibilityLabel("\(club.roomNum) room location")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(club.theme.accentColor)
        
        //Play sound on start
        .onAppear(
            perform: player.play
            )
    }
}
