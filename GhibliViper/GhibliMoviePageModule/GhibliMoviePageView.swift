//
//  GhibliMoviePageView.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-24.
//

import SwiftUI

struct GhibliMoviePageView: View {
    @ObservedObject var presenter: GhibliMoviePagePresenter
    @State var movieState: MovieState
    

    var body: some View {
        let movie = presenter.getData()
        
        VStack {
            Text("\(movie.ghibliMovie.title)")
                .font(.largeTitle)
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 10,
                        bottom: 10,
                        trailing: 10
                    )
                )
            
            Picker("state:",
                   selection: $movieState) {
                    Text("None").tag(MovieState.none)
                    Text("To Watch").tag(MovieState.toWatch)
                    Text("Watched").tag(MovieState.watched)
            }
                   .pickerStyle(.automatic)
                   .onReceive([self.movieState].publisher.first()) { state in
                       presenter.setState(movieState: state)
                   }
            
            AsyncImage(
                url: URL(string: movie.ghibliMovie.image),
                content: { image in
                    image.resizable()
                }, placeholder: {
                    Color.red
                }
            )
                .scaledToFit()
                .cornerRadius(10)
            
            Text("\(movie.ghibliMovie.ghibliDescription)")
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }.padding(
            EdgeInsets(
                top: 10,
                leading: 10,
                bottom: 20,
                trailing: 10
            )
        ).navigationBarTitle("", displayMode: .inline)
    }

}

struct GhibliMoviePageView_Previews: PreviewProvider {
    static var previews: some View {
        let ghibliMovie = GhibliElement(
            id: "790e0028-a31c-4626-a694-86b7a8cada40",
            title: "Earwig and the Witch",
            originalTitle: "",
            originalTitleRomanised: "",
            image: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sJhFtY3eHuvvACaPpxpzdCLQqpQ.jpg",
            movieBanner: "",
            ghibliDescription: "An orphan girl, Earwig, is adopted by a witch and comes home to a spooky house filled with mystery and magic.",
            director: "",
            producer: "",
            releaseDate: "",
            runningTime: "",
            rtScore: "",
            people: [],
            species: [],
            locations: [],
            vehicles: [],
            url: "")
        
        let personalizedMovie = PersonalizedMovie(
            movie: ghibliMovie,
            state: .none
        )
        
        let interactor = GhibliMoviePageInteractor(data: personalizedMovie)
        let presenter = GhibliMoviePagePresenter(interactor: interactor)
        
        GhibliMoviePageView(presenter: presenter, movieState: .toWatch)
    }
}
