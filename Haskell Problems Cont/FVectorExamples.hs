-- $Id: FVectorExamples.hs,v 1.4 2019/10/09 15:05:25 leavens Exp leavens $
module FVectorExamples (module FVector, module FVectorExamples) where
import FVector
-- Note: THESE ARE NOT FOR YOU TO IMPLEMENT; they are examples for later testing
empty :: FVector Double
empty = (FV (\i -> error "should not be called") 0)
zeros :: Int -> (FVector Double)
zeros siz = (FV (\i -> 0.0) siz)
nats :: Int -> (FVector Double)
nats siz = (FV (\i -> fromIntegral i) siz)
negs :: Int -> (FVector Double)
negs siz = (FV (\i -> (- (fromIntegral i))) siz)
hundredDown :: Int -> (FVector Double)
hundredDown siz = (FV (\i -> fromIntegral (100 - i)) siz)
halves :: Int -> (FVector Double)
halves siz = (FV (\i -> (fromIntegral i)/(fromIntegral (2^i))) siz)
powersOf :: (Num a) => a -> Int -> (FVector a)
powersOf n siz = (FV (\i -> n^i) siz)                  
powersOf2 :: Int -> (FVector Double)
powersOf2 = powersOf 2
powersOf01:: Int -> (FVector Double)
powersOf01 = powersOf 0.1
