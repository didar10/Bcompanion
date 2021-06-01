//
//  DataManager.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/25/21.
//

import Foundation
import Alamofire

class DataManager : NSObject {
    func callingCitiesList(onCompletion: @escaping([String]) -> ()){
        AF.request(cities_list_url, method: .get).response {
            response in
            
            debugPrint(response)
            
            switch response.result{
            case .success(let data):
                do {
                    let cities = try JSONDecoder().decode([String].self, from: data!)
                    if response.response?.statusCode == 200{
                        onCompletion(cities)
                    } else {
                        onCompletion(cities)
                    }
                } catch{
                    print(error)
                }
            case .failure(let err):
                print(err.localizedDescription)
                
            }
            
        }
    }
    
    func callingGroupsList(onCompletion: @escaping([Group]) -> ()){
        AF.request(groups_list_url, method: .get).response {
            response in
            
            debugPrint(response)
            
            switch response.result{
            case .success(let data):
                do {
                    let groups = try JSONDecoder().decode([Group].self, from: data!)
                    if response.response?.statusCode == 200{
                        onCompletion(groups)
                    }
                } catch{
                    print(error)
                }
            case .failure(let err):
                print(err.localizedDescription)
                
            }
            
        }
    }
    
    func callingCitiesWithPhoto(onCompletion: @escaping([City]) -> ()){
        AF.request(cities_withphoto_url, method: .get).response {
            response in
            
            debugPrint(response)
            
            switch response.result{
            case .success(let data):
                do {
                    let cities = try JSONDecoder().decode([City].self, from: data!)
                    if response.response?.statusCode == 200{
                        onCompletion(cities)
                    }
                } catch{
                    print(error)
                }
            case .failure(let err):
                print(err.localizedDescription)
                
            }
            
        }
    }
    
    func callingPlaces(city: String, onCompletion: @escaping([Place]) -> ()){
        
        let param: Parameters = [
            "city_name" : city
        ]
        
        AF.request(places_url, method: .get, parameters: param).response {
            response in
            
            debugPrint(response)
            
            switch response.result{
            case .success(let data):
                do {
                    let places = try JSONDecoder().decode([Place].self, from: data!)
                    if response.response?.statusCode == 200{
                        onCompletion(places)
                    }
                } catch{
                    print(error)
                }
            case .failure(let err):
                print(err.localizedDescription)
                
            }
            
        }
    }
    
    func callingPlaceDescription(placeName: String, onCompletion: @escaping(PlaceDescription) -> ()){
        
        let param: Parameters = [
            "place_name" : placeName
        ]
        
        AF.request(place_description_url, method: .get, parameters: param).response {
            response in
            
            debugPrint(response)
            
            switch response.result{
            case .success(let data):
                do {
                    let places = try JSONDecoder().decode(PlaceDescription.self, from: data!)
                    if response.response?.statusCode == 200{
                        onCompletion(places)
                    }
                } catch{
                    print(error)
                }
            case .failure(let err):
                print(err.localizedDescription)
                
            }
            
        }
    }
    
    func callingPlaceRoute(placeName: String, onCompletion: @escaping(PlaceRoute) -> ()){
        
        let param: Parameters = [
            "place_name" : placeName
        ]
        
        AF.request(place_route_url, method: .get, parameters: param).response {
            response in
            
            debugPrint(response)
            
            switch response.result{
            case .success(let data):
                do {
                    let places = try JSONDecoder().decode(PlaceRoute.self, from: data!)
                    if response.response?.statusCode == 200{
                        onCompletion(places)
                    }
                } catch{
                    print(error)
                }
            case .failure(let err):
                print(err.localizedDescription)
                
            }
            
        }
    }
    
    func callingGetToken(phone: String, onCompletion: @escaping(Bool, String) -> ()){
        let param: Parameters = [
            "phone_number" : phone
        ]
        
        AF.request(get_token_url, method: .get, parameters: param).response {
            (response) in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                do {
                    let token = try JSONDecoder().decode(String.self, from: data!)
                    if response.response?.statusCode == 200{
                        onCompletion(true, token)
                    } else {
                        onCompletion(false, token)
                    }
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
