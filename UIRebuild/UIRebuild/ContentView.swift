import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var authViewModel = AuthViewModel()

    var body: some View {
           Group {
               if authViewModel.isLoggedIn {
                   MainView()
                       .environmentObject(authViewModel)
               } else {
                   MainMapView()
                       .environmentObject(authViewModel)
               }
           }
       }
}

#Preview {
    ContentView()
}
