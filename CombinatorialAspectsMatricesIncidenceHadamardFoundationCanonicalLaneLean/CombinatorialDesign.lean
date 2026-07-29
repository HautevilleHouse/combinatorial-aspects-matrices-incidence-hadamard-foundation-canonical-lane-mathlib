import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.IncidenceMatrix

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure CombinatorialDesignPackage (I : IncidenceMatrixPackage) where
  blocks : Nat
  points : Nat
  eachBlockSize : Nat
  eachPointFrequency : Nat
  designParameters : I.rows = blocks ∧ I.columns = points

structure CombinatorialDesignEvidence {I : IncidenceMatrixPackage} (D : CombinatorialDesignPackage I) where
  eachBlockSizeClosed : D.eachBlockSize > 0
  eachPointFrequencyClosed : D.eachPointFrequency > 0
  paramConsistency : D.designParameters.1 ∧ D.designParameters.2

def CombinatorialDesignClosed {I : IncidenceMatrixPackage} (D : CombinatorialDesignPackage I) : Prop :=
  D.eachBlockSize > 0 ∧ D.eachPointFrequency > 0 ∧ D.designParameters.1 ∧ D.designParameters.2

theorem combinatorialDesign_closed_from_evidence {I : IncidenceMatrixPackage} (D : CombinatorialDesignPackage I) (E : CombinatorialDesignEvidence D) : CombinatorialDesignClosed D := by
  rcases E with ⟨h1, h2, ⟨h3, h4⟩⟩
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse
