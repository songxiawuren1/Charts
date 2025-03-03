//
//  LineRadarRenderer.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

@objc(LineRadarChartRenderer)
open class LineRadarRenderer: LineScatterCandleRadarRenderer
{
    public override init(animator: Animator?, viewPortHandler: ViewPortHandler?)
    {
        super.init(animator: animator, viewPortHandler: viewPortHandler)
    }
    
    /// Draws the provided path in filled mode with the provided drawable.
    open func drawFilledPath(context: CGContext, path: CGPath, fill: Fill, fillAlpha: CGFloat)
    {
        guard let viewPortHandler = self.viewPortHandler
            else { return }
        
        context.saveGState()
        context.beginPath()
        context.addPath(path)
        
        // filled is usually drawn with less alpha
        context.setAlpha(fillAlpha)
        
        fill.fillPath(context: context, rect: fillClippingRect)
        
        context.restoreGState()
    }
    
    open var fillClippingRect: CGRect
    {
        var contentRect = viewPortHandler?.contentRect ?? CGRect.zero
        contentRect.origin.x = 0;
        contentRect.size.width = viewPortHandler?.screenWidth ?? 0.0
        return contentRect
    }
    
    
    
    /// Draws the provided path in filled mode with the provided color and alpha.
    open func drawFilledPath(context: CGContext, path: CGPath, fillColor: NSUIColor, fillAlpha: CGFloat)
    {
        context.saveGState()
        context.beginPath()
        context.addPath(path)
        
        // filled is usually drawn with less alpha
        context.setAlpha(fillAlpha)
        
        context.setFillColor(fillColor.cgColor)
        context.fillPath()
        
        context.restoreGState()
    }
}
