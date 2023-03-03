


import Foundation

struct Movie: Codable, Hashable {
    var name: String
    var id: Int
    var summary: String
    var image: Image
}
struct Image: Codable, Hashable {
    var original: String
}
