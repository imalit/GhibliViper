//
//  GhibliMoviePageView.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-24.
//

import SwiftUI

@available(iOS 15.0, *)
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

//struct GhibliMoviePageView_Previews: PreviewProvider {
//    static var previews: some View {
//        GhibliMoviePageView()
//    }
//}
