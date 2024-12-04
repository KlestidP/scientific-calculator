module Memory (
    CalcState(..),
    initialState,
    storeMemory,
    clearMemory,
    clearAllMemory
) where

import qualified Data.Map as Map

-- Calculator State
data CalcState = CalcState {
    memory :: Map.Map String Double
} deriving (Show)

-- Initial calculator state
initialState :: CalcState
initialState = CalcState Map.empty

-- Store a value in memory
storeMemory :: String -> Double -> CalcState -> CalcState
storeMemory key val state = 
    state { memory = Map.insert key val (memory state) }

-- Clear a specific memory location
clearMemory :: String -> CalcState -> CalcState
clearMemory key state = 
    state { memory = Map.delete key (memory state) }

-- Clear entire memory
clearAllMemory :: CalcState -> CalcState
clearAllMemory state = 
    state { memory = Map.empty }
