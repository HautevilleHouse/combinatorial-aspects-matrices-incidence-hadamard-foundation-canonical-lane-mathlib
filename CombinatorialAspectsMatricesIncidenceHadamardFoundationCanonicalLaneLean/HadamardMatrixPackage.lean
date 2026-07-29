import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure HadamardMatrixPackage where
  order : ℕ
  matrix : ℕ → ℕ → ℤ
  entriesAreOneOrNegOne : Prop
  rowsOrthogonal : Prop
  orderModFourCondition : Prop

structure HadamardMatrixEvidence (H : HadamardMatrixPackage) where
  entriesAreOneOrNegOneClosed : H.entriesAreOneOrNegOne
  rowsOrthogonalClosed : H.rowsOrthogonal
  orderModFourConditionClosed : H.orderModFourCondition

def HadamardMatrixClosed (H : HadamardMatrixPackage) : Prop :=
  H.entriesAreOneOrNegOne ∧ H.rowsOrthogonal ∧ H.orderModFourCondition

theorem hadamard_matrix_closed_from_evidence (H : HadamardMatrixPackage) (E : HadamardMatrixEvidence H) :
    HadamardMatrixClosed H := by
  exact And.intro E.entriesAreOneOrNegOneClosed
    (And.intro E.rowsOrthogonalClosed E.orderModFourConditionClosed)

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse