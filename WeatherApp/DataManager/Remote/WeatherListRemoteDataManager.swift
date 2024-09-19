//
//  WeatherListRemoteDataManager.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import Alamofire
import Foundation

class WeatherListRemoteDataManager: WeatherListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: WeatherListRemoteDataManagerOutputProtocol?
    var isAPICallInProgress: Bool?
    
    func retrieveWeatherData(city: String) {
        isAPICallInProgress = true
        let endpointWithParam = getURL(city)
        AF.request(endpointWithParam, method: .get)
            .validate()
            .responseDecodable(of: WeatherModel.self) {[weak self] (response: DataResponse<WeatherModel, AFError>) in
                self?.isAPICallInProgress = false
                
                do {
                    let jsonArray = try JSONSerialization.jsonObject(with: response.data!, options: [])
                    print(jsonArray)     // server data
                }
                catch {
                    print(response.data as Any)     // server data
                }
                
                switch response.result {
                case .success(let weatherModel):
                    self?.remoteRequestHandler?.onRetrieved(weatherModel: weatherModel)
                    
                case .failure:
                    self?.remoteRequestHandler?.onError()
                }
        }
    }
    
    private func getURL(_ city: String) -> String {
        return Endpoints.Weather.fetch(city: city).url
    }
}
