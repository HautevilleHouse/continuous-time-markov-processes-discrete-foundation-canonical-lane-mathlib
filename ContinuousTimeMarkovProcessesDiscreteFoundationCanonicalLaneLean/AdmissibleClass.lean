import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : MarkovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse
