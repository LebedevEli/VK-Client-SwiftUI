//
//  ContentView.swift
//  VK-Client-SwiftUI
//
//  Created by Илья Лебедев on 05.10.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
    .removeDuplicates()
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image("download")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        Text("VK Client ")
                            .font(.largeTitle)
                            .padding(.top, 32)
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    VStack {
                        HStack {
                            Text("Логин:")
                            Spacer()
                            TextField("Введите логин", text: $login)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Пароль:")
                            Spacer()
                            SecureField("Введите пароль", text: $password)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }.frame(maxWidth: 250)
                    .padding(.top, 50)
                    Button(action: { print("Hello") }) {
                        Text("Войти")
                            .font(.title3)
                            .foregroundColor(Color.orange)
                    }
                    .frame(width: 100, height: 40)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .disabled(login.isEmpty || password.isEmpty)
                    
                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.shouldShowLogo = !isKeyboardOn
                }
            }
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
