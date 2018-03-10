#==================================================================
#  
#  SCOOTER: Fluid sediment manual case
#  Mexilhoeira Grande, Sab Jul 29 10:22:48 WEST 2017
#  Written by Tordar
#  
#==================================================================

# ipython: run flused

from os import *
import sys
from numpy import *
from scipy.io import *
from pylab import *
sys.path.append ("/home/orodrig/FORdoc/at/Python/")
from readshd import *

rs = 0.0

print("SCOOTER - Fluid sediment manual case")

system("scooter.exe flused")
system("fields.exe flused < flused.flp")

filename = 'flused.shd'
xs = nan
ys = nan
pressure,geometry = readshd(filename,xs,ys)

zs     = geometry["zs"]
rarray = geometry["rarray"]; rarraykm = rarray/1000
zarray = geometry["zarray"]

Dmax = zarray[-1]
rmax = rarray[-1]; rmaxkm = rmax/1000

p = squeeze( pressure )
tl = -20*log10( abs( p ) )
tlmin = min( tl )
tlmax = max( tl )

figure(1)
plot(rarraykm,tl)
xlabel('Range (km)')
ylabel('TL (dB)')
title('SCOOTER - Fluid sediment manual case')
ylim(tlmax,tlmin)
grid(True)

show()

print("done.")
