# window and document holders
$win = $(window)
$doc = $(document)

# our current size
width = 1000
height = 600

# canvas holder
$fg = undefined

# define better animaiton loop
requestFrame =
  window.requestAnimationFrame or
  window.webkitRequestAnimationFrame or
  window.mozRequestAnimationFrame or
  window.oRequestAnimationFrame or
  window.msRequestAnimationFrame or
  (cb) -> window.setTimeout(cb, 1000/60)

resize = ->
  # resize the canvas to match window
  width = $win.width()
  height = $win.height()
  $fg.attr "width", width
  $fg.attr "height", height

draw = ->
  # get canvas
  fg_canvas = $fg[0]
  # fast clear
  resize()
  # get context
  ctx = fg_canvas.getContext('2d')
  # draw some thing
  ctx.fillStyle = "white"
  ctx.fillRect(100,100,100,100)
  # request frame
  requestFrame(draw)

# init function
$ ->
  $fg = $('#fg')
  draw()  