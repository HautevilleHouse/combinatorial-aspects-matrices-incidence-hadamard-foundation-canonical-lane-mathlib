import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.CombinatorialDesign

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure SymmetricDesignPackage {I : IncidenceMatrixPackage} (D : CombinatorialDesignPackage I) where
  isSymmetric : D.blocks = D.points
  incidenceMatrixEquality : I.rows = I.columns

structure SymmetricDesignEvidence {I : IncidenceMatrixPackage} {D : CombinatorialDesignPackage I} (S : SymmetricDesignPackage D) where
  symmetricClosed : S.isSymmetric
  matrixSquareClosed : S.incidenceMatrixEquality

def SymmetricDesignClosed {I : IncidenceMatrixPackage} {D : CombinatorialDesignPackage I} (S : SymmetricDesignPackage D) : Prop :=
  S.isSymmetric ∧ S.incidenceMatrixEquality

theorem symmetricDesign_closed_from_evidence {I : IncidenceMatrixPackage} {D : CombinatorialDesignPackage I} (S : SymmetricDesignPackage D) (E : SymmetricDesignEvidence S) : SymmetricDesignClosed S := by
  exact And.intro E.symmetricClosed E.matrixSquareClosed

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse
