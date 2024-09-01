//
//  FindMyIPView.swift
//  FindMyIP
//
//  Created by Sanjay Yadav on 01/09/24.
//

import SwiftUI

@available(iOS 14.0, *)
public struct FindMyIPView: View {
    @StateObject private var viewModel = IPDataViewModel()

    public var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            } else if let ipInfo = viewModel.ipInfo {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("IP Address:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(ipInfo.ip)
                    }
                    HStack {
                        Text("City:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(ipInfo.city)
                    }
                    HStack {
                        Text("Region:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(ipInfo.region)
                    }
                    HStack {
                        Text("Country:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(ipInfo.country)
                    }
                    HStack {
                        Text("Latitude:")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(ipInfo.latitude)")
                    }
                    HStack {
                        Text("Longitude:")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(ipInfo.longitude)")
                    }
                    HStack {
                        Text("Organization:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(ipInfo.org)
                    }
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(8)
                .shadow(radius: 4)
                .padding()
            } else {
                Text("No data available")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .onAppear {
            viewModel.fetchIPInfo()
        }
        .padding()
    }
}

@available(iOS 14.0, *)
public struct GetIPInfoView: View {

    public init() {
        // Make the initializer public
            // Initialization code
        }
    public var body: some View {
        Text("Sanjay")
        FindMyIPView()
    }
}

@available(iOS 14.0, *)
#Preview {
    if #available(iOS 14.0, *) {
        GetIPInfoView()
    } else {
        GetIPInfoView()
        // Fallback on earlier versions
    }
}


