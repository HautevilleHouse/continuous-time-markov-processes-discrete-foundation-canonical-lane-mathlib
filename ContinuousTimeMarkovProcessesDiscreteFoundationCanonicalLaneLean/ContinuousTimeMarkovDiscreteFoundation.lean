import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure ContinuousTimeMarkovProcessState where
  stateSpace : Type u
  transitionTimes : List ℝ
  jumpChain : Type v
  infinitesimalGenerator : Type w

structure MarkovAdmittedObject where
  process : ContinuousTimeMarkovProcessState
  discreteEmbedding : Prop
  jumpChainEmbedding : Prop
  transitionMatrixValid : Prop
  conclusion : discreteEmbedding ∧ jumpChainEmbedding ∧ transitionMatrixValid

structure MarkovEndgameState where
  object : MarkovAdmittedObject

def MarkovWitnessClosed (O : MarkovAdmittedObject) : Prop :=
  O.conclusion

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse