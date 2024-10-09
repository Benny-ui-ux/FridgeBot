//UploadView
import SwiftUI
import FirebaseFirestore

struct UploadView: View {
    
    @State private var item = ""
    @State private var date = ""
    @Environment(\.presentationMode) var presentationMode
    
    private let db = Firestore.firestore()
    
    var body: some View {
        VStack {
            TextField("What Did You Buy?", text: $item)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("When Does It Expire?", text: $date)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: post) {
                Text("Post")
            }
            .padding()
        }
    }
    private func post() {
        let newPost = Post(item: item, date: date)
        do {
            try db.collection("items").document(newPost.id).setData(from: newPost)
            item = ""
            date = ""
            presentationMode.wrappedValue.dismiss()  // Dismiss and return to FeedView
        } catch {
            print("Error posting: \(error)")
        }
    }
}

    
