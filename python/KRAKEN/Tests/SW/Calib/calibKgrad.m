clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN - Calibration case') 

system('kraken.exe calibKgrad');
system('fields.exe calibKgrad < calibKgrad.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'calibKgrad.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) ); 

tej = flipud( jet( 256 ) );

figure(1), hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([40 90]), colorbar
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - Calibration case, 250 Hz')

disp('done.')
