clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN - Munk profile, leaky modes') 

fid = fopen('MunkKleaky.sbp','r');
n = fscanf(fid,'%d\n',[1 1]);
data = fscanf(fid,'%f %f\n',[2 n]);
fclose(fid);

angles  = data(1,:); 
powerdB = data(2,:);

figure(1)
polar(angles*pi/180,powerdB)
grid on, box on

system('kraken.exe MunkKleaky');
system('fields.exe MunkKleaky < MunkKleaky.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'MunkKleaky.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) ); 

tej = flipud( jet( 256 ) );

figure(2), hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([40 90]), colorbar
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - Munk profile, leaky modes, 50 Hz')

disp('done.')
