import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.KolmogorovEquations

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure JumpProcessEmbedding (S : DiscreteStateSpace) (G : GeneratorMatrix S) (M : MarkovFamily S G) where
  samplePathRegularity : Prop
  jumpTimesDiscreteSet : Prop
  embeddedChainIsMarkov : Prop
  holdingTimesExponential : Prop

def JumpProcessEmbeddingClosed {S : DiscreteStateSpace} {G : GeneratorMatrix S} {M : MarkovFamily S G} (J : JumpProcessEmbedding S G M) : Prop :=
  J.samplePathRegularity ∧ J.jumpTimesDiscreteSet ∧ J.embeddedChainIsMarkov ∧ J.holdingTimesExponential

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse