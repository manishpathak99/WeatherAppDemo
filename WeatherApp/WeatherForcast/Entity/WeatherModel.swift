struct WeatherModel: Codable {
    
//    let city : String?
    let cnt: Int?
    let cod: String?
    let weatherList: [WeatherList]?
    let message: Int?
    
    enum CodingKeys: String, CodingKey {
//        case city = "city"
        case cnt = "cnt"
        case cod = "cod"
        case weatherList = "list"
        case message = "message"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        city = try City(from: decoder)
        cnt = try values.decodeIfPresent(Int.self, forKey: .cnt)
        cod = try values.decodeIfPresent(String.self, forKey: .cod)
        weatherList = try values.decodeIfPresent([WeatherList].self, forKey: .weatherList)
        message = try values.decodeIfPresent(Int.self, forKey: .message)
    }
}

struct City: Codable {

    let coord: Coord?
    let country: String?
    let id: Int?
    let name: String?
    let population: Int?
    let sunrise: Int?
    let sunset: Int?
    let timezone: Int?

    enum CodingKeys: String, CodingKey {
        case coord = "coord"
        case country = "country"
        case id = "id"
        case name = "name"
        case population = "population"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case timezone = "timezone"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coord = try Coord(from: decoder)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        population = try values.decodeIfPresent(Int.self, forKey: .population)
        sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
        timezone = try values.decodeIfPresent(Int.self, forKey: .timezone)
    }

}
struct WeatherList: Codable {
    
    let clouds: Cloud?
    let dt: Int?
    let dtTxt: String?
    let main: Main?
    let pop: Float?
    let rain: Rain?
    let sys: Sy?
    let visibility: Int?
    let weather: [Weather]?
    let wind: Wind?

    enum CodingKeys: String, CodingKey {
        case clouds
        case dt = "dt"
        case dtTxt = "dt_txt"
        case main = "main"
        case pop = "pop"
        case rain = "rain"
        case sys = "sys"
        case visibility = "visibility"
        case weather = "weather"
        case wind = "wind"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        clouds = try Cloud(from: decoder)
        clouds = try values.decodeIfPresent(Cloud.self, forKey: .clouds)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        dtTxt = try values.decodeIfPresent(String.self, forKey: .dtTxt)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
//        main = try Main(from: decoder)
        pop = try values.decodeIfPresent(Float.self, forKey: .pop)
        rain = try values.decodeIfPresent(Rain.self, forKey: .rain)
        sys = try values.decodeIfPresent(Sy.self, forKey: .sys)
//        rain = try Rain(from: decoder)
//        sys = try Sy(from: decoder)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
//        wind = try Wind(from: decoder)
    }

}

struct Cloud: Codable {

    let all: Int?

    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        all = try values.decodeIfPresent(Int.self, forKey: .all)
    }

}

struct Main: Codable {
    let feelsLike: Float?
    let grndLevel: Int?
    let humidity: Int?
    let pressure: Int?
    let seaLevel: Int?
    let temp: Float?
    let tempKf: Float?
    let tempMax: Float?
    let tempMin: Float?

    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case grndLevel = "grnd_level"
        case humidity = "humidity"
        case pressure = "pressure"
        case seaLevel = "sea_level"
        case temp = "temp"
        case tempKf = "temp_kf"
        case tempMax = "temp_max"
        case tempMin = "temp_min"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feelsLike = try values.decodeIfPresent(Float.self, forKey: .feelsLike)
        grndLevel = try values.decodeIfPresent(Int.self, forKey: .grndLevel)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
        seaLevel = try values.decodeIfPresent(Int.self, forKey: .seaLevel)
        temp = try values.decodeIfPresent(Float.self, forKey: .temp)
        tempKf = try values.decodeIfPresent(Float.self, forKey: .tempKf)
        tempMax = try values.decodeIfPresent(Float.self, forKey: .tempMax)
        tempMin = try values.decodeIfPresent(Float.self, forKey: .tempMin)
    }
}

struct Rain: Codable {
    let hours: Float?

    enum CodingKeys: String, CodingKey {
        case hours = "3h"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hours = try values.decodeIfPresent(Float.self, forKey: .hours)
    }
}

struct Sy: Codable {
    let pod: String?
    enum CodingKeys: String, CodingKey {
        case pod = "pod"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pod = try values.decodeIfPresent(String.self, forKey: .pod)
    }
}

struct Weather: Codable {

    let descriptionField: String?
    let icon: String?
    let id: Int?
    let main: String?

    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case icon = "icon"
        case id = "id"
        case main = "main"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try values.decodeIfPresent(String.self, forKey: .main)
//        main = try Main(from: decoder)
//        main = try values.decodeIfPresent(Main.self, forKey: .main)
    }

}

struct Wind: Codable {

    let deg: Int?
    let gust: Float?
    let speedWind: Float?

    enum CodingKeys: String, CodingKey {
        case deg = "deg"
        case gust = "gust"
        case speedWind = "speed"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        deg = try values.decodeIfPresent(Int.self, forKey: .deg)
        gust = try values.decodeIfPresent(Float.self, forKey: .gust)
        speedWind = try values.decodeIfPresent(Float.self, forKey: .speedWind)
    }

}

struct Coord: Codable {

    let lat: Float?
    let lon: Float?

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        lon = try values.decodeIfPresent(Float.self, forKey: .lon)
    }

}
