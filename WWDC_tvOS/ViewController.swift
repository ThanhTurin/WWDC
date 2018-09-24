//
//  ViewController.swift
//  WWDC_tvOS
//
//  Copyright © 2018 Thanh Turin. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

  private lazy var dataSource: VideoDataSource = {
    return VideoDataSource(delegate: self)
  }()

  private lazy var collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.minimumInteritemSpacing = 60
    flowLayout.minimumLineSpacing = 60

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.contentInset = UIEdgeInsets(top: 60, left: 40, bottom: 60, right: 40)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = UIColor.white
    collectionView.alwaysBounceVertical = true

    collectionView.dataSource = dataSource
    collectionView.delegate = dataSource
    return collectionView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupDataSource()
  }

  private func setupDataSource() {
    dataSource.registerCells(for: collectionView)
    dataSource.fetchData()
  }

  private func registerCollectionView() {
    dataSource.registerCells(for: collectionView)
  }

  private func setupView() {
    view.addSubview(collectionView)

    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }

  private func playVideo(_ video: Video) {
    guard let videoURL = URL(string: video.mediaURLString) else {
      return
    }

    let playerViewController = AVPlayerViewController()
    playerViewController.player = AVPlayer(url: videoURL)

    present(playerViewController, animated: true) {
      playerViewController.player?.play()
    }
  }

}

extension ViewController: VideoDataSourceDelegate {
  func videoDataSource(_ dataSource: VideoDataSource, didRetrivedData videos: [Video]) {
    collectionView.reloadData()
  }

  func videoDataSource(_ dataSource: VideoDataSource, didSelect video: Video) {
    playVideo(video)
  }

  func videoDataSource(_ dataSource: VideoDataSource, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = (collectionView.frame.size.height - 180) / 2.0
    let cellLabelsHeights: CGFloat = 170
    let width = (height - cellLabelsHeights) * 16.0 / 9.0
    return CGSize(width: width, height: height)
  }

}
