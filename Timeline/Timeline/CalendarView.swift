import SwiftUI

/*Displays event calendar (placeholder button)

throws: body object, zstack of a rectangle that fills the screen
parameters: View
returns: ---- */

//Called after event calendar button is clicked, produces a calendar
import SelectableCalendarView
struct MeetingView: View {
    
    //Create a var to hold selected date
    @State private var dateSelected: Date = Date()
    
    var body: some View {
        VStack {
            //Create a title
            Text("Event Calendar")
                .accessibilityAddTraits(.isHeader)
                .font(.headline)
            
            //Create calendar and displays cuurent month. Allows for date selection
            SelectableCalendarView(monthToDisplay: Date(), dateSelected: $dateSelected).padding()
            Spacer()
                .frame(height: 200)
            }
        }
}
