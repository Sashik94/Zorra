//
//  DescriptionViewController.swift
//  Zorra
//
//  Created by Александр Осипов on 23.09.2020.
//

import Foundation

import UIKit
import SDWebImage

protocol DescriptionViewControllerProtocol: class {
    
}

class DescriptionViewController: UIViewController, DescriptionViewControllerProtocol  {
    
    var bearImageView = UIImageView()
    var nameLabel = UILabel()
    var descriptionLabel = UILabel()
    
    var interactor: DescriptionInteractorProtocol?
    var router: DescriptionRouterProtocol?
    
    var model = Model()
    
    private func setup() {
        let viewController        = self
        let interactor            = DescriptionInteractor()
        let presenter             = DescriptionPresenter()
        let router                = DescriptionRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        displayData(model: model)
        configureView()
        
    }
    
    func displayData(model: Model) {
        DispatchQueue.main.async {
            if let imageUrlString = model.imageUrl {
                self.bearImageView.sd_setImage(with: URL(string: imageUrlString), completed: nil)
            }
            self.nameLabel.text = model.name
            self.nameLabel.font = UIFont.boldSystemFont(ofSize: 30)
            self.descriptionLabel.text = model.description
        }
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
        title = model.name
        view.addSubview(bearImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        
        configureBearImageView()
        configureNameLabel()
        configureDescriptionLabel()
        
        setbearImageViewConstraints()
        setNameLabelConstraints()
        setDescriptionLabelConstraints()
    }
    
    func configureBearImageView() {
        bearImageView.clipsToBounds = true
        bearImageView.contentMode = .scaleAspectFit
    }
    
    func configureNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setbearImageViewConstraints() {
        bearImageView.translatesAutoresizingMaskIntoConstraints = false
        bearImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        bearImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: view.bounds.width / 1.5).isActive = true
        bearImageView.widthAnchor.constraint(equalTo: bearImageView.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: bearImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: view.bounds.width / 1.5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }
    
}

