import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var sessionManager = SessionManager.shared

    var body: some View {
           Group {
               if sessionManager.isLoggedIn {
                   MainView()
                       .environmentObject(authViewModel)
               } else {
                   MainMapView()
                       .environmentObject(authViewModel)
               }
           }
           .environmentObject(sessionManager)
    }
}

#Preview {
    ContentView()
}
