//
//  ViewController.swift
//  MVVMContainer
//
//  Created by Omkar khedekar on 26/09/18.
//  Copyright © 2018 Omkar khedekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageDecription: UITextView!
    @IBOutlet var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchImageOfDay { [weak self] result in
            switch result {
            case .success(let pic):
                DispatchQueue.main.async {
                    self?.imageDecription.text = pic.explanation
                    self?.picTitle.text = "\(pic.title)\n@\(pic.date)"
                }

                guard let hdURL = URL(string: pic.hdurl) else { return }
                DispatchQueue.global().async {
                    do {
                        let data =  try Data(contentsOf: hdURL)
                        DispatchQueue.main.async {
                            self?.imageView.image = UIImage(data: data)
                        }
                    } catch {
                        print(error)
                    }
                }
            case .failed:
                print(result)
            }
        }
    }
}

