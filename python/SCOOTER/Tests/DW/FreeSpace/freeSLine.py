#==================================================================
#  
#  SCOOTER: Free space, line source
#  Mexilhoeira Grande, Sab Jul 29 09:10:00 WEST 2017
#  Written by Tordar
#  
#==================================================================

# ipython: run freeSLine

from os import *
import sys
from numpy import *
from scipy.io import *
from pylab import *
sys.path.append ("/home/orodrig/FORdoc/at/Python/")
from readshd import *

rs = 0.0

print("SCOOTER - Free space, line source")

system("scooter.exe freeSLine")
system("fields.exe freeSLine < freeSLine.flp")

filename = 'freeSLine.shd'
xs = nan
ys = nan
pressure,geometry = readshd(filename,xs,ys)

zs     = geometry["zs"]
rarray = geometry["rarray"]; rarraykm = rarray/1000
zarray = geometry["zarray"]

Dmax = zarray[-1]
rmax = rarray[-1]; rmaxkm = rmax/1000

p = squeeze( pressure, axis=(0,1) )
tl = -20*log10( abs( p ) )

figure(1)
imshow(tl,extent=[0,rmaxkm,0,Dmax],aspect='auto',cmap='jet_r',origin='lower',vmin=10,vmax=20)
cb = colorbar()
cb.ax.invert_yaxis()
plot(rs,-zs,marker="<",markersize=16,color="k")
xlabel('Range (km)')
ylabel('Depth (m)')
title('SCOOTER - Free space, line source')
ylim(Dmax,0)

show()

print("done.")
