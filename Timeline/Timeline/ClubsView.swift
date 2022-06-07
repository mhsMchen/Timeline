import SwiftUI
import AVFoundation
/*
 class that dictates the visual representation of clubs
 accesses the sound effect player
 creates a Ui for the club
    create leading alignment
    enter text:club.title, with additional information
    create a space
    create label with number of attendees
    create a space
    create label with the rum number
get font information
calls padding function
adds foreground color
plays the startup sound
    
    
 */
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
