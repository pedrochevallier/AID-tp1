USE ventas;

CREATE TABLE UsedVehiclesSells (
    year YEAR,
    make VARCHAR(50),
    model VARCHAR(50),
    trim VARCHAR(50),
    body VARCHAR(50),
    transmission VARCHAR(50),
    vin VARCHAR(17),  -- VIN es el número de identificación del vehículo, normalmente es único
    state VARCHAR(50),
    vehicle_condition VARCHAR(50),
    odometer INT NULL,
    color VARCHAR(30),
    interior VARCHAR(30),
    seller VARCHAR(100),
    mmr DECIMAL(10, 2),  -- Manheim Market Report, un valor decimal que puede incluir dos decimales
    sellingprice DECIMAL(10, 2),
    saledate DATETIME
);

LOAD DATA INFILE '/var/lib/mysql-files/UsedVehiclesSells.csv'
INTO TABLE UsedVehiclesSells
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(year,make,model,trim,body,transmission,vin,state,vehicle_condition,@odometer,color,interior,seller,mmr,sellingprice,saledate)
SET odometer = NULLIF(@odometer, '');