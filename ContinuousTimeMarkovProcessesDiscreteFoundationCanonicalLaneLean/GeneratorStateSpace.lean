import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure GeneratorStateSpace where
  stateSet : Type u
  topology : TopologicalSpace stateSet
  discreteTopology : Prop
  sigmaAlgebraMeasurable : Prop
  markovProperty : Prop

structure GeneratorStateSpaceEvidence (S : GeneratorStateSpace) where
  discreteTopologyClosed : S.discreteTopology
  sigmaAlgebraMeasurableClosed : S.sigmaAlgebraMeasurable
  markovPropertyClosed : S.markovProperty

def GeneratorStateSpaceClosed (S : GeneratorStateSpace) : Prop :=
  S.discreteTopology ∧ S.sigmaAlgebraMeasurable ∧ S.markovProperty

theorem generator_state_space_closed_from_evidence (S : GeneratorStateSpace) (E : GeneratorStateSpaceEvidence S) :
    GeneratorStateSpaceClosed S := by
  exact And.intro E.discreteTopologyClosed (And.intro E.sigmaAlgebraMeasurableClosed E.markovPropertyClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse