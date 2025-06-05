//
//  OnboardingViewModel.swift
//  swipe-videos-test-task
//
//  Created by Константин Клинов on 05/06/25.
//

import SwiftUI

/// A data model for managing onboarding page navigation and content.
class OnboardingViewModel: ObservableObject {
    /// The current page index, published to update the UI.
    @Published var currentPage: Int = 0
    
    /// The list of onboarding pages, each with a video name and text.
    let pages: [OnboardingPage] = [
        OnboardingPage(videoName: "Testdrive_01", text: "Welcome to your journey!"),
        OnboardingPage(videoName: "Testdrive_2", text: "Explore the features!"),
        OnboardingPage(videoName: "Testdrive_03", text: "Get ready to dive in!")
    ]
    
    /// The total number of onboarding pages.
    var numberOfPages: Int {
        pages.count
    }
    
    /// Advances to the next page or loops back to the first page.
    func goToNextPage() {
        withAnimation {
            if currentPage < pages.count - 1 {
                currentPage += 1
            } else {
                currentPage = 0
            }
        }
    }
}
