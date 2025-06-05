//
//  OnboardingViewModel.swift
//  swipe-videos-test-task
//
//  Created by Константин Клинов on 05/06/25.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int = 0
    let pages: [OnboardingPage] = [
        OnboardingPage(videoName: "Testdrive_01", text: "Welcome to your journey!"),
        OnboardingPage(videoName: "Testdrive_2", text: "Explore the features!"),
        OnboardingPage(videoName: "Testdrive_03", text: "Get ready to dive in!")
    ]
    
    var numberOfPages: Int {
        pages.count
    }
    
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
