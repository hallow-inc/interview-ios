//
//  MonthView.swift
//  Interview
//
//  Created by Chris Anderson on 5/17/21.
//

import UIKit

// TODO: Finish the "render" method
class MonthView: UIStackView {

    init() {
        super.init(frame: .zero)
        self.configure()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }

    func render(month: Month) {
        let label = UILabel()
        label.text = month.monthString
        label.textAlignment = .center
        label.textColor = .label
        addArrangedSubview(label)

        // TODO: Create WeekView's for the given month
    }

    private func configure() {
        self.axis = .vertical
        self.spacing = 10
    }
}
