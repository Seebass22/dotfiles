(define (FU-expand-canvas
         img
         drawable)

  (gimp-image-undo-group-start img)
  (gimp-image-resize
   img
   4096
   4096
   0
   0)
  (gimp-image-undo-group-end img)
  (gimp-displays-flush))

(script-fu-register "FU-expand-canvas"
    "<Image>/Script-Fu/expand canvas"
    "expand canvas"
    "Sebastian Thümmel"
    "Sebastian Thümmel"
    "2022"
    "*"
    SF-IMAGE    "Image"         0
    SF-DRAWABLE "Current Layer" 0
)
