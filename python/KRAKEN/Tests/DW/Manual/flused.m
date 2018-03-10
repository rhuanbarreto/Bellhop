clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN - Fluid sediment manual case')

system('cp  field.flp flused.flp');
system('kraken.exe flused');
%system('krakenc.exe flused');
system('fields.exe flused < flused.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'flused.shd' );

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
title('KRAKEN - Fluid sediment manual case')
grid on, box on
axis ij

disp('done.')
