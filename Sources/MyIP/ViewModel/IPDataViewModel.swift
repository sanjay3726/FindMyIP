//
//  IPDataViewModel.swift
//  FindMyIP
//
//  Created by Sanjay Yadav on 29/08/24.
//

import Foundation
import Combine
import Alamofire

@available(iOS 13.0, *)
class IPDataViewModel: ObservableObject {
    @Published var ipInfo: IPData?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()

    func fetchIPInfo() {
        self.isLoading = true
        self.errorMessage = nil
        self.ipInfo = nil
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            AF.request("https://ipapi.co/json/")
                .validate()
                .publishDecodable(type: IPData.self)
                .value()
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    guard let self = self else { return }
                    self.isLoading = false
                    switch completion {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    case .finished:
                        break
                    }
                } receiveValue: { [weak self] ipInfo in
                    self?.ipInfo = ipInfo
                }
                .store(in: &cancellables)
        }
    }
}
