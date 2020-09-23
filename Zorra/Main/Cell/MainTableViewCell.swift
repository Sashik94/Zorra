//
//  MainTableViewCell.swift
//  Zorra
//
//  Created by Александр Осипов on 22.09.2020.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var mainImageView = UIImageView()
    var nameLabel = UILabel()
    
    func configureCell(from model: Model) {
        DispatchQueue.main.async {
            if let imageUrlString = model.imageUrl {
                self.mainImageView.sd_setImage(with: URL(string: imageUrlString), completed: nil)
            }
            self.nameLabel.text = model.name
            self.nameLabel.font = UIFont.boldSystemFont(ofSize: 21)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(mainImageView)
        addSubview(nameLabel)
        accessoryType = .disclosureIndicator
        
        configureMainImageView()
        configureName()
        setMainImageViewConstraints()
        setNameLabelConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImageView.image = nil
    }
    
    func configureMainImageView() {
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFit
    }
    
    func configureName() {
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setMainImageViewConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.width / 2.4).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: mainImageView.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.width / 2.4).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
}
