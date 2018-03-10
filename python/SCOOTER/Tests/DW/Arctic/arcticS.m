clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('Scooter - Arctic profile') 

system('scooter.exe arcticS');
system('fields.exe arcticS < arcticS.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'arcticS.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) ); 

tej = flipud( jet( 256 ) );

[ ~, ~, ~, ~, Pos, G ] = read_shd( 'arcticS.grn' );

G = squeeze( G );
k = Pos.r.range; 
z = Pos.r.depth;

figure(1)
pcolor( k,-z,abs(G) ), shading interp, colormap( jet ), caxis([0 50]), colorbar
xlabel('Wavenumber (1/m)')
ylabel('Depth (m)')
title('SCOOTER - Green function, 200 Hz')

figure(2), hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([40 90])
h = colorbar;
set( h, 'YDir', 'reverse' );

axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('SCOOTER - Arctic profile, 200 Hz')

disp('done.')
