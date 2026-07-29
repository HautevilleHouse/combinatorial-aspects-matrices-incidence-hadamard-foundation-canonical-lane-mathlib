import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.HadamardMatrix

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure CodingTheoryPackage {I : IncidenceMatrixPackage} (H : HadamardMatrixPackage I) where
  codeLength : Nat
  codeSize : Nat
  minimumDistance : Nat
  hadamardCodeConstruction : H.matrix = I.matrix

structure CodingTheoryEvidence {I : IncidenceMatrixPackage} {H : HadamardMatrixPackage I} (C : CodingTheoryPackage H) where
  codeLengthPos : C.codeLength > 0
  codeSizePos : C.codeSize > 0
  minDistPos : C.minimumDistance > 0
  constructionMatch : C.hadamardCodeConstruction

def CodingTheoryClosed {I : IncidenceMatrixPackage} {H : HadamardMatrixPackage I} (C : CodingTheoryPackage H) : Prop :=
  C.codeLength > 0 ∧ C.codeSize > 0 ∧ C.minimumDistance > 0 ∧ C.hadamardCodeConstruction

theorem codingTheory_closed_from_evidence {I : IncidenceMatrixPackage} {H : HadamardMatrixPackage I} (C : CodingTheoryPackage H) (E : CodingTheoryEvidence C) : CodingTheoryClosed C := by
  rcases E with ⟨h1, h2, h3, h4⟩
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse
