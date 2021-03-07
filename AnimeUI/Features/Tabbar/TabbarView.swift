//
//  TabbarView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 06/03/2021.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
      TabView {
        AnimeListView()
          .tabItem {
            Label("Top", systemImage: "star.square.fill")
          }
        ContentView()
          .tabItem {
            Label("Search", systemImage: "a.magnify")
          }
      }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
