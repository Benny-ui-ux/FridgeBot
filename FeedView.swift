import SwiftUI
import FirebaseFirestore

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.item)
                        .font(.headline)
                    Text("Expires: \(post.date)")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Fridge Items")
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}

