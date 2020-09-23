//
//  MainViewController.swift
//  Zorra
//
//  Created by Александр Осипов on 22.09.2020.
//

import UIKit
import SDWebImage

protocol MainViewControllerProtocol: class {
    func displayData(result: ResultsType)
}

class MainViewController: UIViewController, MainViewControllerProtocol, UIGestureRecognizerDelegate {
    
    var tableView = UITableView()
    
    var interactor: MainInteractorProtocol?
    var presenter: MainPresenterProtocol?
    var router: MainRouterProtocol?
    
    private var models: [Model] = []
    private var page: Int = 1
    
    private func setup() {
        let viewController        = self
        let interactor            = MainInteractor()
        let presenter             = MainPresenter()
        let router                = MainRouter()
        viewController.interactor = interactor
        viewController.presenter  = presenter
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
//        router.dataStore          = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        interactor?.makeRequest(page: page)
        configureTableView()
        
    }
    
    let myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    @objc private func refresh(sender: UIRefreshControl) {
        models.removeAll()
        page = 1
        interactor?.makeRequest(page: page)
        sender.endRefreshing()
    }
    
    func configureTableView() {
        title = "Beer"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainCell")
        tableView.rowHeight = view.bounds.width / 2.4
        view.addSubview(tableView)
        tableView.pin(to: view)
        tableView.refreshControl = myRefreshControl
    }
    
    func displayData(result: ResultsType) {
        switch result {
        case .success(let models):
            DispatchQueue.main.async {
                for model in models {
                    self.models.append(model)
                }
                self.tableView.reloadData()
            }
        case .failure(let error):
            DispatchQueue.main.async {
                self.errorAlert(with: error)
            }
        }
    }
    
    func errorAlert(with title: String) {
        let alertController = UIAlertController(title: title, message: "Повторите попытку.", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Закрыть", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
          exit(0)
        })
        let tryAgainAction = UIAlertAction(title: "Повторить", style: .default) { [weak self] (_) in
            guard let self = self else { return }
            self.interactor?.makeRequest(page: self.page)
        }
        
        alertController.addAction(tryAgainAction)
        alertController.addAction(closeAction)
        
        present(alertController, animated: true)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        
        let model = models[indexPath.row]
        
        cell.configureCell(from: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.showDescription(with: models[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = models.count
        if indexPath.row == (count - 1) && count >= 80 {
            page += 1
            interactor?.makeRequest(page: page)
        }
    }
    
}
