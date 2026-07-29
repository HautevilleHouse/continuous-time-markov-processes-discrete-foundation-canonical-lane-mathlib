import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.TransitionSemiGroupDiscreteApproximation

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure ErgodicityDiscreteEmbeddingPackage where
  invariantMeasure : Type u
  discreteInvariantMeasure : Type v
  ergodicTheoremContinuous : Prop
  ergodicTheoremDiscrete : Prop
  embeddingPreservesErgodicity : Prop

structure ErgodicityDiscreteEmbeddingEvidence (E : ErgodicityDiscreteEmbeddingPackage) where
  ergodicTheoremContinuousClosed : E.ergodicTheoremContinuous
  ergodicTheoremDiscreteClosed : E.ergodicTheoremDiscrete
  embeddingPreservesErgodicityClosed : E.embeddingPreservesErgodicity

def ErgodicityDiscreteEmbeddingClosed (E : ErgodicityDiscreteEmbeddingPackage) : Prop :=
  E.ergodicTheoremContinuous ∧ E.ergodicTheoremDiscrete ∧ E.embeddingPreservesErgodicity

theorem ergodicity_discrete_embedding_closed_from_evidence
    (E : ErgodicityDiscreteEmbeddingPackage)
    (Ev : ErgodicityDiscreteEmbeddingEvidence E) :
    ErgodicityDiscreteEmbeddingClosed E := by
  exact And.intro Ev.ergodicTheoremContinuousClosed
    (And.intro Ev.ergodicTheoremDiscreteClosed Ev.embeddingPreservesErgodicityClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse