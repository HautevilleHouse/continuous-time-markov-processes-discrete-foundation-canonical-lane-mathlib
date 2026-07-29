import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure RateMatrixGenerator where
  stateCount : ℕ
  generatorMatrix : Matrix (Fin stateCount) (Fin stateCount) ℝ
  conservationProperty : Prop
  nonNegativeOffDiagonal : Prop
  finiteRateBound : Prop

structure RateMatrixGeneratorEvidence (R : RateMatrixGenerator) where
  conservationPropertyClosed : R.conservationProperty
  nonNegativeOffDiagonalClosed : R.nonNegativeOffDiagonal
  finiteRateBoundClosed : R.finiteRateBound

def RateMatrixGeneratorClosed (R : RateMatrixGenerator) : Prop :=
  R.conservationProperty ∧ R.nonNegativeOffDiagonal ∧ R.finiteRateBound

theorem rate_matrix_generator_closed_from_evidence (R : RateMatrixGenerator) (E : RateMatrixGeneratorEvidence R) :
    RateMatrixGeneratorClosed R := by
  exact And.intro E.conservationPropertyClosed (And.intro E.nonNegativeOffDiagonalClosed E.finiteRateBoundClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse