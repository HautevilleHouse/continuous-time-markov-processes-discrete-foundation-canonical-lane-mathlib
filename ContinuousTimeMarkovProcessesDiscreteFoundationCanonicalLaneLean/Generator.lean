import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.TransitionSemigroup

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

/-!
# Infinitesimal Generator Package

This module defines the generator of a continuous-time Markov chain:
an operator on functions that captures the instantaneous transition rates.
-/

structure Generator (P : ContinuousTimeMarkovProcess) where
  domain : Set (StateSpace P → ℝ)
  operator : (StateSpace P → ℝ) → (StateSpace P → ℝ)
  linearity : IsLinear operator
  positiveMaxPrinciple : ∀ f ∈ domain, f ≤ 0 ∨ operator f ≤ 0
  conservativity : operator (λ _ => 1) = 0
  kolmogorovForwardEquation : ∀ f ∈ domain, ∂/∂t (P(t)f) = P(t)(operator f)

structure GeneratorEvidence {P : ContinuousTimeMarkovProcess}
    (G : Generator P) where
  linearityClosed : G.linearity
  positiveMaxPrincipleClosed : G.positiveMaxPrinciple
  conservativityClosed : G.conservativity
  kolmogorovForwardEquationClosed : G.kolmogorovForwardEquation

def GeneratorClosed {P : ContinuousTimeMarkovProcess}
    (G : Generator P) : Prop :=
  G.linearity ∧ G.positiveMaxPrinciple ∧ G.conservativity ∧ G.kolmogorovForwardEquation

theorem generator_closed_from_evidence {P : ContinuousTimeMarkovProcess}
    (G : Generator P) (E : GeneratorEvidence G) : GeneratorClosed G :=
  And.intro E.linearityClosed
    (And.intro E.positiveMaxPrincipleClosed
      (And.intro E.conservativityClosed E.kolmogorovForwardEquationClosed))

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse