//
//  MovieTableViewCell.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet var holdingView: UIView!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!

    static let identifier = "MovieTableViewCell"
    static var nib: UINib {
        UINib(nibName: identifier,
              bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// Private methods
private extension MovieTableViewCell {
    func setupUI() {
        holdingView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        holdingView.layer.cornerRadius = 8
        holdingView.clipsToBounds = true
        holdingView.backgroundColor = UIColor.lightGray
    }
}

// public methods
extension MovieTableViewCell {
    func configure(imageURLString: String?,
                   title: String?,
                   date: String?,
                   rating: String) {
        if let imageURLString = imageURLString {
            let imageURL = URL(string: imageURLString)
            posterImageView.setImage(from: imageURL)
        } else {
            posterImageView.image = UIImage(named: "ic_no_image")
        }
        titleLabel.text = title
        releaseDateLabel.text = date
        ratingLabel.text = rating
    }
}
