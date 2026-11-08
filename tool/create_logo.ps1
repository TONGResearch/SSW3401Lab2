# Creates the local travel logo used in the Flutter AssetImage example.
Add-Type -AssemblyName System.Drawing

$size = 512
$bitmap = [System.Drawing.Bitmap]::new($size, $size)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.Clear([System.Drawing.Color]::Transparent)

$sky = [System.Drawing.Color]::FromArgb(255, 74, 187, 224)
$teal = [System.Drawing.Color]::FromArgb(255, 29, 151, 163)
$light = [System.Drawing.Color]::FromArgb(255, 210, 245, 244)
$soft = [System.Drawing.Color]::FromArgb(255, 227, 246, 250)

$arcPen = [System.Drawing.Pen]::new($sky, 15)
$arcPen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
$arcPen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
$graphics.DrawArc($arcPen, 96, 64, 320, 310, 205, 110)
$graphics.DrawArc($arcPen, 112, 151, 296, 282, 5, 110)

$trailPen = [System.Drawing.Pen]::new($light, 19)
$trailPen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
$trailPen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
$graphics.DrawBezier($trailPen, 164, 418, 210, 380, 210, 352, 253, 336)

$wing = [System.Drawing.Drawing2D.GraphicsPath]::new()
$wingPoints = [System.Drawing.Point[]]@(
  [System.Drawing.Point]::new(256, 152),
  [System.Drawing.Point]::new(216, 255),
  [System.Drawing.Point]::new(125, 281),
  [System.Drawing.Point]::new(125, 321),
  [System.Drawing.Point]::new(244, 295),
  [System.Drawing.Point]::new(256, 327),
  [System.Drawing.Point]::new(268, 295),
  [System.Drawing.Point]::new(387, 321),
  [System.Drawing.Point]::new(387, 281),
  [System.Drawing.Point]::new(296, 255)
)
$wing.AddPolygon($wingPoints)
$graphics.FillPath([System.Drawing.SolidBrush]::new($soft), $wing)
$outline = [System.Drawing.Pen]::new($teal, 18)
$outline.LineJoin = [System.Drawing.Drawing2D.LineJoin]::Round
$graphics.DrawPath($outline, $wing)

$bodyPen = [System.Drawing.Pen]::new($teal, 24)
$bodyPen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
$bodyPen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
$graphics.DrawLine($bodyPen, 256, 126, 256, 395)
$graphics.DrawLine($bodyPen, 256, 346, 194, 388)
$graphics.DrawLine($bodyPen, 256, 346, 318, 388)

$outputPath = Join-Path (Split-Path -Parent $PSScriptRoot) 'assets\images\logo.png'
New-Item -ItemType Directory -Force -Path (Split-Path -Parent $outputPath) | Out-Null
$bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$bodyPen.Dispose()
$outline.Dispose()
$wing.Dispose()
$trailPen.Dispose()
$arcPen.Dispose()
$graphics.Dispose()
$bitmap.Dispose()
