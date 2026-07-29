import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.ContinuousTimeMarkovDiscreteFoundation

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure JumpChainEmbeddingPackage where
  jumpTimes : List ℝ
  stateAtTimes : ℕ → MarkovAdmittedObject
  jumpChainCondition : Prop
  discreteTimeHomogeneous : Prop

structure JumpChainEmbeddingEvidence (P : JumpChainEmbeddingPackage) where
  jumpChainConditionClosed : P.jumpChainCondition
  discreteTimeHomogeneousClosed : P.discreteTimeHomogeneous

def JumpChainEmbeddingClosed (P : JumpChainEmbeddingPackage) : Prop :=
  P.jumpChainCondition ∧ P.discreteTimeHomogeneous

theorem jump_chain_embedding_closed_from_evidence (P : JumpChainEmbeddingPackage) (E : JumpChainEmbeddingEvidence P) :
    JumpChainEmbeddingClosed P := by
  exact And.intro E.jumpChainConditionClosed E.discreteTimeHomogeneousClosed

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse