//
//  TweetRow.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/3/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import SwiftUI

struct TweetRow: View {
    
    private let imageCache: ImageCache
    private let viewModel: TweetRowViewModel
    
    init(imageCache: ImageCache, viewModel: TweetRowViewModel) {
        self.imageCache = imageCache
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(
                    url: viewModel.avatarURL,
                   cache: imageCache,
                   placeholder: Image("twitter_default_profile_image"),
                   configuration: { $0.resizable() }
                )
                .frame(width: 40.0, height: 40.0)
                .clipShape(Circle())
                .shadow(radius: 10)
                
                VStack(alignment: .leading) {
                    Text(viewModel.name)
                        .bold()
                    Text(viewModel.screenName)
                        .font(.caption)
                }
                Spacer()
                Image("Twitter_Logo_Blue")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30.0, height: 30.0)
            }
            .padding(8)
            HStack {
                Text(viewModel.content)
                    .font(.body)
                    .bold()
            }
            .padding(8)
            HStack {
                Spacer()
                Text("\(viewModel.createdAt)")
                    .font(.body)
                    .bold()
            }
        }
    }
}


struct TweetRow_Previews: PreviewProvider {
    static var previews: some View {
        TweetRow(imageCache: MockImageCache(), viewModel: .preview)
    }
}
