import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure StateSpace where
  stateType : Type u
  countableSet : Prop
  stateTypeTopology : TopologicalSpace stateType

default instance : TopologicalSpace (StateSpace.stateType { stateType := Unit, countableSet := by trivial, stateTypeTopology := inferInstance }) := inferInstance

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse
