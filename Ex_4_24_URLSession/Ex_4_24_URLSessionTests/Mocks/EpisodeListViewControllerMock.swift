//
//  EpisodeListViewControllerMock.swift
//  Ex_4_24_URLSessionTests
//
//  Created by Zuleykha Pavlichenkova on 23.12.2022.
//

import Foundation
@testable import Ex_4_24_URLSession

class EpisodeListViewControllerMock: IEpisodeListViewController {

    var invokedUpdateUI = false
    var invokedUpdateUICount = 0

    func updateUI() {
        invokedUpdateUI = true
        invokedUpdateUICount += 1
    }

    var invokedShowError = false
    var invokedShowErrorCount = 0
    var invokedShowErrorParameters: (message: String, Void)?
    var invokedShowErrorParametersList = [(message: String, Void)]()

    func showError(message: String) {
        invokedShowError = true
        invokedShowErrorCount += 1
        invokedShowErrorParameters = (message, ())
        invokedShowErrorParametersList.append((message, ()))
    }

    var invokedShowActivityIndicator = false
    var invokedShowActivityIndicatorCount = 0

    func showActivityIndicator() {
        invokedShowActivityIndicator = true
        invokedShowActivityIndicatorCount += 1
    }

    var invokedHideActivityIndicator = false
    var invokedHideActivityIndicatorCount = 0

    func hideActivityIndicator() {
        invokedHideActivityIndicator = true
        invokedHideActivityIndicatorCount += 1
    }
}
