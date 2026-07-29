import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.MarkovChainStateSpace
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.GeneratorMatrix

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure HoldingTimesJumpProcess (S : StateSpace) (G : GeneratorMatrix S) where
  holdingTimeExpDistributed : Prop
  jumpChainEmbedded : Prop
  samplePathRegular : Prop
  markovPropertyHolds : Prop

structure HoldingTimesJumpProcessEvidence {S : StateSpace} {G : GeneratorMatrix S} (H : HoldingTimesJumpProcess S G) where
  holdingTimeExpDistributedClosed : H.holdingTimeExpDistributed
  jumpChainEmbeddedClosed : H.jumpChainEmbedded
  samplePathRegularClosed : H.samplePathRegular
  markovPropertyHoldsClosed : H.markovPropertyHolds

def HoldingTimesJumpProcessClosed {S : StateSpace} {G : GeneratorMatrix S} (H : HoldingTimesJumpProcess S G) : Prop :=
  H.holdingTimeExpDistributed ∧ H.jumpChainEmbedded ∧ H.samplePathRegular ∧ H.markovPropertyHolds

theorem holding_times_jump_process_closed_from_evidence {S : StateSpace} {G : GeneratorMatrix S} (H : HoldingTimesJumpProcess S G) (E : HoldingTimesJumpProcessEvidence H) : HoldingTimesJumpProcessClosed H :=
  by
    exact And.intro E.holdingTimeExpDistributedClosed (And.intro E.jumpChainEmbeddedClosed (And.intro E.samplePathRegularClosed E.markovPropertyHoldsClosed))

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse
