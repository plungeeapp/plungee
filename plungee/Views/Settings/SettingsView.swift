//
//  SettingsView.swift
//  plungee
//
//  Created by Tobias on 28/03/2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack {
            VStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 130, height: 130)
                
                Text("John Doe")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .padding(.top, 30)
            
            Button {
                do {
                    try authManager.signOut()
                } catch {
                    print(error.localizedDescription)
                    return
                }
            } label: {
                Text("sign out")
            }

        }
        .padding()
    }
}

#Preview {
    SettingsView()
        .environmentObject(AuthManager())
}
