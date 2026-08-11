-- STARGATE CLUSTER: UNIFIED FINANCIAL TELEMETRY & CAPEX SENSITIVITY MATRIX
-- Compiled T-SQL Deployment for SQL Server Engine (mssql-tools18)

USE tempdb;
GO

SET NOCOUNT ON;

--------------------------------------------------------------------------------
-- 1. STARGATE GLOBAL MSFT U-TURN & TELEMETRY MATRIX
--------------------------------------------------------------------------------
IF OBJECT_ID('dbo.StargateGlobalTelemetry') IS NOT NULL
    DROP TABLE dbo.StargateGlobalTelemetry;

CREATE TABLE dbo.StargateGlobalTelemetry (
    NodeID INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    RegionNode VARCHAR(30) NOT NULL,
    Ticker VARCHAR(10) NOT NULL,
    CurrentPrice NUMERIC(18,2) NOT NULL,
    TargetValuation NUMERIC(18,2) NOT NULL,
    DeltaPct NUMERIC(8,4) NOT NULL,
    UTurnSignal VARCHAR(100) NOT NULL,
    AllocationTier VARCHAR(50) NOT NULL,
    BaseAllocationMln NUMERIC(18,2) NOT NULL,
    IngestedAt DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET()
);
GO

INSERT INTO dbo.StargateGlobalTelemetry 
(RegionNode, Ticker, CurrentPrice, TargetValuation, DeltaPct, UTurnSignal, AllocationTier, BaseAllocationMln) 
VALUES 
('SEATTLE_HQ',    'MSFT', 448.50, 515.00,  0.0148, 'AZURE AI CAPEX EXPANSION / BULLISH U-TURN',   'STRATEGIC CORE',  350.00),
('LONDON_DESK',   'MSFT', 448.50, 515.00,  0.0092, 'EMEA ENTERPRISE RENEWAL / MEAN REVERSION',    'CORE ACCUMULATION',250.00),
('BRASIL_DESK',   'MSFT', 448.50, 515.00,  0.0065, 'LATAM CLOUD INFRASTRUCTURE INFLOW',           'TACTICAL INFLOW', 150.00),
('ASIA_PAC_DESK', 'MSFT', 448.50, 515.00, -0.0182, 'RESOURCE REALIGNMENT / PRE-INFLECTION DRAW', 'AGGRESSIVE STRAT',200.00);
GO

--------------------------------------------------------------------------------
-- 2. HARDWARE & SEMICONDUCTOR SUPPLY CHAIN CORRELATION
--------------------------------------------------------------------------------
IF OBJECT_ID('dbo.StargateHardwareSupplyChain') IS NOT NULL
    DROP TABLE dbo.StargateHardwareSupplyChain;

CREATE TABLE dbo.StargateHardwareSupplyChain (
    NodeID INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    EntityName VARCHAR(50) NOT NULL,
    Category VARCHAR(40) NOT NULL,
    Ticker VARCHAR(15) NOT NULL,
    RegionMarket VARCHAR(20) NOT NULL,
    DeltaPct NUMERIC(8,4) NOT NULL,
    SupplyChainCorrelation NUMERIC(4,3) NOT NULL,
    SignalVector VARCHAR(100) NOT NULL,
    AllocationTier VARCHAR(50) NOT NULL,
    BaseAllocationMln NUMERIC(18,2) NOT NULL,
    IngestedAt DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET()
);
GO

