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

//struct GhibliHomeListCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        GhibliHomeListCellView()
//    }
//}
