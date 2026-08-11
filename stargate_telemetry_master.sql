-- =============================================================================
-- STARGATE CLUSTER: MASTER ENTERPRISE TELEMETRY & RISK SUITE
-- Target Database: SQL Server 2022+ / Azure SQL / tempdb
-- Engine: T-SQL / mssql-tools18
-- =============================================================================

USE tempdb;
GO

SET NOCOUNT ON;
SET XACT_ABORT ON;

PRINT '====================================================================================================================';
PRINT '                               INITIALIZING STARGATE TELEMETRY MASTER DEPLOYMENT                                    ';
PRINT '====================================================================================================================';
GO

-- -----------------------------------------------------------------------------
-- MODULE 1: MICROSOFT (MSFT) GLOBAL TELEMETRY & TARGET SENSITIVITY MATRIX
-- -----------------------------------------------------------------------------
IF OBJECT_ID('dbo.StargateGlobalTelemetry', 'U') IS NOT NULL
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

INSERT INTO dbo.StargateGlobalTelemetry 
(RegionNode, Ticker, CurrentPrice, TargetValuation, DeltaPct, UTurnSignal, AllocationTier, BaseAllocationMln) 
VALUES 
('SEATTLE_HQ',    'MSFT', 448.50, 515.00,  0.0148, 'AZURE AI CAPEX EXPANSION / BULLISH U-TURN',   'STRATEGIC CORE',  350.00),
('LONDON_DESK',   'MSFT', 448.50, 515.00,  0.0092, 'EMEA ENTERPRISE RENEWAL / MEAN REVERSION',    'CORE ACCUMULATION',250.00),
('BRASIL_DESK',   'MSFT', 448.50, 515.00,  0.0065, 'LATAM CLOUD INFRASTRUCTURE INFLOW',           'TACTICAL INFLOW', 150.00),
('ASIA_PAC_DESK', 'MSFT', 448.50, 515.00, -0.0182, 'RESOURCE REALIGNMENT / PRE-INFLECTION DRAW', 'AGGRESSIVE STRAT',200.00);
GO

-- -----------------------------------------------------------------------------
-- MODULE 2: HARDWARE & SEMICONDUCTOR SUPPLY CHAIN CORRELATION MATRIX
-- -----------------------------------------------------------------------------
IF OBJECT_ID('dbo.StargateHardwareSupplyChain', 'U') IS NOT NULL
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

-- -----------------------------------------------------------------------------
-- MODULE 3: QUANTUM RISK & PORTFOLIO SENTIMENT OPERATOR
-- -----------------------------------------------------------------------------
IF OBJECT_ID('dbo.StargateRiskSentiment', 'U') IS NOT NULL
    DROP TABLE dbo.StargateRiskSentiment;

CREATE TABLE dbo.StargateRiskSentiment (
    NodeID INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    IndexTicker VARCHAR(15) NOT NULL,
    MarketVenue VARCHAR(20) NOT NULL,
    SpotLevel NUMERIC(18,2) NOT NULL,
    Volatility30D NUMERIC(6,4) NOT NULL,
    SharpeScalar NUMERIC(5,2) NOT NULL,
    SentimentVector NUMERIC(5,4) NOT NULL,
    VaR95_1D_Mln NUMERIC(18,2) NOT NULL,
    AllocationCapitalMln NUMERIC(18,2) NOT NULL,
    IngestedAt DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET()
);

INSERT INTO dbo.StargateRiskSentiment
(IndexTicker, MarketVenue, SpotLevel, Volatility30D, SharpeScalar, SentimentVector, VaR95_1D_Mln, AllocationCapitalMln)
VALUES
('SPX',    'CBOE / NYSE', 5450.25, 0.1420, 1.85,  0.6250, 12.45, 1200.00),
('NDX',    'NASDAQ',      19750.80, 0.1850, 2.10,  0.8100, 24.80, 1800.00),
('N225',   'TOKYO_TSE',   38200.50, 0.2100, 1.45, -0.1200, 18.20,  650.00),
('BVSP',   'B3_SÃO_PAULO',128400.00,0.1980, 1.30,  0.3400,  8.90,  450.00);
GO

-- -----------------------------------------------------------------------------
-- MODULE 4: HIGH-FREQUENCY ORDER BOOK & LIQUIDITY TELEMETRY
-- -----------------------------------------------------------------------------
IF OBJECT_ID('dbo.StargateHFTOrderBook', 'U') IS NOT NULL
    DROP TABLE dbo.StargateHFTOrderBook;

CREATE TABLE dbo.StargateHFTOrderBook (
    ExecutionID INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    AssetSymbol VARCHAR(15) NOT NULL,
    ExchangeVenue VARCHAR(20) NOT NULL,
    BidPrice NUMERIC(18,4) NOT NULL,
    AskPrice NUMERIC(18,4) NOT NULL,
    BidDepthQty INT NOT NULL,
    AskDepthQty INT NOT NULL,
    DarkPoolInflowMln NUMERIC(18,2) NOT NULL,
    LatencyMicroSec INT NOT NULL,
    IngestedAt DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET()
);

INSERT INTO dbo.StargateHFTOrderBook
(AssetSymbol, ExchangeVenue, BidPrice, AskPrice, BidDepthQty, AskDepthQty, DarkPoolInflowMln, LatencyMicroSec)
VALUES
('MSFT',  'NASDAQ_FULL',  448.4900, 448.5100, 15400, 12800,  85.40,  120),
('NVDA',  'NASDAQ_FULL',  124.1500, 124.1700, 45200, 51000, 210.80,   95),
('AAPL',  'NASDAQ_FULL',  224.3000, 224.3200, 28900, 24100,  95.20,  110),
('TSM',   'NYSE_DIRECT',  168.8000, 168.8500, 18500, 14200,  62.10,  180);
GO

