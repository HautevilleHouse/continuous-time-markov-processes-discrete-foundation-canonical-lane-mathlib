import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure EmbeddingDiscreteTimeChains where
  jumpChainDiscrete : Type u
  holdingTimesIndependent : Prop
  exponentialHoldingTimes : Prop
  embeddedChainTransition : Prop
  continuousTimeProcessDefined : Prop

structure EmbeddingDiscreteTimeChainsEvidence (E : EmbeddingDiscreteTimeChains) where
  holdingTimesIndependentClosed : E.holdingTimesIndependent
  exponentialHoldingTimesClosed : E.exponentialHoldingTimes
  embeddedChainTransitionClosed : E.embeddedChainTransition
  continuousTimeProcessDefinedClosed : E.continuousTimeProcessDefined

def EmbeddingDiscreteTimeChainsClosed (E : EmbeddingDiscreteTimeChains) : Prop :=
  E.holdingTimesIndependent ∧ E.exponentialHoldingTimes ∧ E.embeddedChainTransition ∧ E.continuousTimeProcessDefined

theorem embedding_discrete_time_chains_closed_from_evidence (E : EmbeddingDiscreteTimeChains) (Ev : EmbeddingDiscreteTimeChainsEvidence E) :
    EmbeddingDiscreteTimeChainsClosed E := by
  exact And.intro Ev.holdingTimesIndependentClosed (And.intro Ev.exponentialHoldingTimesClosed (And.intro Ev.embeddedChainTransitionClosed Ev.continuousTimeProcessDefinedClosed))

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse