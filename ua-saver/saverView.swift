//
//  saverView.swift
//  ua-saver
//
//  Created by sigseg5 on 05/04/2022.
//

import ScreenSaver

class SaverView: ScreenSaverView {
    private let delay = 0.000008
    private var opacity = 0.0
    private var screenWidth: CGFloat = 0.0
    private var halfScreenHeight: CGFloat = 0.0

    // MARK: - Initialization
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        screenWidth = frame.width
        halfScreenHeight = frame.height / 2
    }

    @available(*, unavailable)
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func draw(_ rect: NSRect) {
        drawBackground(.black)
        drawTopPart(with: .yellow, opacity: opacity)
        drawBottomPart(with: .blue, opacity: opacity)
    }

    override func animateOneFrame() {
        super.startAnimation()
        if opacity <= 1.0 {
            opacity += delay
        }
        setNeedsDisplay(bounds)
    }

    // MARK: - Helper Functions
    private func drawBottomPart(with color: NSColor, opacity: CGFloat) {
        let bottomHalf = NSRect(x: 0, y: halfScreenHeight, width: screenWidth, height: halfScreenHeight)
        let screen = NSBezierPath(rect: bottomHalf)
        color
            .withAlphaComponent(opacity)
            .setFill()
        screen.fill()
    }
    private func drawTopPart(with color: NSColor, opacity: CGFloat) {
        let topHalf = NSRect(x: 0, y: 0, width: screenWidth, height: halfScreenHeight)
        let screen = NSBezierPath(rect: topHalf)
        color
            .withAlphaComponent(opacity)
            .setFill()
        screen.fill()
    }
    private func drawBackground(_ color: NSColor) {
        let background = NSBezierPath(rect: bounds)
        color.setFill()
        background.fill()
    }
}
