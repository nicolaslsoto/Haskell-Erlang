-- $Id: ANN.hs,v 1.1 2013/09/24 14:54:21 leavens Exp leavens $
module ANN where

type NeuralNetwork = [NeuralLayer]
type NeuralLayer = [Neuron]
type Neuron = [Weight] -- without bias in this representation
type Weight = Double

type Vector = [Double] -- inputs and outputs

-- applyNetwork calculates the output for a given input vector
-- The vector iv is also used as an accumulator
applyNetwork :: NeuralNetwork -> Vector -> Vector

-- applyNeuron calculates the output of a neuron for a given input vector
applyNeuron :: Neuron -> Vector -> Double

-- Add your code below
