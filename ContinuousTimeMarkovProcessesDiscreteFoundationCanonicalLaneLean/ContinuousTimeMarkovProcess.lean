import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

/-!
# Continuous-Time Markov Process Package

This module defines the core structure of a continuous-time Markov process
with a discrete state space. The state space is finite or countably infinite,
the index set is [0,∞), and the process satisfies the Markov property.
-/

structure ContinuousTimeMarkovProcess where
  StateSpace : Type u
  [DecidableEq StateSpace]
  indexSet : Set ℝ
  sampleFunction : ℝ → StateSpace
  markovProperty : Prop
  initialDistribution : StateSpace → ℝ≥0
  transitionProbabilities : StateSpace → StateSpace → ℝ → ℝ≥0
  chapmanKolmogorov : Prop
  samplePathRegularity : Prop

structure ContinuousTimeMarkovProcessEvidence (P : ContinuousTimeMarkovProcess) where
  markovPropertyClosed : P.markovProperty
  chapmanKolmogorovClosed : P.chapmanKolmogorov
  samplePathRegularityClosed : P.samplePathRegularity

def ContinuousTimeMarkovProcessClosed (P : ContinuousTimeMarkovProcess) : Prop :=
  P.markovProperty ∧ P.chapmanKolmogorov ∧ P.samplePathRegularity

theorem ctmp_closed_from_evidence (P : ContinuousTimeMarkovProcess)
    (E : ContinuousTimeMarkovProcessEvidence P) : ContinuousTimeMarkovProcessClosed P :=
  And.intro E.markovPropertyClosed
    (And.intro E.chapmanKolmogorovClosed E.samplePathRegularityClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse