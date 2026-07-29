import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.Generator

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

/-!
# Kolmogorov Equations Package

This module formalizes the forward and backward Kolmogorov equations,
which describe the time evolution of the transition probabilities.
-/

structure KolmogorovEquations (P : ContinuousTimeMarkovProcess) where
  forwardEquation : ∀ s u t, ∂/∂t (p(s, u, t)) = ∑ x, p(s, x, t) * q(x, u)
  backwardEquation : ∀ s u t, ∂/∂t (p(s, u, t)) = ∑ x, q(s, x) * p(x, u, t)
  uniquenessUnderRegularity : ∀ solution, solution = transitionProbabilities

structure KolmogorovEquationsEvidence {P : ContinuousTimeMarkovProcess}
    (K : KolmogorovEquations P) where
  forwardEquationClosed : K.forwardEquation
  backwardEquationClosed : K.backwardEquation
  uniquenessUnderRegularityClosed : K.uniquenessUnderRegularity

def KolmogorovEquationsClosed {P : ContinuousTimeMarkovProcess}
    (K : KolmogorovEquations P) : Prop :=
  K.forwardEquation ∧ K.backwardEquation ∧ K.uniquenessUnderRegularity

theorem kolmogorov_equations_closed_from_evidence
    {P : ContinuousTimeMarkovProcess} (K : KolmogorovEquations P)
    (E : KolmogorovEquationsEvidence K) : KolmogorovEquationsClosed K :=
  And.intro E.forwardEquationClosed
    (And.intro E.backwardEquationClosed E.uniquenessUnderRegularityClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse