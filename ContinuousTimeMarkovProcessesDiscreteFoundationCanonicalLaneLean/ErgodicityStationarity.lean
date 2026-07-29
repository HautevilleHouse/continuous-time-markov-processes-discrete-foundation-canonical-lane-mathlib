import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.JumpProcessEmbedding

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure ErgodicityStationarity (S : DiscreteStateSpace) (G : GeneratorMatrix S) (M : MarkovFamily S G) where
  invariantMeasureExists : Prop
  invariantMeasureUnique : Prop
  ergodicTheoremHolds : Prop
  mixingProperty : Prop
  spectralGap : Prop

def ErgodicityStationarityClosed {S : DiscreteStateSpace} {G : GeneratorMatrix S} {M : MarkovFamily S G} (E : ErgodicityStationarity S G M) : Prop :=
  E.invariantMeasureExists ∧ E.invariantMeasureUnique ∧ E.ergodicTheoremHolds ∧ E.mixingProperty ∧ E.spectralGap

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse