clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN - Arctic profile') 

system('kraken.exe arcticK');
system('fields.exe arcticK < arcticK.flp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'arcticK.shd' );

Modes = read_modes_bin( 'arcticK.mod' );
phi = Modes.phi; phi1 = phi(:,1); phi2 = phi(:,2);  phi3 = phi(:,3); phi4 = phi(:,4);
z   = Modes.z;

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
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([40 90])
h = colorbar;
set( h, 'YDir', 'reverse' );
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - Arctic profile, 200 Hz')

figure(2)
subplot(141)
plot(real(phi1),z,imag(phi1),z), axis ij
box on, grid on
subplot(142)
plot(real(phi2),z,imag(phi2),z), axis ij
box on, grid on
subplot(143)
plot(real(phi3),z,imag(phi3),z), axis ij
box on, grid on
subplot(144)
plot(real(phi4),z,imag(phi4),z), axis ij
box on, grid on

disp('done.')
