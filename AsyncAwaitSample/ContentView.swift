//
//  ContentView.swift
//  AsyncAwaitSample
//
//  Created by elkabelaya on 03.11.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel = .init()
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                viewModel.retrieveUsers()
            }
        List {
            ForEach(viewModel.users) { user in
                Text( user.email ?? "test" )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
