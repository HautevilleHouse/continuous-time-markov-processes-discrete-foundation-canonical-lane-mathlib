import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.InfinitesimalGeneratorDiscretization

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure TransitionSemiGroupDiscreteApproximationPackage where
  transitionSemiGroup : Type u
  discreteApproximant : Type v
  kolmogorovForwardEquation : Prop
  convergenceAsTimeStepZero : Prop
  discreteTimeHomogeneous : Prop

structure TransitionSemiGroupDiscreteApproximationEvidence
    (T : TransitionSemiGroupDiscreteApproximationPackage) where
  kolmogorovForwardEquationClosed : T.kolmogorovForwardEquation
  convergenceAsTimeStepZeroClosed : T.convergenceAsTimeStepZero
  discreteTimeHomogeneousClosed : T.discreteTimeHomogeneous

def TransitionSemiGroupDiscreteApproximationClosed
    (T : TransitionSemiGroupDiscreteApproximationPackage) : Prop :=
  T.kolmogorovForwardEquation ∧ T.convergenceAsTimeStepZero ∧ T.discreteTimeHomogeneous

theorem transition_semi_group_discrete_approximation_closed_from_evidence
    (T : TransitionSemiGroupDiscreteApproximationPackage)
    (E : TransitionSemiGroupDiscreteApproximationEvidence T) :
    TransitionSemiGroupDiscreteApproximationClosed T := by
  exact And.intro E.kolmogorovForwardEquationClosed
    (And.intro E.convergenceAsTimeStepZeroClosed E.discreteTimeHomogeneousClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse