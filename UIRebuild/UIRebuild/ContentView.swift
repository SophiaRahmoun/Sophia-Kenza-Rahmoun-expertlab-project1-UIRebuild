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
                       .environmentObject(sessionManager)

               } else {
                   MainMapView()
                       .environmentObject(authViewModel)
                       .environmentObject(sessionManager)
                       .environmentObject(mapViewModel)

               }
           }
           .environmentObject(sessionManager)
           .environmentObject(mapViewModel)
           .environmentObject(authViewModel)

    }
}

#Preview {
    ContentView()
}
