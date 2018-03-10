#==================================================================
#  
#  SCOOTER: Leaky surface duct
#  Mexilhoeira Grande, Sex Jul 28 18:37:28 WEST 2017
#  Written by Tordar
#  
#==================================================================

# ipython: run sductS

from os import *
import sys
from numpy import *
from scipy.io import *
from pylab import *
sys.path.append ("/home/orodrig/FORdoc/at/Python/")
from readshd import *

rs = 0.0

print("SCOOTER - Leaky surface duct")

system("scooter.exe sductS")
system("fields.exe sductS < sductS.flp")

filename = 'sductS.shd'
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
imshow(tl,extent=[0,rmaxkm,0,Dmax],aspect='auto',cmap='jet_r',origin='lower',vmin=40,vmax=90)
cb = colorbar()
cb.ax.invert_yaxis()
plot(rs,-zs,marker="<",markersize=16,color="k")
xlabel('Range (km)')
ylabel('Depth (m)')
title('SCOOTER - Leaky surface duct')
ylim(Dmax,0)

show()

print("done.")
