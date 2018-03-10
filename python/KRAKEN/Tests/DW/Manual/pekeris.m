clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN - Pekeris manual case')

system('cp  field.flp pekeris.flp');
system('kraken.exe pekeris');
%system('krakenc.exe pekeris');
system('fields.exe pekeris < pekeris.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'pekeris.shd' );

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
title('KRAKEN - Pekeris manual case')
grid on, box on
axis ij

disp('done.')
