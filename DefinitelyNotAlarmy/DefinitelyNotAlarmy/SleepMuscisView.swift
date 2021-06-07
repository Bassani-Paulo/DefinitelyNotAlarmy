//
//  SleepMusicsView.swift
//  DefinitelyNotAlarmy
//
//  Created by Caio Roberto Aceti on 07/06/21.
//

import UIKit
import AVFoundation

final class SleepMusicsView: UIView, UICollectionViewDelegate {

    private let musics: [Music] = [.init(name: "Random song", image: "bird", music: "firstsong", duration: "1:20:00"),
                                   .init(name: "Another song", image: "grass", music: "secondsong", duration: "1:00:00"),
                                   .init(name: "Some song", image: "flower", music: "firstsong", duration: "2:45:00"),
                                   .init(name: "One more song", image: "water", music: "secondsong", duration: "2:00:00"),
                                   .init(name: "How many songs?", image: "purple", music: "firstsong", duration: "1:30:00")]
    
    private var isPlayingSong = false
    
    init() {
        super.init(frame: .zero)
        buildView()
    }
    
    @available(*, unavailable)

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Sleep Music"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    private lazy var gridView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(MusicViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var selectedSongImage: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: musics[0].image))
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true

        return imageView
        
    }()
    
    private lazy var playerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private lazy var songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = musics[0].name
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        return label
    }()
    
    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = musics[0].duration
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    private lazy var playAndPauseView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "play"))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapPlayOrPause))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        return imageView
    }()
    
    @objc func tapPlayOrPause() {
        if isPlayingSong {
            isPlayingSong = false
            playAndPauseView.image = UIImage(named: "play")
        } else {
            isPlayingSong = true
            playAndPauseView.image = UIImage(named: "pause")
        }
    }
}

extension SleepMusicsView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(gridView)
        addSubview(selectedSongImage)
        addSubview(playerContainerView)
        addSubview(songNameLabel)
        addSubview(durationLabel)
        addSubview(playAndPauseView)
    }
    
    func setupConstraints() {
        titleLabel.constraint{ view in
            [view.topAnchor.constraint(equalTo: safeArea().topAnchor, constant: 30),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)]
        }
        
        gridView.constraint { view in
            [view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
             view.leadingAnchor.constraint(equalTo: safeArea().leadingAnchor, constant: 10),
             view.trailingAnchor.constraint(equalTo: safeArea().trailingAnchor),
             view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)]
        }
        
        selectedSongImage.constraint { view in
            [view.leadingAnchor.constraint(equalTo: gridView.leadingAnchor),
             view.bottomAnchor.constraint(equalTo: safeArea().bottomAnchor, constant: -16),
             view.heightAnchor.constraint(equalToConstant: 90),
             view.widthAnchor.constraint(equalToConstant: 100)]
        }
        
        playerContainerView.constraint { view in
            [view.leadingAnchor.constraint(equalTo: selectedSongImage.trailingAnchor, constant: -10),
             view.trailingAnchor.constraint(equalTo: gridView.trailingAnchor, constant: -8),
             view.bottomAnchor.constraint(equalTo: safeArea().bottomAnchor, constant: -16),
             view.heightAnchor.constraint(equalToConstant: 90)]
        }
        
        songNameLabel.constraint { view in
            [view.leadingAnchor.constraint(equalTo: selectedSongImage.trailingAnchor, constant: 4),
             view.topAnchor.constraint(equalTo: playerContainerView.topAnchor, constant: 16)]
        }
        
        durationLabel.constraint { view in
            [view.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
             view.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 5)]
        }
    
        playAndPauseView.constraint { view in
            [view.centerYAnchor.constraint(equalTo: playerContainerView.centerYAnchor),
             view.trailingAnchor.constraint(equalTo: playerContainerView.trailingAnchor, constant: -16),
             view.widthAnchor.constraint(equalToConstant: 40),
             view.heightAnchor.constraint(equalToConstant: 40)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = UIColor(red: 26/255, green: 41/255, blue: 50/255, alpha: 1)
    }
}

extension SleepMusicsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicViewCell
        cell.configure(with: musics[Int.random(in: 0...4)])
        return cell
    }
}

extension SleepMusicsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 5.0, bottom: 1.0, right: 5.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MusicViewCell
        selectedSongImage.image = UIImage(named: cell.song?.image ?? "bird")
        songNameLabel.text = cell.song?.name
        durationLabel.text = cell.song?.duration
        playSound(songUrl: cell.song?.music ?? "")
    }
    
    private func playSound(songUrl: String) {
        var player: AVAudioPlayer!

        guard let url = Bundle.main.url(forResource: songUrl, withExtension: "mp3") else {
            print("url not found")
            return
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
}
