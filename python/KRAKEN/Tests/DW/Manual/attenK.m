clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN - Attenuation manual case')

system('cp  field.flp atten.flp');
system('kraken.exe atten');
%system('krakenc.exe atten');
system('fields.exe atten < atten.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'atten.shd' );

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
title('KRAKEN - Attenuation manual case')
grid on, box on
axis ij

disp('done.')
