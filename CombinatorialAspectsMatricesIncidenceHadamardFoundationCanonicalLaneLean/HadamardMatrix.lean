import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.IncidenceMatrix

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure HadamardMatrixPackage (I : IncidenceMatrixPackage) where
  matrix : I.matrix
  orthogonalRows : Prop
  entriesPlusMinusOne : Prop

structure HadamardMatrixEvidence {I : IncidenceMatrixPackage} (H : HadamardMatrixPackage I) where
  orthogonalRowsClosed : H.orthogonalRows
  entriesPlusMinusOneClosed : H.entriesPlusMinusOne

def HadamardMatrixClosed {I : IncidenceMatrixPackage} (H : HadamardMatrixPackage I) : Prop :=
  H.orthogonalRows ∧ H.entriesPlusMinusOne

theorem hadamardMatrix_closed_from_evidence {I : IncidenceMatrixPackage} (H : HadamardMatrixPackage I) (E : HadamardMatrixEvidence H) : HadamardMatrixClosed H := by
  exact And.intro E.orthogonalRowsClosed E.entriesPlusMinusOneClosed

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse
