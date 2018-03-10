clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('SCOOTER - Twersky manual case')

system('cp fields.flp twersky.flp');
system('scooter.exe twersky');
system('fields.exe twersky < twersky.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'twersky.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) ); 

figure(1)
plot(rarraykm,tl)
xlabel('Range (km)')
ylabel('TL (dB)')
title('SCOOTER - Twersky manual case')
grid on, box on
axis ij

disp('done.')
