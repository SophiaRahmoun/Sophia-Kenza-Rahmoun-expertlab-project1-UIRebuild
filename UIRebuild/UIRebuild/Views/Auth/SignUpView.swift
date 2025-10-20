//
//  SignUpView.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Welcome to registration!")
                .foregroundColor(.gray)

            // Tu pourras ajouter le vrai formulaire ici
        }
        .padding()
        .navigationTitle("Sign Up")
    }
}

#Preview {
    SignUpView()
}
