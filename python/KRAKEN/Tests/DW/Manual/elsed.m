clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN - Elastic sediment manual case')

system('cp  field.flp elsed.flp');
system('kraken.exe elsed');
%system('krakenc.exe elsed');
system('fields.exe elsed < elsed.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'elsed.shd' );

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
title('KRAKEN - Elastic sediment manual case')
grid on, box on
axis ij

disp('done.')
