//
//  UpcomingViewModel.swift
//  Encore
//
//  Created by Albert Chittaphong on 10/7/26.
//

import Foundation
import SwiftData

@Observable
final class UpcomingViewModel {
    var searchText = ""
    var showingAddSheet = false
    var showToMarkAttended: Show?
    var pendingRating = 0
    
//    func filteredshows(_shows: [Show]) -> [Show] {
//        shows
//            .filter { $0.status == .upcoming }
//            .sorted { $0.date < $1.date }
//        
//    }
    func filteredShows(_ shows: [Show]) -> [Show] {
        let upcoming = shows.filter({ $0.status == .upcoming })
        
        guard !searchText.isEmpty else {
            return upcoming
        }
        
        return upcoming.filter {
            $0.artistName.localizedCaseInsensitiveContains(searchText) ||
            $0.venueName.localizedCaseInsensitiveContains(searchText) ||
            $0.city.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func delete(_ show: Show, context: ModelContext) {
        context.delete(show)
    }
    
    func markAsAttended(_ show: Show) {
        show.status = .attended
        show.rating = pendingRating > 0 ? pendingRating : nil
        pendingRating = 0
        showToMarkAttended = nil
    }
}
