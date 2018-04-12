clc

cargar openloop60hertz

fs = 1000;
t = (0: numel (openLoopVoltage) - 1) / fs;
rng predeterminado

spikeSignal = ceros (tamano (openLoopVoltage));
spks = 10: 100: 1990;
spikeSignal (spks + round (2 * randn (tamano (spks)))) = signo (randn (tamano (spks)));

noisyLoopVoltage = openLoopVoltage + spikeSignal;

plot (t, noisyLoopVoltage)

xlabel ( 'Tiempo (s)' )
ylabel ( 'Voltaje (V)' )
title ( 'Voltaje de bucle abierto con picos añadidos' )
yax = ylim;
medfiltLoopVoltage = medfilt1 (noisyLoopVoltage, 3);

plot (t, medfiltLoopVoltage)

xlabel ( 'Tiempo (s)' )
ylabel ( 'Voltaje (V)' )
title ( 'Voltaje de bucle abierto después de la mediana de filtrado' )
ylim (yax)
cuadricula
