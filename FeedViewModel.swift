import SwiftUI
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private let db = Firestore.firestore()
    
    func fetchPosts() {
        db.collection("items").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching posts: \(error)")
                return
            }
            
            if let snapshot = snapshot {
                self.posts = snapshot.documents.compactMap { doc in
                    try? doc.data(as: Post.self)
                }
            }
        }
    }
}

