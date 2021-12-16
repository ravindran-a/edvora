//
//  HomeView.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var homeViewModel = HomeViewModel()
    
    var closeButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Logout")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hi There! Welcome to Edvora!")
                .foregroundColor(.accentColor)
        }
        .navigationBarTitle("Edvora Home")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: closeButton)
        .navigationBarBackButtonHidden(true)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
