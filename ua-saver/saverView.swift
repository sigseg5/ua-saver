//
//  saverView.swift
//  ua-saver
//
//  Created by sigseg5 on 05/04/2022.
//

import ScreenSaver

class saverView: ScreenSaverView {
    
    private var iter = 0;

    // MARK: - Initialization
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
    }

    @available(*, unavailable)
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func draw(_ rect: NSRect) {
        switch iter % 2 == 0{
        case true:
            drawBackground(.white)
        case false:
            drawBackground(.red)
        }
    }

    override func animateOneFrame() {
        super.animateOneFrame()
        sleep(1)

        setNeedsDisplay(bounds)
    }

    // MARK: - Helper Functions
    private func drawBackground(_ color: NSColor) {
        let background = NSBezierPath(rect: bounds)
        color.setFill()
        background.fill()
        iter += 1
    }
}
