//Post
import Foundation

struct Post: Identifiable, Codable {
    var id: String
    var item: String
    var date: String

    // Default initializer for creating new posts
    init(id: String = UUID().uuidString, item: String, date: String) {
        self.id = id
        self.item = item
        self.date = date
    }
}
