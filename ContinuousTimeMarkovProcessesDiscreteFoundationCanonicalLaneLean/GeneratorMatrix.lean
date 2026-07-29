import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.MarkovChainStateSpace

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure GeneratorMatrix (S : StateSpace) where
  domain : S.stateType → Prop
  offDiagonalNonnegative : Prop
  rowSumsZero : Prop
  conservative : Prop

structure GeneratorMatrixEvidence {S : StateSpace} (G : GeneratorMatrix S) where
  offDiagonalNonnegativeClosed : G.offDiagonalNonnegative
  rowSumsZeroClosed : G.rowSumsZero
  conservativeClosed : G.conservative

def GeneratorMatrixClosed {S : StateSpace} (G : GeneratorMatrix S) : Prop :=
  G.offDiagonalNonnegative ∧ G.rowSumsZero ∧ G.conservative

theorem generator_matrix_closed_from_evidence {S : StateSpace} (G : GeneratorMatrix S) (E : GeneratorMatrixEvidence G) : GeneratorMatrixClosed G :=
  by
    exact And.intro E.offDiagonalNonnegativeClosed (And.intro E.rowSumsZeroClosed E.conservativeClosed)

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse
