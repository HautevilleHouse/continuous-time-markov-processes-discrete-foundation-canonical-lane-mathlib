import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.MarkovChainStateSpace
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.GeneratorMatrix

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure KolmogorovEquations (S : StateSpace) (G : GeneratorMatrix S) where
  forwardEquation : Prop
  backwardEquation : Prop
  solutionUnique : Prop
  transitionSemigroup : Prop

structure KolmogorovEquationsEvidence {S : StateSpace} {G : GeneratorMatrix S} (K : KolmogorovEquations S G) where
  forwardEquationClosed : K.forwardEquation
  backwardEquationClosed : K.backwardEquation
  solutionUniqueClosed : K.solutionUnique
  transitionSemigroupClosed : K.transitionSemigroup

def KolmogorovEquationsClosed {S : StateSpace} {G : GeneratorMatrix S} (K : KolmogorovEquations S G) : Prop :=
  K.forwardEquation ∧ K.backwardEquation ∧ K.solutionUnique ∧ K.transitionSemigroup

theorem kolmogorov_equations_closed_from_evidence {S : StateSpace} {G : GeneratorMatrix S} (K : KolmogorovEquations S G) (E : KolmogorovEquationsEvidence K) : KolmogorovEquationsClosed K :=
  by
    exact And.intro E.forwardEquationClosed (And.intro E.backwardEquationClosed (And.intro E.solutionUniqueClosed E.transitionSemigroupClosed))

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse
