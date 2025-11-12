//
//  LoginView.swift
//  UIRebuild
//
//  Created by admin on 0/10/2025.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = LoginViewModel()
    @State private var navigateToSignUp = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                VStack {
                    Spacer()

                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            Spacer()
                        }

                        Text("Log in")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, 180)

                        Text("Please sign in to continue")
                            .foregroundColor(.gray)
                            .padding(.bottom, 70)


                        Group {
                            HStack {
                                Image(systemName: "person")
                                    .foregroundColor(.black)
                                TextField("", text: $viewModel.username)
                                    .foregroundColor(.black)
                                    .placeholder(when: viewModel.username.isEmpty) {
                                        Text("Username").foregroundColor(.black.opacity(0.6))
                                    }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "#D9D9D9"))
                            .cornerRadius(30)

                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(.black)
                                SecureField("", text: $viewModel.password)
                                    .foregroundColor(.black)
                                    .placeholder(when: viewModel.password.isEmpty) {
                                        Text("Password").foregroundColor(.black.opacity(0.6))
                                    }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "#D9D9D9"))
                            .cornerRadius(30)
                        }

                        Button {
                            viewModel.signInWithApple()
                        } label: {
                            HStack {
                                Image(systemName: "applelogo")
                                Text("Continue with Apple")
                            }
                            .foregroundColor(Color(hex: "#F7F2F2"))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#1D1B20"))
                            .cornerRadius(40)
                        }

                        HStack(spacing: 4) {
                                                Text("No account?")
                                                Button {
                                                    navigateToSignUp = true
                                                } label: {
                                                    Text("Make a new account here")
                                                        .fontWeight(.bold)
                                                }
                                            }
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                            .frame(maxWidth: .infinity)
                                            .multilineTextAlignment(.center)

                        Button {
                            viewModel.login()
                        } label: {
                            Text("Continue")
                            
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.yellow)
                                .cornerRadius(30)
                           
                            }
                        .padding(.top, 20)
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .padding(.top, 10)
                                .frame(maxWidth: .infinity)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true) 

                        }
                        
                        
                    }
                    .padding(.horizontal, 30)

                    Spacer()
                }
                .navigationDestination(isPresented: $navigateToSignUp) {
                    SignUpView()
                }
                .navigationDestination(isPresented: $viewModel.shouldNavigateToMainView) {
                    MapConnectedView()
                }
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    LoginView()
}
