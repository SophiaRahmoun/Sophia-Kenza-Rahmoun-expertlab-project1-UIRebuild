import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var sessionManager = SessionManager.shared
    @StateObject var mapViewModel = MapViewModel()


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
           .environmentObject(mapViewModel)

    }
}

#Preview {
    ContentView()
}
