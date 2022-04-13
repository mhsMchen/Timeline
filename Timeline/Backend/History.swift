import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [clubFoundation.Attendee]
    var roomNum: Int

    init(id: UUID = UUID(), date: Date = Date(), attendees: [clubFoundation.Attendee], roomNum: Int = 5) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.roomNum = roomNum
    }
}