-- =============================================================================
-- ANALYTICAL EXECUTION SUITE
-- =============================================================================

PRINT '--------------------------------------------------------------------------------------------------------------------';
PRINT '1. MSFT REGIONAL TARGET SENSITIVITY MATRIX';
PRINT '--------------------------------------------------------------------------------------------------------------------';

WITH Telemetry_CTE AS (
    SELECT 
        RegionNode, Ticker, CurrentPrice, TargetValuation,
        CAST(((TargetValuation - CurrentPrice) / CurrentPrice * 100.0) AS NUMERIC(6,2)) AS Target_Upside_Pct,
        CAST(DeltaPct * 100.0 AS NUMERIC(6,2)) AS Node_Delta_Pct,
        AllocationTier, BaseAllocationMln AS Base_Alloc_Mln,
        CAST(BaseAllocationMln / SUM(BaseAllocationMln) OVER() * 100.0 AS NUMERIC(5,2)) AS Weight_Pct,
        CAST(BaseAllocationMln * (TargetValuation / CurrentPrice) * (1.0 + DeltaPct) AS NUMERIC(18,2)) AS Projected_Alloc_Val_Mln
    FROM dbo.StargateGlobalTelemetry
)
SELECT 
    RegionNode, Ticker, CurrentPrice, TargetValuation, Target_Upside_Pct, Node_Delta_Pct,
    AllocationTier, Base_Alloc_Mln, Weight_Pct, Projected_Alloc_Val_Mln,
    CAST((Projected_Alloc_Val_Mln - Base_Alloc_Mln) AS NUMERIC(18,2)) AS Expected_Alpha_Mln
FROM Telemetry_CTE
ORDER BY Projected_Alloc_Val_Mln DESC;

PRINT '--------------------------------------------------------------------------------------------------------------------';
PRINT '2. SEMICONDUCTOR & OEM SUPPLY CHAIN CORRELATION ANALYSIS';
PRINT '--------------------------------------------------------------------------------------------------------------------';

SELECT 
    EntityName, Category, Ticker, RegionMarket,
    CAST(DeltaPct * 100.0 AS NUMERIC(5,2)) AS Delta_Pct,
    SupplyChainCorrelation AS Correlation,
    BaseAllocationMln AS Base_Alloc_Mln,
    CAST(BaseAllocationMln * SupplyChainCorrelation AS NUMERIC(18,2)) AS Weighted_Exposure_Mln,
    CAST((DeltaPct * SupplyChainCorrelation * 100.0) AS NUMERIC(6,3)) AS Alpha_Momentum_Score,
    AllocationTier
FROM dbo.StargateHardwareSupplyChain
ORDER BY Weighted_Exposure_Mln DESC;

PRINT '--------------------------------------------------------------------------------------------------------------------';
PRINT '3. QUANTUM SENTIMENT & VALUE AT RISK (VaR) EVALUATION';
PRINT '--------------------------------------------------------------------------------------------------------------------';

WITH RiskSentiment_CTE AS (
    SELECT 
        IndexTicker, MarketVenue, SpotLevel,
        CAST(Volatility30D * 100.0 AS NUMERIC(5,2)) AS Vol_30D_Pct,
        SharpeScalar, SentimentVector, VaR95_1D_Mln,
        AllocationCapitalMln AS Capital_Mln,
        CAST((SharpeScalar * (1.0 + SentimentVector) / Volatility30D) AS NUMERIC(8,2)) AS Efficiency_Density_Index,
        CAST(AllocationCapitalMln * (1.0 + SentimentVector - (VaR95_1D_Mln / AllocationCapitalMln)) AS NUMERIC(18,2)) AS Adjusted_Capital_Value_Mln
    FROM dbo.StargateRiskSentiment
)
SELECT 
    IndexTicker, MarketVenue, SpotLevel, Vol_30D_Pct, SharpeScalar, SentimentVector, VaR95_1D_Mln,
    Capital_Mln, Efficiency_Density_Index, Adjusted_Capital_Value_Mln,
    CAST((Adjusted_Capital_Value_Mln - Capital_Mln) AS NUMERIC(18,2)) AS Risk_Adjusted_Alpha_Mln
FROM RiskSentiment_CTE
ORDER BY Efficiency_Density_Index DESC;

PRINT '--------------------------------------------------------------------------------------------------------------------';
PRINT '4. HIGH-FREQUENCY MICROSTRUCTURE & SPREAD ANALYSIS';
PRINT '--------------------------------------------------------------------------------------------------------------------';

SELECT 
    AssetSymbol, ExchangeVenue, BidPrice, AskPrice,
    CAST(((AskPrice - BidPrice) / ((BidPrice + AskPrice) / 2.0) * 10000.0) AS NUMERIC(6,2)) AS Spread_Bps,
    CAST(CAST(BidDepthQty AS NUMERIC(12,2)) / CAST(AskDepthQty AS NUMERIC(12,2)) AS NUMERIC(5,2)) AS Order_Book_Imbalance,
    DarkPoolInflowMln, LatencyMicroSec,
    CASE 
        WHEN CAST(BidDepthQty AS NUMERIC(12,2)) / CAST(AskDepthQty AS NUMERIC(12,2)) > 1.15 THEN 'BULLISH ACCUMULATION'
        WHEN CAST(BidDepthQty AS NUMERIC(12,2)) / CAST(AskDepthQty AS NUMERIC(12,2)) < 0.85 THEN 'BEARISH DISTRIBUTION'
        ELSE 'NEUTRAL BALANCED'
    END AS Microstructure_Signal
FROM dbo.StargateHFTOrderBook
ORDER BY DarkPoolInflowMln DESC;
GO
