import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure IncidenceMatrixPackage where
  rows : Nat
  columns : Nat
  matrix : List (List Nat)
  binaryEntries : Prop

structure IncidenceMatrixEvidence (I : IncidenceMatrixPackage) where
  binaryEntriesClosed : I.binaryEntries
  dimensionsMatch : I.rows = I.matrix.length ∧ I.columns = (I.matrix.get? 0).map (·.length) |>.getD 0

def IncidenceMatrixClosed (I : IncidenceMatrixPackage) : Prop :=
  I.binaryEntries ∧ I.rows = I.matrix.length ∧ I.columns = (I.matrix.get? 0).map (·.length) |>.getD 0

theorem incidenceMatrix_closed_from_evidence (I : IncidenceMatrixPackage) (E : IncidenceMatrixEvidence I) : IncidenceMatrixClosed I := by
  rcases E with ⟨h, ⟨r, c⟩⟩
  exact And.intro h (And.intro r c)

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse
