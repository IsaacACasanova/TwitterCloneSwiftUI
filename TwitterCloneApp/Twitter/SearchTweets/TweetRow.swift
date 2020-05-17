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
            HStack(alignment: .top) {
                AsyncImage(
                    url: viewModel.avatarURL,
                   cache: imageCache,
                   placeholder: Image("twitter_default_profile_image"),
                   configuration: { $0.resizable() }
                )
                .frame(width: 50.0, height: 50.0)
                .clipShape(Circle())
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.name)
                            .bold()
                            .lineLimit(1)
                        Text(viewModel.screenName)
                            .font(.caption)
                            .fontWeight(.light)
                        Text(viewModel.createdAt)
                            .font(.footnote)
                            .fontWeight(.light)
                    }
                    Text(viewModel.content)
                        .font(.body)
                        .fontWeight(.light)
                }
            }
        }
        .padding([.top, .bottom])
    }
}


struct TweetRow_Previews: PreviewProvider {
    static var previews: some View {
        TweetRow(imageCache: MockImageCache(), viewModel: .preview)
    }
}
