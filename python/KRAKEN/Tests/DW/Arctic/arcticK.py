#==================================================================
#  
#  KRAKEN: Arctic sound speed profile
#  Mexilhoeira Grande, Sex Jul 28 18:01:38 WEST 2017
#  Written by Tordar
#  
#==================================================================

# ipython: run arcticK

from os import *
import sys
from numpy import *
from scipy.io import *
from pylab import *
sys.path.append ("/home/orodrig/FORdoc/at/Python/")
from readmod import *
from readshd import *

rs = 0.0

print("KRAKEN- Arctic profile")

system("kraken.exe arcticK")
system("fields.exe arcticK < arcticK.flp")

filename = 'arcticK.shd'
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

Modes,bc = readmod('arcticK.mod')

phi = Modes["phi"]
z   = Modes["z"]
k   = Modes["k"]

figure(1)
imshow(tl,extent=[0,rmaxkm,0,Dmax],aspect='auto',cmap='jet_r',origin='lower',vmin=40,vmax=90)
cb = colorbar()
cb.ax.invert_yaxis()
plot(rs,-zs,marker="<",markersize=16,color="k")
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - Arctic waveguide')
ylim(Dmax,0)

figure(2)
for i in range(4):  
   rphi = real( phi[ : , i ] ) 
   iphi = imag( phi[ : , i ] )
   thetitle = 'Z_'  + str(i+1) + '(z)' 
   subplot(1,4,i+1)
   plot(rphi,z,iphi,z,'r--')
   ylim(Dmax,0)
   title( thetitle )
   grid(True)
subplot(141)
ylabel('Depth (m)')

show()

print("done.")
