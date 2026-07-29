import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure MarkovAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  markovProcess : Prop
  discreteUnderlying : Prop
  conclusion : markovProcess ∧ discreteUnderlying

def MarkovWitnessClosed (O : MarkovAdmittedObject) : Prop :=
  O.markovProcess ∧ O.discreteUnderlying

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse
