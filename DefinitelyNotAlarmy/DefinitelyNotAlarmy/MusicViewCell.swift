//
//  MusicView.swift
//  DefinitelyNotAlarmy
//
//  Created by Caio Roberto Aceti on 04/06/21.
//

import UIKit
import AVFoundation

final class MusicViewCell: UICollectionViewCell {

    
    private var songUrl: String = ""
    var song: Music?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildView()
    }
    
    @available(*, unavailable)

    required init?(coder: NSCoder) { nil }
    

    private lazy var musicImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bird"))
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true

        return imageView
    }()

    private lazy var musicNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        return label
    }()
    
    func configure(with music: Music) {
        musicNameLabel.text = music.name
        musicImageView.image = UIImage(named: music.image)
        song = music
        songUrl = music.music
    }
}

extension MusicViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(musicImageView)
        addSubview(musicNameLabel)
    }
    
    func setupConstraints() {
        musicImageView.constraint{ view in
            [view.topAnchor.constraint(equalTo: topAnchor),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.widthAnchor.constraint(equalToConstant: 160),
             view.heightAnchor.constraint(equalToConstant: 160)]
        }
        
        musicNameLabel.constraint { view in
            [view.leadingAnchor.constraint(equalTo: musicImageView.leadingAnchor),
             view.topAnchor.constraint(equalTo: musicImageView.bottomAnchor, constant: 12)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = .clear
    }
}
