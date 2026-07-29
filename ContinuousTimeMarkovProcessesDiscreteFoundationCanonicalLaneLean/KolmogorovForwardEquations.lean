import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure KolmogorovForwardEquations where
  initialDistribution : Prop
  transitionSemiGroup : Type u
  forwardEquation : Prop
  existenceSolution : Prop
  uniquenessSolution : Prop

structure KolmogorovForwardEquationsEvidence (K : KolmogorovForwardEquations) where
  initialDistributionClosed : K.initialDistribution
  forwardEquationClosed : K.forwardEquation
  existenceSolutionClosed : K.existenceSolution
  uniquenessSolutionClosed : K.uniquenessSolution

def KolmogorovForwardEquationsClosed (K : KolmogorovForwardEquations) : Prop :=
  K.initialDistribution ∧ K.forwardEquation ∧ K.existenceSolution ∧ K.uniquenessSolution

theorem kolmogorov_forward_equations_closed_from_evidence (K : KolmogorovForwardEquations) (E : KolmogorovForwardEquationsEvidence K) :
    KolmogorovForwardEquationsClosed K := by
  exact And.intro E.initialDistributionClosed (And.intro E.forwardEquationClosed (And.intro E.existenceSolutionClosed E.uniquenessSolutionClosed))

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse