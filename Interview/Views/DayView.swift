//
//  DayView.swift
//  Interview
//
//  Created by Chris Anderson on 5/17/21.
//

import UIKit

class DayView: UIView {

    private static let smallSize: CGFloat = 10
    private static let largeSize: CGFloat = 30

    private let circleView = UIView()
    private let streakView = UIView()

    private let day: Day?
    init(day: Day?) {
        self.day = day
        super.init(frame: .zero)
        configure()
        constrain()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        circleView.layer.masksToBounds = true

        translatesAutoresizingMaskIntoConstraints = false
        circleView.translatesAutoresizingMaskIntoConstraints = false
        streakView.translatesAutoresizingMaskIntoConstraints = false

        configureColors()
    }

    private func configureColors() {
        guard let day = day else { return circleView.backgroundColor = .clear }

        let color: UIColor
        if day.hasSession { color = .green }
        else { color = .grey }

        circleView.backgroundColor = color
        streakView.backgroundColor = color
    }

    private func constrain() {
        addSubview(circleView)

        let size = day?.hasSession == true ? Self.largeSize : Self.smallSize
        var constraints: [NSLayoutConstraint] = [
            heightAnchor.constraint(equalToConstant: Self.largeSize + 10),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.widthAnchor.constraint(equalToConstant: size),
            circleView.heightAnchor.constraint(equalToConstant: size),
        ]

        if let streak = day?.streak {
            addSubview(streakView)
            constraints.append(streakView.heightAnchor.constraint(equalToConstant: Self.largeSize))
            constraints.append(streakView.centerYAnchor.constraint(equalTo: centerYAnchor))

            switch streak {
            case .start:
                constraints.append(streakView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5))
                constraints.append(streakView.rightAnchor.constraint(equalTo: rightAnchor))
            case .middle:
                constraints.append(streakView.widthAnchor.constraint(equalTo: widthAnchor))
                constraints.append(streakView.leftAnchor.constraint(equalTo: leftAnchor))
            case .end:
                constraints.append(streakView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5))
                constraints.append(streakView.leftAnchor.constraint(equalTo: leftAnchor))
            }
        }

        NSLayoutConstraint.activate(constraints)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.layer.cornerRadius = circleView.frame.height / 2
    }
}
