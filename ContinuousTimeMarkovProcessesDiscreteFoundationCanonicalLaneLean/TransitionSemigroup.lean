import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.ContinuousTimeMarkovProcess

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

/-!
# Transition Semigroup Package

This module defines the transition semigroup associated with a Markov process.
The semigroup property corresponds to the Chapman-Kolmogorov equation.
-/

structure TransitionSemigroup (P : ContinuousTimeMarkovProcess) where
  semigroup : (StateSpace P) → (StateSpace P) → ℝ → ℝ≥0
  semigroupProperty : ∀ s t u, semigroup s u (t + t') = ∑ x, semigroup s x t * semigroup x u t'
  contractivity : ∀ s t, ∑ u, semigroup s u t = 1
  continuity : ∀ s u, Continuous (λ t => semigroup s u t)

structure TransitionSemigroupEvidence {P : ContinuousTimeMarkovProcess}
    (T : TransitionSemigroup P) where
  semigroupPropertyClosed : T.semigroupProperty
  contractivityClosed : T.contractivity
  continuityClosed : T.continuity

def TransitionSemigroupClosed {P : ContinuousTimeMarkovProcess}
    (T : TransitionSemigroup P) : Prop :=
  T.semigroupProperty ∧ T.contractivity ∧ T.continuity

theorem transition_semigroup_closed_from_evidence
    {P : ContinuousTimeMarkovProcess} (T : TransitionSemigroup P)
    (E : TransitionSemigroupEvidence T) : TransitionSemigroupClosed T :=
  And.intro E.semigroupPropertyClosed
    (And.intro E.contractivityClosed E.continuityClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse