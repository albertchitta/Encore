//
//  EmptyStateView.swift
//  Encore
//
//  Created by Albert Chittaphong on 10/10/26.
//

import SwiftUI

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    
    var body: some View {
        ContentUnavailableView(title, systemImage: icon, description: Text(message))
    }
}
