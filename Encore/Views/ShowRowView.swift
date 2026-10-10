//
//  ShowRowView.swift
//  Encore
//
//  Created by Albert Chittaphong on 10/7/26.
//

import SwiftUI
import SwiftData

struct ShowRowView: View {
    let show: Show
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(show.artistName)
                .font(.headline)
            
            HStack(spacing: 4) {
                Text(show.venueName)
                Text("-")
                Text(show.city)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
            HStack {
                Text(show.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                if let rating = show.rating {
                    Spacer()
                    HStack(spacing: 2) {
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= rating ? "star.fill" : "star")
                                .font(.caption2)
                                .foregroundColor(star <= rating ? .yellow : .secondary)
                        }
                            
                    }
                }
            }
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    ShowRowView(show: Show(artistName: "MGK", venueName: "The Fillmore", city: "San Francisco", date: .now, status: .attended))
}
