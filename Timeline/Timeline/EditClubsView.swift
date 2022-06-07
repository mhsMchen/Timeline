import SwiftUI

/*
 function for creating clubs:
 Creates functionality for ClubsView file. First screen displayed, when the popup is called, it creates a list using empty variables to use as the club info
 connects clubs with club foundation
    creates a variable from enviroment
    sets isPresentingNewClubView to false
    sets newclubData to clubFoundation.data
 saves the action
 */
struct clubsView: View {
    //Binding var connects clubs var to clubFoundation
    @Binding var clubs: [clubFoundation]
    //Create var from enviroment var \.scenePhase
    @Environment(\.scenePhase) private var scenePhase
    //Static var for isPresentingNewclubView and newClubData
    @State private var isPresentingNewclubView = false
    @State private var newclubData = clubFoundation.Data()
    let saveAction: ()->Void
    
    /*
     body variable is acossiated with View
     whithin View List for each club create a navigation link to stored data for each club
     then
     creates Title "Clubs"
     calls toolbar
     */
    var body: some View {
        List {
            //Used to create naviagtion link into each stored club
            ForEach($clubs) { $club in
                NavigationLink(destination: DetailView(club: $club)) {
                    CardView(club: club)
                }
                .listRowBackground(club.theme.mainColor)
            }
        }
        //Club page UI
        .navigationTitle("Clubs")
        .toolbar {
            //Plus button control
            Button(action: {
                isPresentingNewclubView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Club")
        }
        //Top bar to leave or add new club
        .sheet(isPresented: $isPresentingNewclubView) {
            NavigationView {
                DetailEditView(data: $newclubData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewclubView = false
                                newclubData = clubFoundation.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newclub = clubFoundation(data: newclubData)
                                clubs.append(newclub)
                                isPresentingNewclubView = false
                                newclubData = clubFoundation.Data()
                            }
                        }
                    }
            }
        }
        //Saves scene if change occurs
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

