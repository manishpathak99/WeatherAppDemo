//
//  NetworkReachability.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

class NetworkReachability {

    private static var instance = NetworkReachability()
    public static func shared() -> NetworkReachability {
        return NetworkReachability.instance
    }
    private init() {}
}

extension NetworkReachability: ReachabilityProtocol {

    func isInternetAvailable() -> Bool {
        return Reachability.isConnectedToNetwork()
    }
}
