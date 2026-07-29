import ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean.GeneratorMatrix

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean

structure MarkovFamily (S : DiscreteStateSpace) (G : GeneratorMatrix S) where
  timeHomogeneous : Prop
  semigroupProperty : Prop
  fellerProperty : Prop
  infinitesimalGeneratorIsG : Prop
  conservative : Prop

def MarkovFamilyClosed {S : DiscreteStateSpace} {G : GeneratorMatrix S} (M : MarkovFamily S G) : Prop :=
  M.timeHomogeneous ∧ M.semigroupProperty ∧ M.fellerProperty ∧ M.infinitesimalGeneratorIsG ∧ M.conservative

end ContinuousTimeMarkovProcessesDiscreteFoundationCanonicalLaneLean
end HautevilleHouse