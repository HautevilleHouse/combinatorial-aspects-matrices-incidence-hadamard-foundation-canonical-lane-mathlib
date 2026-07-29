import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure HadamardMatrixPackage where
  order : Nat
  matrixType : Type u
  orthogonalRows : Prop
  entriesPlusMinusOne : Prop
  maximalDeterminant : Prop
  equivalenceUnderSignPermutations : Prop
  conferenceMatrixExtension : Prop

structure HadamardMatrixEvidence (H : HadamardMatrixPackage) where
  orthogonalRowsClosed : H.orthogonalRows
  entriesPlusMinusOneClosed : H.entriesPlusMinusOne
  maximalDeterminantClosed : H.maximalDeterminant
  equivalenceUnderSignPermutationsClosed : H.equivalenceUnderSignPermutations
  conferenceMatrixExtensionClosed : H.conferenceMatrixExtension

def HadamardMatrixClosed (H : HadamardMatrixPackage) : Prop :=
  H.orthogonalRows ∧ H.entriesPlusMinusOne ∧ H.maximalDeterminant ∧
  H.equivalenceUnderSignPermutations ∧ H.conferenceMatrixExtension

theorem hadamard_matrix_closed_from_evidence (H : HadamardMatrixPackage)
    (E : HadamardMatrixEvidence H) : HadamardMatrixClosed H := by
  exact And.intro E.orthogonalRowsClosed
    (And.intro E.entriesPlusMinusOneClosed
      (And.intro E.maximalDeterminantClosed
        (And.intro E.equivalenceUnderSignPermutationsClosed
          E.conferenceMatrixExtensionClosed)))

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse
