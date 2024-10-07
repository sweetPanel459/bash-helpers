#! /bin/bash

# obtiene las resoluciones de la pantalla actual
resolution=$(xrandr | grep '*' | awk '{print $1}')

# elimina el sufijos con el parametro dado % (en este caso la x y despues de esta)
width=${resolution%x*}
# elimina el prefijo con el parametro dado # (en este caso la x y todo lo anterior)
height=${resolution#*x}

wmctrl -r :ACTIVE: -b remove,maximized_vert
wmctrl -r :ACTIVE: -b add,0,maximized_horz
wmctrl -r :ACTIVE: -e 0,0,0,0,$((height / 2))
