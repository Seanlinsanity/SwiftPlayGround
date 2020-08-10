import UIKit

struct Line {
    var color: CGColor
    var width: CGFloat
    var points: [CGPoint]
}

class Canvas: UIView {
    private var lines = [Line(color: UIColor.red.cgColor, width: 1, points: [CGPoint(x: 50, y: 50), CGPoint(x: 600, y: 800)])]
    private var strokeColor: UIColor = .black
    private var strokeWidth: CGFloat = 1
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineCap(.round)

        lines.forEach { (line) in
            for (index, p) in line.points.enumerated() {
                context.setStrokeColor(line.color)
                context.setLineWidth(line.width)
                
                if index == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
        
    }
}


let view = Canvas()
view.frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
view.backgroundColor = .white
