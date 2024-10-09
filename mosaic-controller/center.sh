#! /bin/bash

# obtiene las resoluciones de la pantalla actual
resolution=$(xrandr | grep '*' | awk '{print $1}')

# elimina el sufijos con el parametro dado % (en este caso la x y despues de esta)
width=${resolution%x*}
# elimina el prefijo con el parametro dado # (en este caso la x y todo lo anterior)
height=${resolution#*x}

halfY=$((height / 2))
centerY=$((halfY - halfY / 2 - 200))

halfX=$((width / 2))
centerX=$((halfX - halfX / 2 - 200))

wmctrl -r :ACTIVE: -b remove,maximized_horz,maximized_vert
wmctrl -r :ACTIVE: -e 0,$centerX,$centerY,$((width / 2 + 400)),$((height / 2 + 400))
