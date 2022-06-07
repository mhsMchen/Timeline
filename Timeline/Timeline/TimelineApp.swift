import SwiftUI
/* Main class, where all backend functions go. This file is used for the overall functionality (essentially the app delegate)

throws: Picker method within another body object, for each theme within the global theme var
parameters: View
returns: ----
 */
//Main class: this function starts the app and runs all necessary backend functions
@main
struct TimelineApp: App {
    @StateObject private var store = clubstore()
    
    var body: some Scene {
        //Directs view to clubs view also check for errors and crash app if occurs
        WindowGroup {
            NavigationView {
                clubsView(clubs: $store.clubs) {
                    clubstore.save(clubs: store.clubs) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            //Run clubstore to get stored data of clubs on start of app, crash if error occurs
            .onAppear {
                clubstore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let clubs):
                        store.clubs = clubs
                    }
                }
            }
        }
    }
}
