//
//  SleepViewController.swift
//  DefinitelyNotAlarmy
//
//  Created by Vitor Jundi Moriya on 07/06/21.
//

import Foundation
import UIKit
//class SleepMusicViewController: UIViewController {
//    init() {
//        super.init(nibName: nil, bundle: nil)
//        self.view = SleepMusicsView()
//    }
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        setupNavigation()
//    }
//    func setupNavigation() {
//        navigationController?.isNavigationBarHidden = true
//    }
//}

class SleepMusicViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        self.view = SleepMusicsView()
    }
    func setupNavigation() {
        navigationController?.isNavigationBarHidden = true
    }
}
