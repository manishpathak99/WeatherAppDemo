//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import UIKit

class WeatherListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: WeatherListPresenterProtocol?
    var weatherList: [WeatherList] = []
    
    var isLoading: Bool = false {
        didSet(value) {
            if value {
                self.hideLoading()
            }
        }
    }

    override func loadView() {
        super.loadView()
        setupTableView()
        setupSearchBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        title = Localization.weatherApp
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 200
//        tableView.rowHeight = UITableView.automaticDimension
        UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        registerCell()
    }
    
    private func setupSearchBar() {
        self.searchBar.delegate = self
        searchBar.layer.borderColor = searchBar.barTintColor?.cgColor
        // these 2 lines get rid of the 1 px line
        searchBar.backgroundColor = .white
        searchBar.backgroundImage = UIImage()

        // this line will let you color the searchBar textField where the user actually types
//        searchBar.searchTextField.backgroundColor = UIColor.lightGray
    }
    
    private func registerCell() {
        let filterNib = UINib(nibName: WeatherTableViewCell.identifier, bundle: nil)
        self.tableView.register(filterNib, forCellReuseIdentifier: WeatherTableViewCell.identifier)
    }
}

extension WeatherListViewController: WeatherListViewProtocol {
    func show(weatherModel: WeatherModel) {
        if let weatherList = weatherModel.weatherList {
            self.weatherList = weatherList
        }
//        weatherList.append(contentsOf: weatherList)
        tableView.reloadData()
        hideBottomLoader()
    }

    func showError() {
        view.removeLoader()
        hideBottomLoader()
        let alert = UIAlertController.make(title: Localization.error,
                                                     message: Localization.somethingWentWrong,
                                                     okTitle: Localization.ok)
        present(alert, animated: true, completion: nil)

    }
    
    func loadingState() -> Bool! {
        return isLoading
    }
    
    func setLoadingState(_ loading: Bool) {
        isLoading = loading
    }

    func showLoading() {
        view.showLoader()
    }

    func hideLoading() {
        view.removeLoader()
        hideBottomLoader()
    }

    func showNoInternet() {
        let alert = UIAlertController.make(title: Localization.noInternetConnection,
                                                     message: Localization.checkInternetConnection,
                                                     okTitle: Localization.ok)
        present(alert, animated: true, completion: nil)
    }
    
    func noMoreDataAvailable() {
        let alert = UIAlertController.make(title: "",
                                           message: Localization.noMoreDataAvailable,
                                           okTitle: Localization.ok)
        present(alert, animated: true, completion: nil)
    }
    
    func hideBottomLoader() {
        tableView.tableFooterView = UIView()
    }
    
    func showBottomLoader() {
        let activityView = UIActivityIndicatorView(frame: CGRect(x: Constants.AppUI.Indicator.x, y: Constants.AppUI.Indicator.y, width: Constants.AppUI.Indicator.width, height: Constants.AppUI.Indicator.height))
        activityView.style = .large 
        activityView.color = Constants.AppUI.Indicator.color
        activityView.startAnimating()
        tableView.tableFooterView = activityView
    }
}

extension WeatherListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let weatherCell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier) as? WeatherTableViewCell {
            if !weatherList.isEmpty {
                weatherCell.populate(weatherList: weatherList, indexPath: indexPath)
                cell = weatherCell
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        165
    }
}

extension WeatherListViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchedText = searchBar.text else { return }
        weatherList.removeAll()
        tableView.reloadData()
        hideBottomLoader()
        presenter?.retrieveWeatherData(onLaunch: true, searchedText: searchedText)
    }
}
