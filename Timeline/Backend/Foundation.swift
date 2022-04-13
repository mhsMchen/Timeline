import Foundation

struct clubFoundation: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var roomNum: String
    var Supervisor: String
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], roomNum: String, Supervisor: String, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.roomNum = roomNum
        self.Supervisor = Supervisor
        self.theme = theme
    }
}

extension clubFoundation {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var roomNum: String = ""
        var Supervisor: String = ""
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, roomNum: roomNum, Supervisor: Supervisor, theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        roomNum = data.roomNum
        Supervisor = data.Supervisor
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        roomNum = data.roomNum
        Supervisor = data.Supervisor
        theme = data.theme
    }
}

extension clubFoundation {
    static let sampleData: [clubFoundation] =
    [
        clubFoundation(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], roomNum: "200", Supervisor: "", theme: .yellow),
    ]
}
