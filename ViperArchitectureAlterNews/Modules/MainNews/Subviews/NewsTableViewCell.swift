//
//  NewsTableViewCell.swift
//  ViperArchitectureAlterNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 02/10/23.
//

import UIKit
import Kingfisher

final class NewsTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: NewsTableViewCell.self)
    
    lazy private var views: [UIView] = [
        newsCoverImage,
        newsTitle,
        newsDescription,
        newsContent
    ]
    
    lazy private var newsCoverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy private var newsTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .bold, width: .condensed)
        return label
    }()
    
    lazy private var newsDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .semibold, width: .condensed)
        label.textColor = .darkGray
        return label
    }()
    
    lazy private var newsContent: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular, width: .condensed)
        label.textColor = .black
        label.baselineAdjustment = .alignBaselines
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        newsCoverImage.image = nil
        newsTitle.text = nil
        newsDescription.text = nil
        newsContent.text = nil
    }
    
    private func setupViews() {
        views.forEach { view in
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            newsCoverImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            newsCoverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            newsCoverImage.heightAnchor.constraint(equalToConstant: 180),
            newsCoverImage.widthAnchor.constraint(equalToConstant: 120),
            newsCoverImage.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20),
            
            newsTitle.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            newsTitle.leadingAnchor.constraint(equalTo: newsCoverImage.trailingAnchor, constant: 8),
            newsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            newsDescription.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 4),
            newsDescription.leadingAnchor.constraint(equalTo: newsCoverImage.trailingAnchor, constant: 8),
            newsDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            newsContent.topAnchor.constraint(equalTo: newsDescription.bottomAnchor, constant: 4),
            newsContent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            newsContent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            newsContent.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
            
            
        ])
    }
    
    func configure(newsViewModel: NewsViewModel) {
        DispatchQueue.main.async {
            self.newsCoverImage.kf.setImage(with: newsViewModel.imageURL)
            self.newsTitle.text = newsViewModel.title
            self.newsDescription.text = newsViewModel.description
            self.newsContent.text = newsViewModel.content
        }
    }
    
    
}
