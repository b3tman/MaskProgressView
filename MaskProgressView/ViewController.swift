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

    private var viewWidth: CGFloat = 0.0 {
        didSet {
            progressWidth = viewWidth - (CGFloat(slider.value)*viewWidth)
        }
    }
    private var progressWidth: CGFloat = 0.0 {
        didSet {
            progressViewTrailingConstraint.constant = progressWidth
            backgroundProgressTrailingConstraint.constant = progressWidth
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewWidth = self.view.bounds.width

        slider.value = 0.0
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        progressWidth = viewWidth - (CGFloat(slider.value)*viewWidth)

        progressView.mask = maskLabel
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        viewWidth = size.width
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        progressWidth = viewWidth - (CGFloat(sender.value)*viewWidth)

        view.layoutIfNeeded()
    }
}
