import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.TransitionSemigroup

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

/-!
# Ergodicity Package

This module defines ergodicity for continuous-time Markov processes:
convergence to stationary distribution and uniqueness of invariant measure.
-/

structure Ergodicity (P : ContinuousTimeMarkovProcess) where
  invariantDistribution : StateSpace P → ℝ≥0
  invariance : ∀ s, ∑ u, invariantDistribution u * transitionProbabilities u s t = invariantDistribution s
  uniqueness : ∀ π, (∀ s, ∑ u, π u * transitionProbabilities u s t = π s) → π = invariantDistribution
  convergence : ∀ initial π, lim_{t→∞} ||P(t)f - ∫ f dπ|| = 0

structure ErgodicityEvidence {P : ContinuousTimeMarkovProcess}
    (E : Ergodicity P) where
  invarianceClosed : E.invariance
  uniquenessClosed : E.uniqueness
  convergenceClosed : E.convergence

def ErgodicityClosed {P : ContinuousTimeMarkovProcess}
    (E : Ergodicity P) : Prop :=
  E.invariance ∧ E.uniqueness ∧ E.convergence

theorem ergodicity_closed_from_evidence {P : ContinuousTimeMarkovProcess}
    (E : Ergodicity P) (Ev : ErgodicityEvidence E) : ErgodicityClosed E :=
  And.intro Ev.invarianceClosed
    (And.intro Ev.uniquenessClosed Ev.convergenceClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse