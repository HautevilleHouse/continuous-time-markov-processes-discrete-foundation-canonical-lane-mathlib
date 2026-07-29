import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure EmbeddingDiscreteChain (S : MarkovChainStateSpace) (Q : TransitionRateMatrix S) where
  embeddedChain : S.stateSet → S.stateSet → ℝ
  uniformizationRate : ℝ
  uniformizationPositive : uniformizationRate > 0
  embeddingRelation : ∀ i j, i ≠ j → Q.rate i j = uniformizationRate * embeddedChain i j
  embeddedProbability : ∀ i, ∑ⱼ, embeddedChain i j = 1

structure EmbeddingDiscreteChainEvidence {S : MarkovChainStateSpace} {Q : TransitionRateMatrix S} (E : EmbeddingDiscreteChain S Q) where
  uniformizationPositiveClosed : E.uniformizationRate > 0
  embeddingRelationClosed : ∀ i j, i ≠ j → Q.rate i j = E.uniformizationRate * E.embeddedChain i j
  embeddedProbabilityClosed : ∀ i, ∑ⱼ, E.embeddedChain i j = 1

def EmbeddingDiscreteChainClosed {S : MarkovChainStateSpace} {Q : TransitionRateMatrix S} (E : EmbeddingDiscreteChain S Q) : Prop :=
  E.uniformizationRate > 0 ∧ (∀ i j, i ≠ j → Q.rate i j = E.uniformizationRate * E.embeddedChain i j) ∧ (∀ i, ∑ⱼ, E.embeddedChain i j = 1)

theorem embedding_discrete_chain_closed_from_evidence {S : MarkovChainStateSpace} {Q : TransitionRateMatrix S} (E : EmbeddingDiscreteChain S Q) (Ev : EmbeddingDiscreteChainEvidence E) : EmbeddingDiscreteChainClosed E := by
  exact And.intro Ev.uniformizationPositiveClosed (And.intro Ev.embeddingRelationClosed Ev.embeddedProbabilityClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse