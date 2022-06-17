//
//  saverView.swift
//  ua-saver
//
//  Created by sigseg5 on 05/04/2022.
//
// Build artefacts at /Users/<user>/Library/Developer/Xcode/DerivedData/ua-saver-*/Build/Products/Debug/ua-saver.saver

import ScreenSaver

class SaverView: ScreenSaverView {
    private var count = 0
    private var reverse = false
    private var opacity = 0.0
    private let delay = 0.000004
    private let iterCount = 167_000
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
        drawTopPart(with: .yellow, opacity: opacity)
        drawBottomPart(with: .blue, opacity: opacity)
    }

    override func animateOneFrame() {
        super.startAnimation()
        if reverse == false {
            opacity += delay
            count += 1
            if count > iterCount {
                reverse = true
                sleep(5)
            }
        } else {
            if count == 0 {
                reverse = false
                sleep(2)
            } else {
                opacity -= delay
                count -= 1
            }
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
}
