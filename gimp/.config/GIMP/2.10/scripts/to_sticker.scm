(define (FU-to-sticker
        img
        drawable)

   (gimp-image-undo-group-start img)
   (plug-in-autocrop
    RUN-NONINTERACTIVE
    img
    drawable)

   ;; resize canvas to be 1:1 aspect ratio,
   ;; with just enough space for a border after resizing
   (let* ((cur-width  (car (gimp-image-width img)))
          (cur-height (car (gimp-image-height img)))
          (max-size (max cur-width cur-height))
          (factor (/  max-size 512))
          (new-size (+ max-size (* factor 8)))
          (x-offset (/ (- new-size cur-width) 2))
          (y-offset (/ (- new-size cur-height) 2)))
     (gimp-image-resize
      img
      new-size
      new-size
      x-offset
      y-offset))

   (gimp-image-scale img 512 512)
   ; create new layer, duplicating the old one
   (define border-layer (car (gimp-layer-copy drawable 0)))
   ; Give it a name
   (gimp-item-set-name border-layer "border")
   ; Add the new layer to the image
   (gimp-image-insert-layer img border-layer 0 1)
   ;; layer to image size
   (gimp-layer-resize-to-image-size border-layer)

   ;; alpha to selection
   (gimp-image-select-item img CHANNEL-OP-REPLACE border-layer)
   (gimp-selection-grow img 3)
   (gimp-edit-bucket-fill
    border-layer
    BUCKET-FILL-BG
    LAYER-MODE-NORMAL
    100
    0
    FALSE
    0
    0)

   (gimp-image-undo-group-end img)
   (gimp-displays-flush)   
)

(script-fu-register "FU-to-sticker"
    "<Image>/Script-Fu/to sticker"
    "create a 512x512 telegram sticker"
    "Sebastian Thümmel"
    "Sebastian Thümmel"
    "2022"
    "*"
    SF-IMAGE    "Image"         0
    SF-DRAWABLE "Current Layer" 0
)
