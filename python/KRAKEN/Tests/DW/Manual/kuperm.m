clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN - Top Mid roughness manual case')

system('cp  field.flp kuperm.flp');
system('kraken.exe kuperm');
%system('krakenc.exe kuperm');
system('fields.exe kuperm < kuperm.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'kuperm.shd' );

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
title('KRAKEN - Mid roughness manual case')
grid on, box on
axis ij

disp('done.')
