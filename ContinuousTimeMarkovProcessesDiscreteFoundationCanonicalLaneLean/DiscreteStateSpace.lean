import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

/-!
# Discrete State Space Package

This module defines the discrete (countable) state space together with
a probability distribution on it. The state space can be finite or countable infinite.
-/

structure DiscreteStateSpace where
  Carrier : Type u
  [DecidableEq Carrier]
  countable : Fintype Carrier ∨ Infinite Carrier
  probabilityDistribution : Carrier → ℝ≥0
  sumToOne : ∑ x : Carrier, probabilityDistribution x = 1

structure DiscreteStateSpaceEvidence (S : DiscreteStateSpace) where
  countableClosed : S.countable
  sumToOneClosed : S.sumToOne

def DiscreteStateSpaceClosed (S : DiscreteStateSpace) : Prop :=
  S.countable ∧ S.sumToOne

theorem discrete_state_space_closed_from_evidence (S : DiscreteStateSpace)
    (E : DiscreteStateSpaceEvidence S) : DiscreteStateSpaceClosed S :=
  And.intro E.countableClosed E.sumToOneClosed

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse