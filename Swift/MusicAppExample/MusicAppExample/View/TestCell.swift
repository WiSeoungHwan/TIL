//
//  TestCell.swift
//  MusicAppExample
//
//  Created by Wi on 16/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import FoldingCell

class TestCell: FoldingCell {
    
    // MARK: - Properties
    
    var track: Track? {
        didSet {
            guard let track = self.track else {return}
            self.albumImageView.loadImage(with: track.artworkUrl100)
            self.detailAlbumImageView.loadImage(with: track.artworkUrl100)
            self.trackNameLabel.text = track.trackName
            self.artistNameLabel.text = track.artistName
            self.albumNameLabel.text = track.collectionName
            self.collectionPriceLabel.text = "$ \(track.collectionPrice)"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            guard let date = dateFormatter.date(from: track.releaseDate) else {print("asdf");return}
            dateFormatter.dateStyle = .medium
            self.releaseDateLabel.text = "\(dateFormatter.string(from: date))"
        }
    }
    
    var delegate: TestCellDelegate?
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var detailAlbumImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var collectionPriceLabel: UILabel!
    @IBOutlet weak var xButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.foregroundView.layer.cornerRadius = 5
        self.containerView.layer.cornerRadius = 5
        albumImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(albumImageViewDidTap)))
        albumImageView.isUserInteractionEnabled = true
        
        detailAlbumImageView.layer.cornerRadius = 5
        
        xButton.layer.cornerRadius = 15
        // shadow
        
        detailAlbumImageView.layer.shadowColor = UIColor.blue.cgColor
        detailAlbumImageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        detailAlbumImageView.layer.shadowRadius = 10
        detailAlbumImageView.layer.shadowOpacity = 0.4
        detailAlbumImageView.layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: detailAlbumImageView.bounds.width + 10, height: detailAlbumImageView.bounds.height)).cgPath
        detailAlbumImageView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
        let duration = [0.25,0.3,0.2]
        return duration[itemIndex]
    }
    
    
    // MARK: - Handler
    
    @objc private func albumImageViewDidTap(){
        delegate?.albumImageViewDidTap(cell: self)
    }
    
    @IBAction func xButtonDidTap(_ sender: Any) {
        delegate?.albumImageViewDidTap(cell: self)
    }
}
