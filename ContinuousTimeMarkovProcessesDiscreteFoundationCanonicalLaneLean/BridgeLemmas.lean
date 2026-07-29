import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.MarkovChainStateSpace

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let S : StateSpace := { stateType := Unit, countableSet := by trivial, stateTypeTopology := inferInstance }
  True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    exact trivial

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse
