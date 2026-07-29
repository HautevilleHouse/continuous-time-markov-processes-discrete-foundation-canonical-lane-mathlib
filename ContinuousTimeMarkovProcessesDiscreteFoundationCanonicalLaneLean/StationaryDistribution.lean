import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.MarkovChainStateSpace
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.GeneratorMatrix

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure StationaryDistribution (S : StateSpace) (G : GeneratorMatrix S) where
  invariantMeasure : Prop
  existence : Prop
  uniqueness : Prop
  ergodicTheorem : Prop

structure StationaryDistributionEvidence {S : StateSpace} {G : GeneratorMatrix S} (P : StationaryDistribution S G) where
  invariantMeasureClosed : P.invariantMeasure
  existenceClosed : P.existence
  uniquenessClosed : P.uniqueness
  ergodicTheoremClosed : P.ergodicTheorem

def StationaryDistributionClosed {S : StateSpace} {G : GeneratorMatrix S} (P : StationaryDistribution S G) : Prop :=
  P.invariantMeasure ∧ P.existence ∧ P.uniqueness ∧ P.ergodicTheorem

theorem stationary_distribution_closed_from_evidence {S : StateSpace} {G : GeneratorMatrix S} (P : StationaryDistribution S G) (E : StationaryDistributionEvidence P) : StationaryDistributionClosed P :=
  by
    exact And.intro E.invariantMeasureClosed (And.intro E.existenceClosed (And.intro E.uniquenessClosed E.ergodicTheoremClosed))

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse
