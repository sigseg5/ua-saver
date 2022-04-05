//
//  saverView.swift
//  ua-saver
//
//  Created by sigseg5 on 05/04/2022.
//

import ScreenSaver

class SaverView: ScreenSaverView {
    private var iter: UInt32 = 0
    private var screenWidth: CGFloat = 0
    private var halfScreenHeight: CGFloat = 0

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
        switch iter % 2 == 0 {
        case true:
            drawBackground(with: .yellow, with: .blue)
        case false:
            drawBackground(with: .blue, with: .yellow)
        }
    }

    override func animateOneFrame() {
        super.animateOneFrame()
        sleep(1)

        setNeedsDisplay(bounds)
    }

    // MARK: - Helper Functions
    private func drawBackground(with fColor: NSColor, with sColor: NSColor) {
        let topHalf = NSRect(x: 0, y: 0, width: screenWidth, height: halfScreenHeight)
        let bottomHalf = NSRect(x: 0, y: halfScreenHeight, width: screenWidth, height: halfScreenHeight)
        var screen = NSBezierPath(rect: topHalf)
        fColor.setFill()
        screen.fill()
        screen = NSBezierPath(rect: bottomHalf)
        sColor.setFill()
        screen.fill()
        iter += 1
    }
}
