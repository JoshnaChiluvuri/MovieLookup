//
//  ContentView.swift
//  MovieLookup
//
//  Created by Joshna Priya Chiluvuri on 27/06/23.
//

import SwiftUI

struct DiscoverView: View {

    @StateObject var viewModel = MovieDiscoverViewModel()
    @State var searchText = ""

    var body: some View {
        NavigationStack {

            ScrollView {
                if searchText.isEmpty {
                    if viewModel.trending.isEmpty {
                        Text("No Results")
                    } else {
                        HStack {
                            Text("Trending")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal
                        )
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                ForEach(viewModel.trending) { trendingItem in
                                    NavigationLink {
                                        MovieDetailView(movie: trendingItem)
                                    } label: {
                                        TrendingCard(trendingItem: trendingItem)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                } else {
                    LazyVStack() {
                        ForEach(viewModel.searchResults) { item in
                            NavigationLink(destination: {
                                MovieDetailView(movie: item)
                            }, label: {
                                HStack {
                                    AsyncImage(url: item.backdropURL) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 120)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 80, height: 120)
                                    }
                                    .clipped()
                                    .cornerRadius(10)

                                    VStack(alignment:.leading) {
                                        Text(item.title)
                                            .foregroundColor(.white)
                                            .font(.headline)

                                        HStack {
                                            Image(systemName: "hand.thumbsup.fill")
                                            Text(String(format: "%.1f", item.vote_average))
                                            Spacer()
                                        }
                                        .foregroundColor(.yellow)
                                        .fontWeight(.heavy)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(Color(red:61/255,green:61/255,blue:88/255))
                                .cornerRadius(20)
                                .padding(.horizontal)

                            })

                        }
                    }
                }
            }
            .background(Color.cyan)
                        //(red:39/255,green:40/255,blue:59/255)
                //.ignoresSafeArea())
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            if newValue.count > 2 {
                viewModel.search(term: newValue)
            }
        }
        .onAppear {
            viewModel.loadTrending()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
