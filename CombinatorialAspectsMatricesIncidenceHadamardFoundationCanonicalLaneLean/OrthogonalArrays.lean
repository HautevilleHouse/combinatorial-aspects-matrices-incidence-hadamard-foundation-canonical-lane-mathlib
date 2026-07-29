import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundation

structure OrthogonalArrayPackage where
  n : ℕ
  strength : ℕ
  symbols : ℕ
  array : Type u
  balanceCondition : Prop
  orthogonalityCondition : Prop

structure OrthogonalArrayEvidence (O : OrthogonalArrayPackage) where
  balanceClosed : O.balanceCondition
  orthogonalityClosed : O.orthogonalityCondition

def OrthogonalArrayClosed (O : OrthogonalArrayPackage) : Prop :=
  O.balanceCondition ∧ O.orthogonalityCondition

theorem orthogonal_array_closed_from_evidence (O : OrthogonalArrayPackage)
    (E : OrthogonalArrayEvidence O) : OrthogonalArrayClosed O := by
  exact And.intro E.balanceClosed E.orthogonalityClosed

end CombinatorialAspectsMatricesIncidenceHadamardFoundation
end HautevilleHouse