INSERT INTO dbo.StargateHardwareSupplyChain 
(EntityName, Category, Ticker, RegionMarket, DeltaPct, SupplyChainCorrelation, SignalVector, AllocationTier, BaseAllocationMln)
VALUES 
('SK Hynix',            'HBM_MEMORY',        '000660.KS', 'KOSPI',      0.0245, 0.945, 'HBM3E / HBM4 CAPEX ALPHA',             'AGGRESSIVE CORE', 300.00),
('Samsung Electronics', 'FOUNDRY_MEMORY',    '005930.KS', 'KOSPI',      0.0180, 0.910, 'DRAM / NAND FAB RECOVERY',             'STRATEGIC ALLOC', 350.00),
('Intel',               'SILICON_ARCH',      'INTC',      'NASDAQ',    -0.0095, 0.780, 'X86 LUNAR LAKE / FOUNDRY REALIGN',    'TACTICAL HOLD',   175.00),
('ASUS',                'PREMIUM_OEM',       '2357.TW',   'TAIEX',      0.0120, 0.825, 'COPILOT+ PC / ROG ECOSYSTEM INFLOW',   'GROWTH ALLOC',    125.00),
('LG Electronics',      'PREMIUM_OEM',       '066570.KS', 'KOSPI',      0.0085, 0.760, 'GRAM DISPLAY & CLIENT INTEGRATION',    'CONSOLIDATING',   100.00),
('Microsoft Surface',   'ENTERPRISE_CLIENT', 'MSFT',      'NASDAQ',     0.0148, 0.890, 'SURFACE PRO COPILOT+ ENTERPRISE REFRESH','STRATEGIC CORE', 250.00),
('Huawei MateBook',     'ENTERPRISE_CLIENT', '0981.HK',   'HANG_SENG',  0.0115, 0.810, 'KIRIN / MATEBOOK PRO DOMESTIC REPLACEMENT','GROWTH ALLOC', 150.00);
GO

--------------------------------------------------------------------------------
-- 3. MEGACAPEX & TERACAPEX 60-MONTH MACRO LEVERAGE MODEL
--------------------------------------------------------------------------------
IF OBJECT_ID('dbo.StargateCapex60MProjections') IS NOT NULL
    DROP TABLE dbo.StargateCapex60MProjections;

CREATE TABLE dbo.StargateCapex60MProjections (
    NodeID INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    Region VARCHAR(30) NOT NULL,
    HubCity VARCHAR(30) NOT NULL,
    CapexTier VARCHAR(20) NOT NULL,
    BaseCapexMln NUMERIC(18,2) NOT NULL,
    RunRateSalesMln NUMERIC(18,2) NOT NULL,
    GrowthDeltaPct NUMERIC(8,4) NOT NULL,
    CapexMultiplier NUMERIC(4,2) NOT NULL,
    MacroLeverageScalar NUMERIC(4,2) NOT NULL,
    SignalVector VARCHAR(100) NOT NULL,
    IngestedAt DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET()
);
GO

INSERT INTO dbo.StargateCapex60MProjections 
(Region, HubCity, CapexTier, BaseCapexMln, RunRateSalesMln, GrowthDeltaPct, CapexMultiplier, MacroLeverageScalar, SignalVector)
VALUES 
('ASIA',      'Tokyo / Seoul',    'TERACAPEX', 1250.00,  850.00, 0.0225, 1.35, 1.25, 'HBM3E/FOUNDRY HYPERSCALE EXPANSION'),
('CHINA',     'Shanghai/Beijing', 'TERACAPEX', 1500.00, 1100.00, 0.0185, 1.25, 1.15, 'DOMESTIC AI FAB & COMPUTE CLUSTER'),
('SINGAPORE', 'Singapore',        'MEGACAPEX',  650.00,  480.00, 0.0210, 1.40, 1.30, 'APAC EDGE HUB & FINANCIAL TELEMETRY'),
('GERMANY',   'Frankfurt',        'MEGACAPEX',  800.00,  520.00, 0.0140, 1.20, 1.10, 'AUTOMOTIVE SILICON & CLOUD INFRA'),
('LONDON',    'London',           'MEGACAPEX',  950.00,  680.00, 0.0165, 1.30, 1.20, 'EMEA CROSS-ASSET CLEARING & QUANT'),
('BRASIL',    'São Paulo / Rio',  'MEGACAPEX',  500.00,  340.00, 0.0250, 1.45, 1.35, 'LATAM CLOUD & SOVEREIGN TELEMETRY');
GO
