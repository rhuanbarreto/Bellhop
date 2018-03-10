#==================================================================
#  
#  KRAKEN: Top roughness manual case
#  Mexilhoeira Grande, Sab Jul 29 10:28:28 WEST 2017
#  Written by Tordar
#  
#==================================================================

# ipython: run kupert

from os import *
import sys
from numpy import *
from scipy.io import *
from pylab import *
sys.path.append ("/home/orodrig/FORdoc/at/Python/")
from readshd import *

rs = 0.0

print("KRAKEN - Top roughness manual case")

system("kraken.exe kupert")
system("fields.exe kupert < kupert.flp")

filename = 'kupert.shd'
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
title('KRAKEN - Top roughness manual case')
ylim(tlmax,tlmin)
grid(True)

show()

print("done.")
