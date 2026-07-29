import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure TransitionRateMatrix (S : MarkovChainStateSpace) where
  rate : S.stateSet → S.stateSet → ℝ
  nonnegativeOffDiagonal : ∀ i j, i ≠ j → rate i j ≥ 0
  zeroDiagonal : ∀ i, rate i i = 0
  finiteTotalRate : ∀ i, ∑ᵢ, rate i i = 0
  stabilityCondition : ∀ i, ∑ⱼ, rate i j = 0

structure TransitionRateMatrixEvidence {S : MarkovChainStateSpace} (Q : TransitionRateMatrix S) where
  nonnegativeOffDiagonalClosed : ∀ i j, i ≠ j → Q.rate i j ≥ 0
  zeroDiagonalClosed : ∀ i, Q.rate i i = 0
  stabilityConditionClosed : ∀ i, ∑ⱼ, Q.rate i j = 0

def TransitionRateMatrixClosed {S : MarkovChainStateSpace} (Q : TransitionRateMatrix S) : Prop :=
  (∀ i j, i ≠ j → Q.rate i j ≥ 0) ∧ (∀ i, Q.rate i i = 0) ∧ (∀ i, ∑ⱼ, Q.rate i j = 0)

theorem transition_rate_matrix_closed_from_evidence {S : MarkovChainStateSpace} (Q : TransitionRateMatrix S) (E : TransitionRateMatrixEvidence Q) : TransitionRateMatrixClosed Q := by
  exact And.intro E.nonnegativeOffDiagonalClosed (And.intro E.zeroDiagonalClosed E.stabilityConditionClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse