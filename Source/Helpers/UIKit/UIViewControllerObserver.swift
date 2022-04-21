// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import UIKit

public class UIViewControllerObserver: UIViewController {

    public var onViewDidLoad: (() -> Void)?
    public var onViewWillAppear: (() -> Void)?
    public var onViewDidAppear: (() -> Void)?
    public var onViewWillDisappear: (() -> Void)?
    public var onViewDidDisappear: (() -> Void)?

    public private(set) var hasViewAppeared = false
    public private(set) var hasViewDisappeared = false

    public override func loadView() {
        super.loadView()
        view.backgroundColor = .clear
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad?()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onViewWillAppear?()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hasViewAppeared = true
        onViewDidAppear?()
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        onViewWillDisappear?()
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        hasViewDisappeared = true
        onViewDidDisappear?()
    }
}
