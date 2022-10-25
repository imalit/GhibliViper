//
//  GhibliHomeListCellView.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-21.
//

import SwiftUI

@available(iOS 15.0, *)
struct GhibliHomeListCellView: View {
    @ObservedObject var presenter: GhibliHomeListCellPresenter
    
    var body: some View {
        let movie = presenter.getData()
        
        VStack {
            HStack {
                Text("\(movie.ghibliMovie.title)")
                    .font(.title3)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                    
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
                    .frame(
                        width: 150,
                        height: 150,
                        alignment: .trailing
                    )
            }.padding(
                EdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: 20,
                    trailing: 5
                )
            )
            
            Text("\(movie.ghibliMovie.ghibliDescription)")
                .lineLimit(nil)
                .font(.body)
        }.padding(
            EdgeInsets(
                top: 10,
                leading: 10,
                bottom: 10,
                trailing: 10
            )
        )
    }
}

@available(iOS 15.0, *)
struct GhibliHomeListCellView_Previews: PreviewProvider {
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
        
        let interactor = GhibliHomeListCellInteractor(data: personalizedMovie)
        let presenter = GhibliHomeListCellPresenter(interactor: interactor)
        GhibliHomeListCellView(presenter: presenter)
    }
}
