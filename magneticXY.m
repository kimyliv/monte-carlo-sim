function magnetic = magneticXY(gridspins,N) % Finds systems magnetism

magcos = 0;
magsin = 0;

for ja = 1:N
    for ia = 1:N
    
        magcos = magcos + cos(gridspins(ia,ja));
        magsin = magsin + sin(gridspins(ia,ja));
        
    end
end
magnetic = sqrt(magcos^2+magsin^2);