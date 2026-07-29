import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure CombinatorialExistencePackage where
  matrixOrder : ℕ
  hadamardExists : Prop
  designExists : Prop
  codeExists : Prop
  hadamardClosed : hadamardExists
  designClosed : designExists
  codeClosed : codeExists

structure CombinatorialExistenceEvidence (C : CombinatorialExistencePackage) where
  hadamardClosed : C.hadamardExists
  designClosed : C.designExists
  codeClosed : C.codeExists

def CombinatorialExistenceClosed (C : CombinatorialExistencePackage) : Prop :=
  C.hadamardExists ∧ C.designExists ∧ C.codeExists

theorem combinatorial_existence_closed_from_evidence (C : CombinatorialExistencePackage)
    (E : CombinatorialExistenceEvidence C) : CombinatorialExistenceClosed C := by
  exact And.intro E.hadamardClosed (And.intro E.designClosed E.codeClosed)

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse