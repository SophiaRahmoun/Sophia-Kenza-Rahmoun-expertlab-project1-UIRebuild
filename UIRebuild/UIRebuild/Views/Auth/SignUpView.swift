//
//  SignUpView.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//
import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = SignUpViewModel()
    @State private var navigateToLogin = false

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
                            .padding(.top, 10)
                            Spacer()
                        }

                        Text("Create a new account")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, 70)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)

                        Text("Please fill in the details to sign up")
                            .foregroundColor(.gray)
                            .padding(.bottom, 70)

                        Group {
                            HStack {
                                Image(systemName: "envelope")
                                    .foregroundColor(.black)
                                TextField("", text: $viewModel.email)
                                    .foregroundColor(.black)
                                    .placeholder(when: viewModel.email.isEmpty) {
                                        Text("Email").foregroundColor(.black.opacity(0.6))
                                    }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "#D9D9D9"))
                            .cornerRadius(30)

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

                        Button(action: {
                            // TODO: Handle Apple sign-in action
                        }) {
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
                            Text("Already have an account?")
                            Button {
                                navigateToLogin = true
                            } label: {
                                Text("Sign in here")
                                    .fontWeight(.bold)
                            }
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)

                        Button {
                            viewModel.register()
                        } label: {
                            Text("Continue")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.yellow)
                                .cornerRadius(30)
                        }
                        .padding(.top, 30)
                    }
                    .padding(.horizontal, 30)

                    Spacer()
                }
                .navigationDestination(isPresented: $navigateToLogin) {
                    LoginView()
                }
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}


#Preview {
    SignUpView()
}
