import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.ContinuousTimeMarkovDiscreteFoundation

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure InfinitesimalGeneratorDiscretizationPackage where
  generator : Type u
  rateMatrix : Type v
  generatorToRateMatrix : Prop
  embeddedJumpChainRates : Prop
  discreteTimeStep : ℝ

structure InfinitesimalGeneratorDiscretizationEvidence (G : InfinitesimalGeneratorDiscretizationPackage) where
  generatorToRateMatrixClosed : G.generatorToRateMatrix
  embeddedJumpChainRatesClosed : G.embeddedJumpChainRates

def InfinitesimalGeneratorDiscretizationClosed (G : InfinitesimalGeneratorDiscretizationPackage) : Prop :=
  G.generatorToRateMatrix ∧ G.embeddedJumpChainRates

theorem infinitesimal_generator_discretization_closed_from_evidence
    (G : InfinitesimalGeneratorDiscretizationPackage)
    (E : InfinitesimalGeneratorDiscretizationEvidence G) :
    InfinitesimalGeneratorDiscretizationClosed G := by
  exact And.intro E.generatorToRateMatrixClosed E.embeddedJumpChainRatesClosed

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse