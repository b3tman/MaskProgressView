//
//  ViewController.swift
//  TestMasks
//
//  Created by Maxim Brishten on 24.01.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var originalLabel: UILabel!
    @IBOutlet weak var maskLabel: UILabel!

    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressViewTrailingConstraint: NSLayoutConstraint!

    @IBOutlet weak var backgroundProgressView: UIView!
    @IBOutlet weak var backgroundProgressTrailingConstraint: NSLayoutConstraint!

    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        slider.minimumValue = 0.0
        slider.maximumValue = Float(self.view.frame.width)

        progressViewTrailingConstraint.constant = view.frame.width
        backgroundProgressTrailingConstraint.constant = view.frame.width

        progressView.mask = maskLabel
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)

        let progressWidth = view.frame.width - CGFloat(sender.value)

        progressViewTrailingConstraint.constant = progressWidth
        backgroundProgressTrailingConstraint.constant = progressWidth

        view.layoutIfNeeded()
    }
}
