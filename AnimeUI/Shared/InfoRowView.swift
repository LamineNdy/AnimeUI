//
//  InfoRowView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 12/03/2021.
//

import SwiftUI

struct InfoRowView: View {
  let label: String
  let icon: String
  let text: String
  
  var body: some View {
    HStack {
      Label(label, systemImage: icon)
      Spacer()
      Text(text)
        .foregroundColor(.accentColor)
        .fontWeight(.light)
    }
  }
}
