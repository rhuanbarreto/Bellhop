% double is a built-in Matlab function

clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN - Double-duct manual case')

system('cp  field.flp double.flp');
system('kraken.exe double');
%system('krakenc.exe double');
system('fields.exe double < double.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'double.shd' );

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
title('KRAKEN - Double-duct manual case')
grid on, box on
axis ij

disp('done.')
